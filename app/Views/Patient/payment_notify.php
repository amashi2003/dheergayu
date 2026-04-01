<?php
/**
 * /dheergayu/app/Views/Patient/payment_notify.php
 * PayHere IPN (Instant Payment Notification) Handler.
 *
 * PayHere POST fields received:
 *   merchant_id, order_id, payment_id, payhere_amount, payhere_currency,
 *   status_code, md5sig, custom_1 (user_id), custom_2 (cart_id)
 *
 * Status codes:  2 = success | 0 = pending | -1 = cancelled | -2 = failed
 */

// IPN must not start sessions the usual way – use a separate name
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

require_once __DIR__ . '/../../../config/payhere_config.php';
require_once __DIR__ . '/../../../config/config.php';

// ── Log all incoming notifications ───────────────────────────────────────────
$logDir  = __DIR__ . '/../../../logs/';
$logFile = $logDir . 'payhere_notifications.log';

if (!is_dir($logDir)) {
    mkdir($logDir, 0755, true);
}

$logLine = date('Y-m-d H:i:s') . " | POST=" . json_encode($_POST) . "\n";
file_put_contents($logFile, $logLine, FILE_APPEND);

// ── Read POST data ────────────────────────────────────────────────────────────
$merchant_id      = $_POST['merchant_id']      ?? '';
$order_id         = $_POST['order_id']         ?? '';
$payhere_amount   = $_POST['payhere_amount']   ?? '';
$payhere_currency = $_POST['payhere_currency'] ?? '';
$status_code      = (int)($_POST['status_code'] ?? -99);
$md5sig           = $_POST['md5sig']           ?? '';
$payment_id       = $_POST['payment_id']       ?? '';
$custom_1         = $_POST['custom_1']         ?? '';  // user_id
$custom_2         = $_POST['custom_2']         ?? '';  // cart_id (optional)

// ── Verify signature ──────────────────────────────────────────────────────────
$isValid = verifyPayherePayment(
    $merchant_id, $order_id, $payhere_amount,
    $payhere_currency, $status_code, $md5sig
);

if (!$isValid) {
    file_put_contents($logFile,
        date('Y-m-d H:i:s') . " | INVALID SIGNATURE for order $order_id\n",
        FILE_APPEND
    );
    http_response_code(400);
    echo "Invalid payment verification";
    exit;
}

// ── Act on status ─────────────────────────────────────────────────────────────
if ($status_code == 2) {
    // ── Payment successful ────────────────────────────────────────────────────
    // Call process-order via HTTP so it runs in full context with a session
    $userId = $custom_1 ? (int)$custom_1 : null;

    $postData = http_build_query([
        'action'         => 'process',
        'order_id'       => $order_id,
        'payment_id'     => $payment_id,
        'amount'         => $payhere_amount,
        'user_id'        => $userId ?? 0,
        // Customer details are not sent by PayHere IPN; order may have been
        // pre-created with them already by the pending call in payment.php.
    ]);

    $ctx = stream_context_create([
        'http' => [
            'method'  => 'POST',
            'header'  => "Content-Type: application/x-www-form-urlencoded\r\n",
            'content' => $postData,
            'timeout' => 15,
        ]
    ]);

    $response = @file_get_contents(
        'http://localhost/dheergayu/public/api/process-order.php',
        false, $ctx
    );

    $result = $response ? json_decode($response, true) : null;

    file_put_contents($logFile,
        date('Y-m-d H:i:s') . " | PROCESSED order=$order_id result=" . json_encode($result) . "\n",
        FILE_APPEND
    );

    echo "Payment processed";

} elseif ($status_code == 0) {
    // Pending (e.g. bank transfer)
    $stmt = $conn->prepare(
        "UPDATE orders SET status = 'pending' WHERE order_id = ?"
    );
    if ($stmt) {
        $stmt->bind_param('s', $order_id);
        $stmt->execute();
        $stmt->close();
    }
    echo "Payment pending";

} elseif ($status_code == -1) {
    // Cancelled by user
    $stmt = $conn->prepare(
        "UPDATE orders SET status = 'cancelled' WHERE order_id = ?"
    );
    if ($stmt) {
        $stmt->bind_param('s', $order_id);
        $stmt->execute();
        $stmt->close();
    }
    echo "Payment cancelled";

} else {
    // Failed (-2) or chargeback (-3)
    $stmt = $conn->prepare(
        "UPDATE orders SET status = 'failed' WHERE order_id = ?"
    );
    if ($stmt) {
        $stmt->bind_param('s', $order_id);
        $stmt->execute();
        $stmt->close();
    }
    echo "Payment failed";
}

$conn->close();