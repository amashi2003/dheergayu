<?php
// Pharmacist uses a separate session — must be called AFTER PHARMACIST_SID session is started
$_role = strtolower($_SESSION['user_role'] ?? $_SESSION['user_type'] ?? '');
if (empty($_SESSION['logged_in']) || $_role !== 'pharmacist') {
    header('Location: /dheergayu/app/Views/Patient/login.php'); exit;
}
