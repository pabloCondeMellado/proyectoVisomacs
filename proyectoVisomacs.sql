DROP DATABASE IF EXISTS visomac;
CREATE DATABASE visomac;
USE visomac;
-- Creacion de la base de datos
/*CREATE TABLE persona(
id INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(15),
apellidos VARCHAR(30),
correo VARCHAR(30),
telefono CHAR(9)
);*/
CREATE TABLE empresa(
id INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(30),
correo VARCHAR(30),
sede VARCHAR(15)
);
DESCRIBE empresa;
CREATE TABLE proveedor(
id INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(15),
apellidos VARCHAR(30),
correo VARCHAR(30),
telefono CHAR(9),
id_empresa INT NOT NULL,
CONSTRAINT fk_empresa FOREIGN KEY (id_empresa) REFERENCES empresa(id)
);
DESCRIBE proveedor;
CREATE TABLE categoria_cliente(
id INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(30),
descuento CHAR(4)
);
DESCRIBE categoria_cliente;
CREATE TABLE cliente(
id INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(20),
apellidos VARCHAR(30),
correo VARCHAR(30),
telefono CHAR(9),
categoria_cli INT NOT NULL,
CONSTRAINT fk_categoria_cli FOREIGN KEY (categoria_cli) REFERENCES categoria_cliente(id)
);
DESCRIBE cliente;
CREATE TABLE direccion(
id INT PRIMARY KEY AUTO_INCREMENT,
id_cliente INT NOT NULL,
ciudad VARCHAR(10),
calle VARCHAR(30),
codigo_postal CHAR(5),
bloque VARCHAR(5),
piso VARCHAR(5),
CONSTRAINT fk_cliente2 FOREIGN KEY (id_cliente) REFERENCES cliente(id)
);
DESCRIBE direccion;
CREATE TABLE producto(
id INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(25),
memoria VARCHAR(10),
color VARCHAR(10),
anio_fabricacion CHAR(4),
categoria VARCHAR(15),
precio DECIMAL(6,2),
descripcion VARCHAR(200)
);
DESCRIBE producto;
CREATE TABLE entrega(
id INT PRIMARY KEY AUTO_INCREMENT,
fecha_entrega DATE,
id_proveedor INT NOT NULL,
id_producto INT NOT NULL,
CONSTRAINT fk_proveedor FOREIGN KEY (id_proveedor) REFERENCES proveedor(id),
CONSTRAINT fk_producto FOREIGN KEY (id_producto) REFERENCES producto(id)
);
DESCRIBE entrega;
CREATE TABLE compra(
id INT PRIMARY KEY AUTO_INCREMENT,
id_producto INT NOT NULL,
id_cliente INT NOT NULL,
fecha_compra DATE,
cantidad CHAR(3),
precio_total DECIMAL (6,2),
id_direccion INT NOT NULL,
CONSTRAINT fk_producto2 FOREIGN KEY (id_producto) REFERENCES producto(id),
CONSTRAINT fk_cliente FOREIGN KEY (id_cliente) REFERENCES cliente(id),
CONSTRAINT fk_direccion FOREIGN KEY (id_direccion) REFERENCES direccion(id)
);
DESCRIBE compra;

-- Inserts 
INSERT INTO empresa (nombre,correo,sede) VALUES
	('Apple','apple321@gmail.com','Madrid'),
	('MediaMarkt','mediamartventas@gmail.com','Sevilla'),
	('Aiho','aihoventas@gmail.com','Valencia'),
	('McFactory','mcfactorypostventas@gmail.com','Barcelona'),
	('mResell','mresellproveedor@gmail.com','Sevilla');

INSERT INTO proveedor (nombre,apellidos,correo,telefono,id_empresa) VALUES
	('Mario Rafael','Moreno Escribano', '37mariome37@gmail.com','659240496',1),
	('Octavio','Montero Oliva','octmonoli21@gmail.com','684357129',2),
	('Javier', 'Morales Jimenez','javmorjim3@gmail.com','632948751',3),
	('Saul','Moreno Moreno','saumormor24@gmail.com','620189324',4),
	('Francisco','Ruiz Florido','fraruflo13@gmail.com','639285147',5);

INSERT INTO categoria_cliente (nombre, descuento) VALUES 
	('Nuevo','0%'),
	('Bronce','5%'),
	('Plata','10%'),
	('Oro','15%'),
	('Platino','20%');
INSERT INTO cliente (nombre,apellidos,correo,telefono,categoria_cli) VALUES
	('David','Lopez Jimenez','dalopjim@gmail.com','602531948',5),
	('Ana Isabel','Garcia Galocha','angargal34@gmail.com','78495621',4),
	('Maria','Guillen Mateos','marguimat@gmail.com','849516230',2),
	('Leandro Antonio','Vidal Nuniez','leavidnu95@gmail.com','66666633',1),
	('Pablo','Humanes Gandul','pabhu,gan@gmail.com','759260310',3);
