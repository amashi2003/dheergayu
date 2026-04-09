<?php
// API endpoint to get products with available quantities
header('Content-Type: application/json');

try {
    // Use the same database connection as other models
    $db = new mysqli('localhost', 'root', '', 'dheergayu_db');
    
    if ($db->connect_error) {
        throw new Exception("Database connection failed: " . $db->connect_error);
    }
    
    $today = date('Y-m-d');

    // Get prescribable products (exclude treatment oils) with available and expired quantities
    $sql = "SELECT p.product_id, p.name, p.product_type AS product_source,
                   COALESCE(SUM(CASE WHEN b.exp >= '$today' OR b.exp IS NULL THEN b.quantity ELSE 0 END), 0) AS available_quantity,
                   COALESCE(SUM(CASE WHEN b.exp < '$today' THEN b.quantity ELSE 0 END), 0) AS expired_quantity
            FROM products p
            LEFT JOIN batches b ON b.product_id = p.product_id
            WHERE p.product_type != 'treatment'
            GROUP BY p.product_id, p.name, p.product_type
            ORDER BY p.name";

    $result = $db->query($sql);

    if (!$result) {
        throw new Exception("Query failed: " . $db->error);
    }

    $formattedProducts = [];
    while ($row = $result->fetch_assoc()) {
        $formattedProducts[] = [
            'id' => (int)$row['product_id'],
            'name' => $row['name'],
            'product_source' => $row['product_source'],
            'available_quantity' => (int)$row['available_quantity'],
            'expired_quantity' => (int)$row['expired_quantity']
        ];
    }
    
    $db->close();
    
    echo json_encode([
        'success' => true,
        'products' => $formattedProducts
    ]);
    
} catch (Exception $e) {
    error_log("Error getting products: " . $e->getMessage());
    echo json_encode([
        'success' => false,
        'error' => 'Failed to load products: ' . $e->getMessage()
    ]);
}
?>
