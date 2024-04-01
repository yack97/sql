CREATE database TiendaOnline;
use TiendaOnline;

CREATE TABLE Usuarios
(
id_usuario INT PRIMARY KEY,
nombre VARCHAR (100),
correo VARCHAR (100),
contrasena VARCHAR (50),
fecha_cracion TIMESTAMP
);

CREATE TABLE `Productos` (
  `id_productos` int NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion` varchar(250) DEFAULT NULL,
  `precio` varchar(45) DEFAULT NULL,
  `stock` int DEFAULT NULL,
  `fecha_agregado` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_productos`)
);

CREATE TABLE carrito
(
id_carrito INT PRIMARY KEY,
id_usuario INT,
fecha_creacion TIMESTAMP,
FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);

CREATE TABLE `TiendaOnline`.`DetalleCarrito` (
  `idDetalleCarrito` INT NOT NULL,
  `idCarrito` INT NULL,
  `id_producto` INT NULL,
  `Cantidad` INT NULL,
  `FechaAgregado` VARCHAR(45) NULL,
  PRIMARY KEY (`idDetalleCarrito`),
  INDEX `fk1_idx` (`id_producto` ASC) VISIBLE,
  INDEX `fk2_idx` (`idCarrito` ASC) VISIBLE,
  CONSTRAINT `fk1`
    FOREIGN KEY (`id_producto`)
    REFERENCES `TiendaOnline`.`Productos` (`id_productos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk2`
    FOREIGN KEY (`idCarrito`)
    REFERENCES `TiendaOnline`.`carrito` (`id_carrito`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

