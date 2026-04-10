<?php
header('Content-Type: application/json');
require_once __DIR__ . '/../../config/config.php';

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    echo json_encode(['success' => false, 'error' => 'Method not allowed']);
    exit;
}

function input(string $key): string
{
    return trim((string)($_POST[$key] ?? ''));
}

try {
    $email = input('email');
    $identifier = input('nic'); // NIC for patients, phone for other user types
    $identifierDigits = preg_replace('/\D+/', '', $identifier);
    $newPassword = input('new_password');
    $confirmPassword = input('confirm_password');

    if ($email === '' || $identifier === '' || $newPassword === '' || $confirmPassword === '') {
        throw new Exception('Please fill all required fields.');
    }

    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        throw new Exception('Please provide a valid email address.');
    }

    if ($newPassword !== $confirmPassword) {
        throw new Exception('Passwords do not match.');
    }

    if (!preg_match('/^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*]).{8,}$/', $newPassword)) {
        throw new Exception('Password must be 8+ chars with uppercase, lowercase, number and special character.');
    }

    $targetTable = '';
    $idColumn = 'id';
    $userRow = null;

    // 1) Patient by email + NIC
    $patientStmt = $conn->prepare("SELECT id FROM patients WHERE email = ? AND nic = ? LIMIT 1");
    $patientStmt->bind_param('ss', $email, $identifier);
    $patientStmt->execute();
    $userRow = $patientStmt->get_result()->fetch_assoc();
    $patientStmt->close();
    if ($userRow) {
        $targetTable = 'patients';
    }

    // 2) Internal users by email + phone (entered in NIC field)
    if (!$userRow && $identifierDigits !== '') {
        $usersStmt = $conn->prepare("SELECT id FROM users WHERE email = ? AND REPLACE(phone,' ','') = ? LIMIT 1");
        $usersStmt->bind_param('ss', $email, $identifierDigits);
        $usersStmt->execute();
        $userRow = $usersStmt->get_result()->fetch_assoc();
        $usersStmt->close();
        if ($userRow) {
            $targetTable = 'users';
        }
    }

    // 3) Suppliers by email + phone (entered in NIC field)
    if (!$userRow && $identifierDigits !== '') {
        $supStmt = $conn->prepare("SELECT id FROM suppliers WHERE email = ? AND REPLACE(phone,' ','') = ? LIMIT 1");
        $supStmt->bind_param('ss', $email, $identifierDigits);
        $supStmt->execute();
        $userRow = $supStmt->get_result()->fetch_assoc();
        $supStmt->close();
        if ($userRow) {
            $targetTable = 'suppliers';
        }
    }

    if (!$userRow) {
        throw new Exception('Verification failed. Check email and NIC/phone.');
    }

    $hashedPassword = password_hash($newPassword, PASSWORD_DEFAULT);
    $updateSql = "UPDATE {$targetTable} SET password = ? WHERE {$idColumn} = ?";
    $updateStmt = $conn->prepare($updateSql);
    $updateStmt->bind_param('si', $hashedPassword, $userRow[$idColumn]);
    $updateStmt->execute();
    $updateStmt->close();

    echo json_encode(['success' => true, 'message' => 'Password reset successful. Please login with your new password.']);
} catch (Exception $e) {
    http_response_code(400);
    echo json_encode(['success' => false, 'error' => $e->getMessage()]);
} finally {
    if (isset($conn)) {
        $conn->close();
    }
}
?>
