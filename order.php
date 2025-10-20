<?php
// order.php - guarda pedidos en assets/database/orders.json
$raw = file_get_contents('php://input');
$data = json_decode($raw, true);
if(!$data){
    http_response_code(400);
    echo json_encode(['success'=>false,'error'=>'invalid_json']);
    exit;
}
$dir = __DIR__ . '/assets/database';
if(!is_dir($dir)) mkdir($dir, 0755, true);
$file = $dir . '/orders.json';
$orders = [];
if(file_exists($file)) $orders = json_decode(file_get_contents($file), true) ?: [];
$id = uniqid('order_');
$entry = ['id'=>$id,'buyer'=>$data['buyer'] ?? 'Anonimo','cart'=>$data['cart'] ?? [], 'date'=>$data['date'] ?? date('c')];
$orders[] = $entry;
file_put_contents($file, json_encode($orders, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE));
echo json_encode(['success'=>true,'id'=>$id]);
?>