INSERT INTO direccion(id_cliente,ciudad,calle,codigo_postal,bloque,piso) VALUES
	(1,'Sevilla','C/Santa Justa Nº20','41510',NULL,NULL),
	(1,'Sevilla','C/Benajete Nº15','41510','33','3A'),
	(2,'Sevilla','C/Santa Maria Nº5','41510','3','2B'),
	(3,'Madrid','C/Barajas Nº13','45203',NULL,NULL),
	(4,'Malaga','C/Fabelas Nº2','46321','5','6C'),
	(4,'Valencia','C/Mestaya Nº94','48263',NULL,NULL),
	(5,'Cadiz','C/Illojuan Nº3','48952',NULL,NULL),
	(5,'Malaga','C/Andres Nº16','46832','1','5A');
INSERT INTO producto(nombre,memoria,color,anio_fabricacion,categoria,precio,descripcion) VALUES
	('Iphone 14 Pro','256GB','Negro','2021','Iphone','840.0','Presenta leves marcas esteticas en el lateral. Se entrega con cargador y un año de garantía'),
	('Iphone 11','128GB','Blanco','2019','Iphone','370.0','EN perfecto estado. Se entrega con cargador y 1 año de garantía'),
	('Airpods Pro Gen 2',NULL,'Blanco','2020','Airpdos','170.0','Perfecto estado. Se entrga con embalaje original y 1 año de garantía'),
	('Mackbook pro','512GB','Plata','2019','MAckbook','755.65','MAckbook 15 pulgadas, equipado con el procesador i9-9880H,16gb RAM, presenta leves marcas de uso. La batería presenta 444 ciclos de carga. Se entrega con cargador '),
	('Mackbook air','256Gb','Plata','2020','MAckbook','550.90','Mackbook air 13 pulgadas equipado con procesador i3-1000NG4, 8Gb RAM. Preenta leves marcas de uso. La batería presenta 211 ciclos de carga. Se entrega con cargador y 1 año de garantía'),
	('Watch serie 7','8Gb','Azul','2021','Watch','270.0','Se presenta en perfecto correa de 45mm. Se entrega con embalaje original y 1 año de garantía'),
	('Ipad Pro','512Gb','Gris','2020','Ipad','765.50','Ipad Pro 11 pulgadas. Presenta leves marcas de uso, se entrega con cargador y 1 año de garantía'),
	('Ipad','512Gb','Gris','2020','Ipad','550.0','Ipad 11 pulgadas. Presenta leves marcas de uso, se entrefa con cargador y 1 año de garantía'),
	('iMac 4K','1Tb','Plata','2019','iMac','860.0','iMac 4K 21.5 pulgadas, procesador i5-8500 8GB RAM grafica Drive/Radeon PRO 560X 4GB. Se encuentra en perfecto estado. Se entrega sin teclado ni raton y 1 año de garantia'),
	('Mac mini','256Gb','Plata','2020','Mac','630.90','Mac mini con procesador M1, 8Gb RAM. Se encuenta en perfecto estado estético y de funcionamiento. Se entrega con 1 año de garantía'),
	('Iphone 13','256Gb','Rosa','2022','Iphone','670.0','Iphone 13 presenta leves marcas estéticas. Se entrega con cargador y 1 año de garantía'),
	('Iphone 15','128Gb','Negro','2023','Iphone','940.50','Iphone 15 presenta leves marcas de uso. Se entrega con cargador y 1 año de garantía');

INSERT INTO entrega(fecha_entrega,id_proveedor,id_producto) VALUES
	('2023-03-07',4,12),
	('2024-01-25',2,1),
	('2024-02-16',5,2),
	('2023-05-12',1,6),
	('2023-06-18',3,9),
	('2023-07-23',2,5),
	('2023-08-30',4,10),
	('2023-09-14',5,3),
	('2023-10-01',1,8),
	('2023-11-08',3,11),
	('2023-12-20',2,7),
	('2024-03-01',4,4);
INSERT INTO compra(id_producto,id_cliente,fecha_compra,cantidad,precio_total,id_direccion)VALUES
	(1,1,'2023-10-27',7,'5880.0',1),
	(7,1,'2023-10-17',2,'1531.0',2),
	(11,4,'2024-02-03',1,'670.0',6),
	(2,3,'2023-11-15',1,'370.0',4), 
    (4,4,'2023-12-10',3,'1891.95',6), 
    (5,5,'2024-01-05',1,'270.0',7),   
    (8,4,'2023-09-05',1,'550.0',5),   
    (12,2,'2024-02-15',2,'1881.0',3),
    (3,3,'2023-06-30',2,'340.0',4),   
    (9,4,'2023-10-20',1,'765.50',5),  
    (6,5,'2023-08-12',1,'170.0',8),   
    (1,3,'2023-09-20',5,'4200.0',4),  
    (10,2,'2023-11-30',1,'630.90',4);

