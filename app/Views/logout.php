<?php
// Universal logout — handles all session types

// Default session
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}
session_unset();
session_destroy();
if (isset($_COOKIE[session_name()])) {
    setcookie(session_name(), '', time() - 3600, '/');
}

// Pharmacist session
session_write_close();
session_name('PHARMACIST_SID');
session_start();
session_unset();
session_destroy();
if (isset($_COOKIE['PHARMACIST_SID'])) {
    setcookie('PHARMACIST_SID', '', time() - 3600, '/');
}

// Supplier session
session_write_close();
session_name('SUPPLIER_SID');
session_start();
session_unset();
session_destroy();
if (isset($_COOKIE['SUPPLIER_SID'])) {
    setcookie('SUPPLIER_SID', '', time() - 3600, '/');
}

header('Location: /dheergayu/app/Views/Patient/login.php');
exit;
