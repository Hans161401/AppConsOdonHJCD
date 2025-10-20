<?php
  require_once 'backend/productos.php';
  $producto = new Producto();
  $productos = $producto->getProductos();
?>
<!-- Catálogo de productos -->
<div class='Conthcc'>
  <?php while($dato = $productos->fetch_object()): ?>
    <div class='product'>
      <img src="assets/products/<?=$dato->nombre_imagen ?>">
      <h3><?=$dato->nombre_producto ?></h3>
      <p><?=$dato->valor_producto ?></p>
      <a href="#" class='Bt1'>Comprar</a>
    </div>
  <?php endwhile; ?>
</div>
