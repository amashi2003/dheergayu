<?php
// Supplier uses a separate session — must be called AFTER SUPPLIER_SID session is started
$_role = strtolower($_SESSION['user_role'] ?? $_SESSION['user_type'] ?? '');
if (empty($_SESSION['logged_in']) || $_role !== 'supplier') {
    header('Location: /dheergayu/app/Views/Patient/login.php'); exit;
}
