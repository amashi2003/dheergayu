<?php
require_once(__DIR__ . "/../../config/config.php");

// Handle POST - toggle patient account status
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['action']) && $_POST['action'] === 'update_status') {
    header('Content-Type: application/json');

    $patient_id = (int)($_POST['patient_id'] ?? 0);
    $new_status = $_POST['status'] ?? '';

    if (!$patient_id || !in_array($new_status, ['active', 'deactivated'])) {
        echo json_encode(['success' => false, 'message' => 'Invalid input']);
        exit;
    }

    $stmt = $conn->prepare("UPDATE patient_info SET account_status = ? WHERE patient_id = ?");
    $stmt->bind_param('si', $new_status, $patient_id);

    if ($stmt->execute()) {
        echo json_encode(['success' => true]);
    } else {
        echo json_encode(['success' => false, 'message' => $conn->error]);
    }
    exit;
}

// Handle GET - fetch all patients
$sql = "SELECT
    p.id,
    COALESCE(NULLIF(TRIM(p.patient_number), ''), CONCAT('P', LPAD(p.id, 3, '0'))) AS patient_number,
    CONCAT(p.first_name, ' ', p.last_name) AS name,
    p.email,
    p.nic,
    p.dob,
    p.created_at AS reg_date,
    COALESCE(NULLIF(pi.phone, ''), '-') AS phone,
    COALESCE(pi.account_status, 'active') AS account_status
FROM patients p
LEFT JOIN patient_info pi ON p.id = pi.patient_id
ORDER BY p.created_at DESC";

$result = $conn->query($sql);
$patients = [];
if ($result) {
    while ($row = $result->fetch_assoc()) {
        $patients[] = $row;
    }
}

header('Content-Type: application/json');
echo json_encode($patients);
$conn->close();
?>
