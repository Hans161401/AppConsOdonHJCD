<?php
  require_once 'config/conexion.php';

  class Logevent{
    public function login(){
      $db = Connection::connect(); //Instanciación Connection
      $sql = 'Select * From roles'; //Instrucción sql
      $data = $db->query($sql); //Solicitud sql - Verificar error
      var_dump($data);
      //echo $db;
      die();
    }

  }
?>