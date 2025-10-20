<?php
  require_once 'config/conexion.php';

  class Producto{
    private $db;

    public function __construct(){
      $this->db = Connection::connect();
    }

    public function getProductos($limit=4){
      $result = false;
      $sql = "SELECT id_producto, nombre_producto, valor_producto, nombre_imagen
              FROM productos, imagenes WHERE id_producto = id_producto_imagen
              Group By id_producto Order By Rand() limit $limit";
      $datos = $this->db->query($sql);
      if($datos && $datos->num_rows > 0)
        $result = $datos;
      return $result;
    }

  }
?>