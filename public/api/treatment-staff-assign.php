<?php
header('Content-Type: application/json');
session_start();
require_once __DIR__ . '/../../config/config.php';
$_role = strtolower($_SESSION['user_role'] ?? $_SESSION['user_type'] ?? '');
if (empty($_SESSION['logged_in']) || $_role !== 'admin') {
    echo json_encode(['success' => false, 'message' => 'Unauthorized']); exit;
}

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode(['success' => false, 'message' => 'POST only']);
    exit;
}

$treatmentId = (int)($_POST['treatment_id'] ?? 0);
$staff1Id    = (int)($_POST['staff1_id'] ?? 0);
$staff2Id    = (int)($_POST['staff2_id'] ?? 0);

if ($treatmentId <= 0) {
    echo json_encode(['success' => false, 'message' => 'Invalid treatment']);
    exit;
}

$s1 = $staff1Id > 0 ? $staff1Id : null;
$s2 = $staff2Id > 0 ? $staff2Id : null;

// Upsert into treatment_staff
$check = $conn->prepare("SELECT treatment_id FROM treatment_staff WHERE treatment_id = ? LIMIT 1");
$check->bind_param('i', $treatmentId);
$check->execute();
$exists = $check->get_result()->num_rows > 0;
$check->close();

if ($exists) {
    $stmt = $conn->prepare("UPDATE treatment_staff SET primary_staff1_id = ?, primary_staff2_id = ? WHERE treatment_id = ?");
    $stmt->bind_param('iii', $s1, $s2, $treatmentId);
} else {
    $stmt = $conn->prepare("INSERT INTO treatment_staff (treatment_id, primary_staff1_id, primary_staff2_id) VALUES (?, ?, ?)");
    $stmt->bind_param('iii', $treatmentId, $s1, $s2);
}

if ($stmt->execute()) {
    echo json_encode(['success' => true]);
} else {
    echo json_encode(['success' => false, 'message' => $stmt->error]);
}
$stmt->close();
