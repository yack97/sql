CREATE SCHEMA `restaurantes` ;

USE restaurantes;

CREATE TABLE restaurante (
restaurante_id int not null, 
nombre varchar(50) null,
foto varchar(100) null,
direccion varchar(100) null,
horario_atencion varchar(25) null,
calificacion int null,
primary key (restaurante_id)
);


CREATE TABLE plato (
plato_id int not null, 
nombre varchar(50) null,
descripcion varchar(100) null,
foto varchar(100) null,
precio decimal(10,2) null,
restaurante_id int not null,
categoria_id int not null,
primary key (plato_id)
);


CREATE TABLE ingrediente (
ingrediente_id int not null, 
nombre varchar(50) null,
descripcion varchar(100) null,
plato_id int not null,
primary key (ingrediente_id)
);

CREATE TABLE categoria (
categoria_id int not null, 
nombre varchar(50) null,
descripcion varchar(100) null,
primary key (categoria_id)
);


CREATE TABLE pedido (
pedido_id int not null, 
fecha_hora_pedido datetime null,
cantidad int null,
precio decimal(10,2) null,
total decimal(12,2) null,
aclaraciones varchar(200) null,
direccion_entrega varchar(100) null,
fecha_hora_envio datetime null,
usuario_id int not null, 
plato_id int not null, 
primary key (pedido_id)
);

CREATE TABLE usuario (
usuario_id int not null, 
nombre varchar(50) null,
telefono varchar(25) null,
direccion varchar(200) null,
puerta varchar(2) null,
piso varchar(2) null,
departamento varchar(2) null,
aclaraciones varchar(200) null,
email varchar(50) not null,
contrasena varchar(50) not null,
fecha_contrasena date not null,
estado_baja bool not null, 
fecha_baja date null, 
primary key (usuario_id)
);



CREATE TABLE renovacion (
renovacion_id int not null, 
usuario_id int not null, 
tipo_usuario_id int not null, 
fecha_alta date not null,
fecha_vencimiento date null, 
primary key (renovacion_id)
);


CREATE TABLE tipo_usuario (
tipo_usuario_id int not null, 
nombre varchar(10) null, 
primary key (tipo_usuario_id)
);



ALTER TABLE `restaurantes`.`plato` 
ADD CONSTRAINT `categoria`
  FOREIGN KEY (`categoria_id`)
  REFERENCES `restaurantes`.`categoria` (`categoria_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `restaurante`
  FOREIGN KEY (`restaurante_id`)
  REFERENCES `restaurantes`.`restaurante` (`restaurante_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
  
  
  ALTER TABLE `restaurantes`.`ingrediente` 
ADD CONSTRAINT `plato`
  FOREIGN KEY (`plato_id`)
  REFERENCES `restaurantes`.`plato` (`plato_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
  ALTER TABLE `restaurantes`.`pedido` 
ADD CONSTRAINT `plato_pedido`
  FOREIGN KEY (`plato_id`)
  REFERENCES `restaurantes`.`plato` (`plato_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
    ALTER TABLE `restaurantes`.`pedido` 
ADD CONSTRAINT `usuario`
  FOREIGN KEY (`usuario_id`)
  REFERENCES `restaurantes`.`usuario` (`usuario_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
   ALTER TABLE `restaurantes`.`renovacion` 
ADD CONSTRAINT `tipo_usuario`
  FOREIGN KEY (`tipo_usuario_id`)
  REFERENCES `restaurantes`.`tipo_usuario` (`tipo_usuario_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
     ALTER TABLE `restaurantes`.`renovacion` 
ADD CONSTRAINT `usuario_renovacion`
  FOREIGN KEY (`usuario_id`)
  REFERENCES `restaurantes`.`usuario` (`usuario_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;



