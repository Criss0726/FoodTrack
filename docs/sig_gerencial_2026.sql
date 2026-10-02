CREATE DATABASE IF NOT EXISTS sig_gerencial_incb
CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci;
USE sig_gerencial_incb;

DROP TABLE IF EXISTS detalle_ventas;
DROP TABLE IF EXISTS ventas;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS empleados;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS categorias;

CREATE TABLE categorias (
 id_categoria INT AUTO_INCREMENT PRIMARY KEY,
 nombre_categoria VARCHAR(60) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE clientes (
 id_cliente INT AUTO_INCREMENT PRIMARY KEY,
 nombre_cliente VARCHAR(100) NOT NULL,
 telefono VARCHAR(20),
 correo VARCHAR(100)
) ENGINE=InnoDB;

CREATE TABLE empleados (
 id_empleado INT AUTO_INCREMENT PRIMARY KEY,
 nombre_empleado VARCHAR(100) NOT NULL,
 cargo VARCHAR(60) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE productos (
 id_producto INT AUTO_INCREMENT PRIMARY KEY,
 nombre_producto VARCHAR(100) NOT NULL,
 id_categoria INT NOT NULL,
 precio_unitario DECIMAL(10,2) NOT NULL,
 stock INT NOT NULL,
 CONSTRAINT fk_productos_categorias FOREIGN KEY (id_categoria)
 REFERENCES categorias(id_categoria) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE ventas (
 id_venta INT AUTO_INCREMENT PRIMARY KEY,
 id_cliente INT NOT NULL,
 id_empleado INT NOT NULL,
 fecha_venta DATE NOT NULL,
 total_venta DECIMAL(10,2) NOT NULL,
 CONSTRAINT fk_ventas_clientes FOREIGN KEY (id_cliente)
 REFERENCES clientes(id_cliente) ON DELETE RESTRICT ON UPDATE CASCADE,
 CONSTRAINT fk_ventas_empleados FOREIGN KEY (id_empleado)
 REFERENCES empleados(id_empleado) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE detalle_ventas (
 id_detalle INT AUTO_INCREMENT PRIMARY KEY,
 id_venta INT NOT NULL,
 id_producto INT NOT NULL,
 cantidad INT NOT NULL,
 precio_unitario DECIMAL(10,2) NOT NULL,
 subtotal DECIMAL(10,2) NOT NULL,
 CONSTRAINT fk_detalle_ventas FOREIGN KEY (id_venta)
 REFERENCES ventas(id_venta) ON DELETE CASCADE ON UPDATE CASCADE,
 CONSTRAINT fk_detalle_productos FOREIGN KEY (id_producto)
 REFERENCES productos(id_producto) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

INSERT INTO categorias (nombre_categoria) VALUES
('Bebidas'),('Granos Básicos'),('Lácteos'),('Panadería'),('Enlatados'),
('Snacks'),('Condimentos'),('Limpieza'),('Higiene Personal'),('Frutas'),
('Verduras'),('Carnes'),('Embutidos'),('Congelados'),('Dulces'),
('Cereales'),('Salsas'),('Aceites'),('Pastas'),('Harinas');

INSERT INTO clientes (nombre_cliente,telefono,correo) VALUES
('Ana Martínez','7000-1001','ana.martinez@gmail.com'),
('Carlos López','7000-1002','carlos.lopez@gmail.com'),
('María Hernández','7000-1003','maria.hernandez@gmail.com'),
('José Ramírez','7000-1004','jose.ramirez@gmail.com'),
('Laura García','7000-1005','laura.garcia@gmail.com'),
('Miguel Flores','7000-1006','miguel.flores@gmail.com'),
('Sofía Rivera','7000-1007','sofia.rivera@gmail.com'),
('Daniel Cruz','7000-1008','daniel.cruz@gmail.com'),
('Elena Torres','7000-1009','elena.torres@gmail.com'),
('Ricardo Castro','7000-1010','ricardo.castro@gmail.com'),
('Patricia Díaz','7000-1011','patricia.diaz@gmail.com'),
('Jorge Morales','7000-1012','jorge.morales@gmail.com'),
('Gabriela Reyes','7000-1013','gabriela.reyes@gmail.com'),
('Andrés Mendoza','7000-1014','andres.mendoza@gmail.com'),
('Valeria Ortiz','7000-1015','valeria.ortiz@gmail.com'),
('Fernando Rivas','7000-1016','fernando.rivas@gmail.com'),
('Camila Navarro','7000-1017','camila.navarro@gmail.com'),
('Luis Romero','7000-1018','luis.romero@gmail.com'),
('Natalia Aguilar','7000-1019','natalia.aguilar@gmail.com'),
('Diego Vásquez','7000-1020','diego.vasquez@gmail.com');

INSERT INTO empleados (nombre_empleado,cargo) VALUES
('Cristian Arias','Administrador'),('Oscar Galdámez','Vendedor'),
('Lucio Rodríguez','Encargado de Bodega'),('Eliezer Romero','Vendedor'),
('Leslie Portillo','Control de Calidad'),('Paulina Portillo','Atención al Cliente'),
('Juan Ayala','Supervisor'),('María López','Vendedor'),('Carlos Hernández','Vendedor'),
('Sofía Martínez','Cajero'),('José Flores','Cajero'),('Ana Rivera','Vendedor'),
('Miguel Cruz','Bodega'),('Laura Torres','Vendedor'),('Daniel Castro','Cajero'),
('Gabriela Díaz','Vendedor'),('Andrés Morales','Supervisor'),('Valeria Reyes','Vendedor'),
('Fernando Mendoza','Cajero'),('Camila Ortiz','Vendedor');

INSERT INTO productos (nombre_producto,id_categoria,precio_unitario,stock) VALUES
('Agua embotellada 600ml',1,0.75,80),('Arroz blanco 1 libra',2,1.25,60),
('Leche entera 1 litro',3,1.50,50),('Pan francés unidad',4,0.35,100),
('Atún en lata 140g',5,1.80,45),('Papas fritas 150g',6,1.25,55),
('Sal de mesa 1 libra',7,0.60,70),('Detergente 500g',8,2.25,35),
('Jabón de baño unidad',9,0.85,65),('Manzana unidad',10,0.50,90),
('Tomate libra',11,0.90,70),('Carne de res libra',12,4.75,30),
('Salchicha paquete',13,2.40,40),('Vegetales congelados 500g',14,2.75,35),
('Chocolate unidad',15,0.75,80),('Cereal 400g',16,3.50,30),
('Salsa de tomate 400g',17,1.65,45),('Aceite vegetal 1 litro',18,3.25,40),
('Pasta 400g',19,1.35,60),('Harina de trigo 1 libra',20,1.10,55);

INSERT INTO ventas (id_cliente,id_empleado,fecha_venta,total_venta) VALUES
(1,1,'2026-09-01',1.50),(2,2,'2026-09-02',2.50),
(3,3,'2026-09-03',4.50),(4,4,'2026-09-04',1.75),
(5,5,'2026-09-05',3.60),(6,6,'2026-09-06',3.75),
(7,7,'2026-09-07',3.00),(8,8,'2026-09-08',4.50),
(9,9,'2026-09-09',3.40),(10,10,'2026-09-10',2.00),
(11,11,'2026-09-11',1.80),(12,12,'2026-09-12',9.50),
(13,13,'2026-09-13',4.80),(14,14,'2026-09-14',5.50),
(15,15,'2026-09-15',3.75),(16,16,'2026-09-16',7.00),
(17,17,'2026-09-17',4.95),(18,18,'2026-09-18',9.75),
(19,19,'2026-09-19',4.05),(20,20,'2026-09-20',3.30);

INSERT INTO detalle_ventas (id_venta,id_producto,cantidad,precio_unitario,subtotal) VALUES
(1,1,2,0.75,1.50),(2,2,2,1.25,2.50),(3,3,3,1.50,4.50),
(4,4,5,0.35,1.75),(5,5,2,1.80,3.60),(6,6,3,1.25,3.75),
(7,7,5,0.60,3.00),(8,8,2,2.25,4.50),(9,9,4,0.85,3.40),
(10,10,4,0.50,2.00),(11,11,2,0.90,1.80),(12,12,2,4.75,9.50),
(13,13,2,2.40,4.80),(14,14,2,2.75,5.50),(15,15,5,0.75,3.75),
(16,16,2,3.50,7.00),(17,17,3,1.65,4.95),(18,18,3,3.25,9.75),
(19,19,3,1.35,4.05),(20,20,3,1.10,3.30);

SELECT 'categorias' AS tabla,COUNT(*) AS registros FROM categorias
UNION ALL SELECT 'clientes',COUNT(*) FROM clientes
UNION ALL SELECT 'empleados',COUNT(*) FROM empleados
UNION ALL SELECT 'productos',COUNT(*) FROM productos
UNION ALL SELECT 'ventas',COUNT(*) FROM ventas
UNION ALL SELECT 'detalle_ventas',COUNT(*) FROM detalle_ventas;

SELECT id_venta,total_venta,cantidad,precio_unitario,subtotal,
(cantidad*precio_unitario) AS calculo_subtotal
FROM ventas INNER JOIN detalle_ventas USING(id_venta)
ORDER BY id_venta;
