-- Create on 20250909
-- Databse tiendaonline

CREATE DATABASE IF NOT EXISTS tiendaonline DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

USE tiendaonline;

-- --------------------
-- PARAMETRIC TABLES --
-- --------------------

-- 01
-- Table roles
CREATE TABLE IF NOT EXISTS roles (
  id_rol tinyint NOT NULL AUTO_INCREMENT,
  nombre_rol varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY(id_rol)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1;

-- 02
-- Table marcas
CREATE TABLE IF NOT EXISTS marcas (
  id_marca tinyint NOT NULL AUTO_INCREMENT,
  nombre_marca varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY(id_marca)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1;

-- ---------------------------
-- TABLES WITH FOREIGN KEYS --
-- ---------------------------

-- 03
-- Table usuarios
CREATE TABLE IF NOT EXISTS usuarios (
  id_usuario varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  nombre_usuario varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  email_usuario varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  direccion_usuario varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  telefono_usuario varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  clave_usuario varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  id_rol_usuario tinyint NOT NULL,
  PRIMARY KEY(id_usuario)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

ALTER TABLE usuarios
  ADD KEY(id_rol_usuario),
  ADD CONSTRAINT fk_rol_usuario FOREIGN KEY (id_rol_usuario)
      REFERENCES roles (id_rol)
      on update no action
      on delete no action;

-- 04
-- Table productos
CREATE TABLE IF NOT EXISTS productos (
  id_producto int NOT NULL AUTO_INCREMENT,
  nombre_producto varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  descripcion_producto varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  valor_producto int NOT NULL,
  cantidad_producto int NOT NULL,
  id_marca_producto tinyint NOT NULL,
  PRIMARY KEY(id_producto)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1;

ALTER TABLE productos
  ADD KEY(id_marca_producto),
  ADD CONSTRAINT fk_marca_producto FOREIGN KEY (id_marca_producto)
      REFERENCES marcas (id_marca)
      on update no action
      on delete no action;

-- 05
-- Table imagenes
CREATE TABLE IF NOT EXISTS imagenes (
  nombre_imagen varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  id_producto_imagen int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

ALTER TABLE imagenes
  ADD KEY(id_producto_imagen),
  ADD CONSTRAINT fk_producto_imagen FOREIGN KEY (id_producto_imagen)
      REFERENCES productos (id_producto)
      on update no action
      on delete no action;
