/*     Integrantes: 
July Liseth Ceciliano Miranda
María Fernanda Padilla Benavides
Fernanda Ramírez Monge
*/

/*---------CREACIÓN DE TABLAS---------*/
CREATE TABLE Clientes (
	id_cliente INT PRIMARY KEY ,
	cedula NVARCHAR(20) NOT NULL UNIQUE,
	nombre NVARCHAR(50) NOT NULL,
	apellido1 NVARCHAR(100) NOT NULL,
	apellido2 NVARCHAR(100) NULL,
	direccion NVARCHAR(200) NULL,
	fec_nacimiento DATE NULL
);

CREATE TABLE Clientes_telefonos (
	id_cliente_telefono INT PRIMARY KEY ,
	id_cliente INT FOREIGN KEY REFERENCES Clientes(id_cliente),
	telefono NVARCHAR(10) NOT NULL,
	correo NVARCHAR(50) NULL
);

CREATE TABLE Categorias (
    id_categoria INT PRIMARY KEY ,
    nombre NVARCHAR(255) NOT NULL
);

CREATE TABLE Productos (
    id_producto INT PRIMARY KEY ,
    producto NVARCHAR(200) NOT NULL,
	id_categoria INT FOREIGN KEY REFERENCES Categorias(id_categoria),
	descripcion NVARCHAR(200) NULL,
    monto DECIMAL(10,2) NOT NULL
);

CREATE TABLE Clientes_productos (
	id_cliente_producto INT PRIMARY KEY ,
	id_cliente INT FOREIGN KEY REFERENCES Clientes(id_cliente),
	id_producto INT FOREIGN KEY REFERENCES Productos(id_producto)
);

CREATE TABLE Proveedores (
	id_proveedor INT PRIMARY KEY ,
	nombre NVARCHAR(100) NOT NULL
);

CREATE TABLE Proveedores_productos (
	id_proveedproductos INT PRIMARY KEY ,
	id_proveedor INT FOREIGN KEY REFERENCES Proveedores(id_proveedor),
	id_producto INT FOREIGN KEY REFERENCES Productos(id_producto),
);

CREATE TABLE Proveedores_telefonos (
	id_proveedor_telefono INT PRIMARY KEY ,
	id_proveedor INT FOREIGN KEY REFERENCES Proveedores(id_proveedor),
	telefono NVARCHAR(10) NOT NULL,
	correo NVARCHAR(50) NULL
);

CREATE TABLE Sucursales (
	id_sucursal INT PRIMARY KEY ,
	nombre NVARCHAR(100) NOT NULL,
	telefono NVARCHAR(10) NOT NULL,
	correo NVARCHAR(50) NULL,
	ubicacion NVARCHAR(200) NOT NULL
);

CREATE TABLE Facturacion(
	id_factura INT PRIMARY KEY ,
    fec_factura DATE NOT NULL,
	id_cliente INT FOREIGN KEY REFERENCES Clientes(id_cliente),
    mon_total DECIMAL (10, 2) NOT NULL, 
    mon_iva DECIMAL (10, 2) NOT NULL, 
    metodopago NVARCHAR(50) NOT NULL,
	id_sucursal INT FOREIGN KEY REFERENCES Sucursales(id_sucursal)
);

CREATE TABLE Facturacion_detalle (
	id_factura_detalle INT PRIMARY KEY ,
	id_factura INT FOREIGN KEY REFERENCES Facturacion(id_factura),
	num_linea NVARCHAR(50) NOT NULL,
	id_producto INT FOREIGN KEY REFERENCES Productos(id_producto)
);

CREATE TABLE Historial_pagos(
	id_historial INT PRIMARY KEY ,
	id_factura INT FOREIGN KEY REFERENCES Facturacion(id_factura),
	id_cliente INT FOREIGN KEY REFERENCES Clientes(id_cliente)
);

/*---------INSERCIÓN DE DATOS---------*/

INSERT INTO Clientes(id_cliente, cedula, nombre, apellido1,apellido2,direccion,fec_nacimiento) VALUES
(1, '111542548', 'Gabriel', 'Garcia', 'Marquez','San Jose','1967-05-30'),
(2, '402540551', 'Ana','Perez','Gonzalez', 'Heredia','1984-07-02'),
(3, '201540356', 'Juan','Alvarez','Zuñiga', 'Alajuela','1985-06-15'),
(4, '125481248', 'Anabelle', 'Lopez', 'Sibaja','San Jose','1980-03-12'),
(5, '506580592', 'Laura','Gutierrez','Ramirez', 'Guanacaste','1974-03-17'),
(6, '305480215', 'Samuel','Hernandez','Solera', 'Cartago','2004-04-01'),
(7, '603540877', 'Lucia', 'Rivera', 'Zamora','Puntarenas','1954-11-20'),
(8, '407540335', 'Daniela','Cortes','Rojas', 'Heredia','1995-10-07'),
(9, '204810485', 'Felipe','Diaz','Jimenez', 'Alajuela','1993-12-10'),
(10, '166571341', 'Alexis', 'Viquez', 'Morales','San Jose','1997-09-08'),
(11, '705540361', 'Rodolfo','Villegas','Arauz', 'Limon','2000-01-18'),
(12, '305480125', 'Catalina','Sanchez','Vega', 'Cartago','1996-08-04'),
(13, '504580356', 'Natalia', 'Chacon', 'Miranda','Guanacaste','1998-03-29'),
(14, '124581239', 'Luis Diego','Alfaro','Campos', 'San Jose','1966-02-10'),
(15, '206560087', 'Fabian','Mora','Suarez', 'Alajuela','1973-09-03');

INSERT INTO Clientes_telefonos (id_cliente_telefono, id_cliente, telefono, correo)
VALUES
(1, 1, '22631526','gabriel@example.com'),
(2, 2, '84876589','ana@example.com'),
(3, 3, '74872563','juan@example.com'),
(4, 4, '85154634','anabelle@example.com'),
(5, 5, '86482145','laura@example.com'),
(6, 6, '65458742','samuel@example.com'),
(7, 7, '22651842','lucia@example.com'),
(8, 8, '84874671','daniela@example.com'),
(9, 9, '85458478','felipe@example.com'),
(10, 10, '74584514','alexis@example.com'),
(11, 11, '74853124','rodolfo@example.com'),
(12, 12, '62484582','catalina@example.com'),
(13, 13, '88545456','natalia@example.com'),
(14, 14, '64524571','luisdi@example.com'),
(15, 15, '82135125','fabian@example.com');

INSERT INTO Categorias (id_categoria, nombre)
VALUES
	(1, 'audio y amplificacion'),
	(2, 'cables'),
	(3, 'percusion'),
	(4, 'microfonos'),
	(5, 'teclados y pianos'),
	(6, 'discos de música'),
	(7, 'accesorios'),
	(8, 'tocadiscos y agujas'),
	(9, 'conectores de audio y video'),
	(10, 'instrumentos de viento'),
	(11, 'libros y métodos musicales'),
	(12, 'guitarras y bajos'),
	(13, 'ukeleles, mandolinas y banjos'),
	(14, 'violines, contrabajos y cellos'),
	(15, 'equipo para grabación'),
	(16, 'souvenirs de música');

INSERT INTO Productos (id_producto, producto, id_categoria, descripcion, monto)
VALUES
    (1, 'Amplificador Audífonos BEHRINGER AMP800', 1, 'Ultracompacto sistema de amplificación de 9.5” para auriculares en aplicaciones de estudio y directo', 55370),
    (2, 'Cable 1/4 Mono a Cannon MACH.12pulg', 2, 'Modelo: HMC-312 cod.100218012', 5322.3),
    (3, 'Cuerda Suelta para bajo MAGMA .125 Modelo: BS125N',7, 'Una cuerda suelta calibre .125', 5683.9),
	(4, 'Imagine Dragons night visions', 6, 'Album de banda Imagine Dragons. Fecha de lanzamiento: 4 setiembre 2013', 10000),
	(5, 'Libro de partitura Pink Floyd The Wall Modelo: AM76696 cod. 180257', 11, 'Incluye fotografías,  y canciones del album original', 25375.28),
	(6, 'Barra China con stand 24-BAR', 3, 'Modelo: CH-250 cod.100601', 54240),
	(7, 'Tocadisco Automatico Rojo con bluetooth AUDIO TECHNICA', 8, 'Modelo: ATH-LP60XBT-RD cod.1301044', 160002.35),
	(8, 'Cello 3/4 Cervini/Cremona', 14, 'Modelo: HC-100 3/4 cod.091147 Incluye funda acolchada', 259900 ),
	(9, 'Caña de tenor Vandoren- Clasiq 2 1/2', 10, 'Modelo: SR2225 cod.119847', 4633),
	(10, 'Banjo de cinco cuerdas Holmer', 13, 'Modelo: BJ005 cod.0902175 Resonador de caoba laminada', 142154),
	(11, 'Bolsa para ukelele concert Piña On-Stage', 7, 'Modelo: GBU4204PA cod.0701604 Construido con nylon resistente, repelente al agua', 11783.64),
	(12, 'Bajo 5 cuerdas Jackson JS3Q Spectra V Allien Burst', 12, 'Modelo: 2919904516 cod.0903087 Instrumento leviatán de 5 cuerdas', 436180),
	(13, 'Melodica de 37 teclas MD-37', 5, 'cod.150109 Boquillas intercambiables', 24484.84),
	(14, 'Controlador BEHRINGER Modelo: X-TOUCH ONE cod.020722000', 15, 'Controlador Universal de sobremesa USB DAW para aplicaciones Studio y Live', 197750),
	(15, 'Capsula de microfono SENNHEISER Modelo: MMD835 cod.280305150', 4, 'Incluye una rejilla de metal y reemplaza las cápsulas defectuosas o dañadas', 84750),
	(16, 'Portavasos D’andrea',16, 'Set 4', 8990.28),
	(17, 'Are You Experienced', 6, 'Album de The Jimi Hendrix Experience', 17466.8),
	(18, 'Summer: The Original Hits', 6, 'Album de Donna Summer', 6011.25),
	(19, 'Buena Vista Social Club', 6, 'Album de Buena Vista Social Club ', 13130.25),
	(20, 'Ride The Lightning Remastered',6, 'Album de Metallica', 5625),
	(21, 'The Blueprint', 6, 'Album de Jay-Z', 14169.75),
	(22, 'ARTPOP Explicit Lyrics', 6, 'Album de Lady Gaga', 14127.75),
	(23, 'Squier Guitarra acústica Fender', 12, 'guitarra acústica Fender SA-150 Dreadnought', 65619.75),
	(24, 'Yamaha PSR-EW310 Teclado portátil de 76 teclas', 5, 'teclado PSRE EW300', 141744.75),
	(25, 'Epiphone Les Paul Clásico Desgastado', 12, 'guitarra eléctrica de madera de arce', 235725);

INSERT INTO Clientes_productos (id_cliente_producto, id_cliente, id_producto)
VALUES
	(1, 1, 1),
	(2, 1, 15),
	(3, 3, 10),
	(4, 6, 13),
	(5, 12, 4),
	(6, 9, 6),
	(7, 5, 8),
	(8, 11, 7),
	(9, 10, 5),
	(10, 8, 5),
	(11, 3, 2),
	(12, 4, 14),
	(13, 2, 8),
	(14, 7, 9),
	(15, 15, 11),
	(16, 13, 3),
	(17, 14, 1);

INSERT INTO Proveedores (id_proveedor, nombre)
VALUES
	(1, 'Trades Music'),
	(2, 'Econo Music'),
	(3, 'Royal Pianos'),
	(4, 'Siete Octavas'),
	(5, 'Hipermusic');
	
INSERT INTO Proveedores_productos (id_proveedproductos, id_proveedor, id_producto)
VALUES
	(1, 1, 15),
	(2, 2, 14),
	(3, 3, 13),
	(4, 4, 12),
	(5, 1, 11),
	(6, 2, 10),
	(7, 3, 9),
	(8, 4, 8),
	(9, 5, 7),
	(10, 5, 6),
	(11, 2, 5),
	(12, 4, 4),
	(13, 1, 3),
	(14, 3, 2),
	(15, 2, 1),
	(16, 4, 15),
	(17, 3, 14),
	(18, 5, 13),
	(19, 5, 12),
	(20, 2, 11),
	(21, 4, 10),
	(22, 5, 9),
	(23, 2, 8),
	(24, 1, 7),
	(25, 1, 6),
	(26, 4, 5),
	(27, 3, 4),
	(28, 2, 3),
	(29, 2, 2),
	(30, 1, 1),
	(31, 5, 16),
	(32, 2, 17),
	(33, 3, 18),
	(34, 1, 19),
	(35, 4, 20),
	(36, 5, 21),
	(37, 3, 22),
	(38, 2, 23),
	(39, 5, 24),
	(40, 1, 25),
	(41, 1, 16),
	(42, 4, 17),
	(43, 2, 18),
	(44, 5, 19),
	(45, 2, 20),
	(46, 3, 21),
	(47, 1, 22),
	(48, 5, 23),
	(49, 4, 24),
	(50, 3, 25);

INSERT INTO Proveedores_telefonos (id_proveedor_telefono, id_proveedor, telefono, correo)
VALUES
	(1, 1, '22645832', 'tradesmusic@ventas.com'),
	(2, 1, '88852154', ''),
	(3, 2, '22548354', 'economusic@ventas.com'),
	(4, 3, '24863484', 'royalpianos@ventas.com'),
	(5, 3, '89645334', ''),
	(6, 4, '25887634', 'sieteoctavos@ventas.com'),
	(7, 5, '23648424', 'hipermusic@ventas.com');
	
INSERT INTO Sucursales (id_sucursal, nombre, telefono, correo, ubicacion)
VALUES
	(1, 'Tienda San Jose', '22644512','ventassanjose@example.com','San Jose' ),
	(2, 'Tienda Heredia', '22608545', 'ventasheredia@example.com', 'Heredia'),
	(3, 'Tienda Alajuela', '24558633', 'ventasalajuela@example.com', 'Alajuela'),
	(4, 'Tienda Guanacaste', '26448234', 'ventasguanacaste@example.com', 'Guanacaste'),
	(5, 'Tienda Cartago', '68224581', 'ventascartago@example.com', 'Cartago');

/*Método pago efectivo = transferencia*/
INSERT INTO Facturacion (id_factura, fec_factura, id_cliente, mon_total, mon_iva, metodopago, id_sucursal)
VALUES
	(1, '2023-05-01', 1, 140120, 18215.6, 'Tarjeta', 1),
	(2, '2023-04-01', 2, 259900, 33787, 'Efectivo', 2),
	(3, '2023-04-01', 3, 147476.3, 19171.92, 'Tarjeta', 3),
	(4, '2023-11-15', 4, 197750, 25707.5, 'Tarjeta', 1),
	(5, '2023-12-06', 5, 259900, 33787, 'Tarjeta', 4),
	(6, '2023-12-10', 6, 24484.84, 3183.03, 'Efectivo', 5),
	(7, '2023-06-11', 7, 4633, 602.29, 'Sinpe', 1),
	(8, '2023-05-09', 8, 25375.28, 3298.79, 'Tarjeta', 2),
	(9, '2023-07-12', 9, 54240, 7051.2, 'Tarjeta', 3),
	(10, '2023-07-15', 10, 25375.28, 3298.79, 'Efectivo', 1),
	(11, '2023-03-20', 11, 160002.35, 20800.31, 'Tarjeta', 1),
	(12, '2023-10-16', 12, 10000, 1300, 'Tarjeta', 5),
	(13, '2023-08-13', 15, 11783.64, 1531.87, 'Efectivo', 3),
	(14, '2023-09-04', 13, 5683.9, 8525.85, 'Sinpe', 4),
	(15, '2023-11-02', 14, 55370, 7198.1, 'Tarjeta', 1),
	(16, '2024-01-15', 5, 10000, 1300, 'Tarjeta', 4),
	(17, '2024-02-01', 4, 55370, 7198.1, 'Tarjeta', 1),
	(18, '2023-12-15', 6, 25375.28, 3298.79, 'Tarjeta', 5);

INSERT INTO Facturacion_detalle (id_factura_detalle, id_factura, num_linea, id_producto)
VALUES
    (1, 1, 1, 1),
	(2, 1, 2, 15),
	(3, 2, 1, 8),
	(4, 3, 1, 10),
	(5, 3, 2, 2),
	(6, 4, 1, 14),
	(7, 5, 1, 8),
	(8, 6, 1, 13),
	(9, 7, 1, 9),
	(10, 8, 1, 5),
	(11, 9, 1, 6),
	(12, 10, 1, 5),
	(13, 11, 1, 7),
	(14, 12, 1, 4),
	(15, 13, 1, 3),
	(16, 14, 1, 1),
	(17, 15, 1, 11),
	(18, 16, 1, 4),
	(19, 17, 1, 1),
	(20, 18, 1, 5);

INSERT INTO Historial_pagos (id_historial, id_factura, id_cliente)
VALUES
	(1, 1, 1),
	(2, 2, 2),
	(3, 3, 3),
	(4, 4, 4),
	(5, 5, 5),
	(6, 6, 6),
	(7, 7, 7),
	(8, 8, 8),
	(9, 9, 9),
	(10, 10, 10),
	(11, 11, 11),
	(12, 12, 12),
	(13, 13, 15),
	(14, 14, 13),
	(15, 15, 14),
	(16, 16, 5),
	(17, 17, 4),
	(18, 18, 6);

/*---------INSERCIONES ADICIONALES DE VENTAS PARA TODO EL 2023---------*/

/*MÁS INSERTS PARA ENERO 2023*/

INSERT INTO Historial_pagos (id_historial, id_factura, id_cliente)
VALUES
    (19, 19, 1),
    (20, 20, 2),
    (21, 21, 3),
    (22, 22, 4),
    (23, 23, 5),
    (24, 24, 6),
    (25, 25, 7),
    (26, 26, 8),
    (27, 27, 9),
    (28, 28, 10),
    (29, 29, 11),
    (30, 30, 12),
    (31, 31, 15),
    (32, 32, 13),
    (33, 33, 14),
    (34, 34, 5),
    (35, 35, 4),
    (36, 36, 6);
    
INSERT INTO Facturacion (id_factura, fec_factura, id_cliente, mon_total, mon_iva, metodopago, id_sucursal)
VALUES
    (19, '2023-01-01', 1, 140120, 18215.6, 'Tarjeta', 1),
    (20, '2023-01-02', 2, 259900, 33787, 'Efectivo', 2),
    (21, '2023-01-03', 3, 147476.3, 19171.92, 'Tarjeta', 3),
    (22, '2023-01-04', 4, 197750, 25707.5, 'Tarjeta', 1),
    (23, '2023-01-05', 5, 259900, 33787, 'Tarjeta', 4),
    (24, '2023-01-06', 6, 24484.84, 3183.03, 'Efectivo', 5),
    (25, '2023-01-07', 7, 4633, 602.29, 'Sinpe', 1),
    (26, '2023-01-08', 8, 25375.28, 3298.79, 'Tarjeta', 2),
    (27, '2023-01-09', 9, 54240, 7051.2, 'Tarjeta', 3),
    (28, '2023-01-10', 10, 25375.28, 3298.79, 'Efectivo', 1),
    (29, '2023-01-11', 11, 160002.35, 20800.31, 'Tarjeta', 1),
    (30, '2023-01-12', 12, 10000, 1300, 'Tarjeta', 5),
    (31, '2023-01-13', 15, 11783.64, 1531.87, 'Efectivo', 3),
    (32, '2023-01-14', 13, 5683.9, 8525.85, 'Sinpe', 4),
    (33, '2023-01-15', 14, 55370, 7198.1, 'Tarjeta', 1),
    (34, '2023-01-16', 5, 10000, 1300, 'Tarjeta', 4),
    (35, '2023-01-17', 4, 55370, 7198.1, 'Tarjeta', 1),
    (36, '2023-01-18', 6, 25375.28, 3298.79, 'Tarjeta', 5);

INSERT INTO Facturacion_detalle (id_factura_detalle, id_factura, num_linea, id_producto)
VALUES
    (21, 19, 1, 1),
    (22, 19, 2, 15),
    (23, 20, 1, 8),
    (24, 21, 1, 10),
    (25, 21, 2, 2),
    (26, 22, 1, 14),
    (27, 23, 1, 8),
    (28, 24, 1, 13),
    (29, 25, 1, 9),
    (30, 26, 1, 5),
    (31, 27, 1, 6),
    (32, 28, 1, 5),
    (33, 29, 1, 7),
    (34, 30, 1, 4),
    (35, 31, 1, 3),
    (36, 32, 1, 1),
    (37, 33, 1, 11),
    (38, 34, 1, 4),
    (39, 35, 1, 1),
    (40, 36, 1, 5);

INSERT INTO Clientes_productos (id_cliente_producto, id_cliente, id_producto)
VALUES
    (18, 1, 1),
    (19, 1, 15),
    (20, 3, 10),
    (21, 6, 13),
    (22, 12, 4),
    (23, 9, 6),
    (24, 5, 8),
    (25, 11, 7),
    (26, 10, 5),
    (27, 8, 5),
    (28, 3, 2),
    (29, 4, 14),
    (30, 2, 8),
    (31, 7, 9),
    (32, 15, 11),
    (33, 13, 3),
    (34, 14, 1);

/*MÁS INSERTS PARA FEBRERO 2023*/

INSERT INTO Historial_pagos (id_historial, id_factura, id_cliente)
VALUES
    (37, 37, 1),
    (38, 38, 2),
    (39, 39, 3),
    (40, 40, 4),
    (41, 41, 5),
    (42, 42, 6),
    (43, 43, 7),
    (44, 44, 8),
    (45, 45, 9),
    (46, 46, 10),
    (47, 47, 11),
    (48, 48, 12),
    (49, 49, 15),
    (50, 50, 13),
    (51, 51, 14),
    (52, 52, 5),
    (53, 53, 4),
    (54, 54, 6);

INSERT INTO Facturacion (id_factura, fec_factura, id_cliente, mon_total, mon_iva, metodopago, id_sucursal)
VALUES
    (37, '2023-02-01', 1, 140120, 18215.6, 'Tarjeta', 1),
    (38, '2023-02-02', 2, 259900, 33787, 'Efectivo', 2),
    (39, '2023-02-03', 3, 147476.3, 19171.92, 'Tarjeta', 3),
    (40, '2023-02-04', 4, 197750, 25707.5, 'Tarjeta', 1),
    (41, '2023-02-05', 5, 259900, 33787, 'Tarjeta', 4),
    (42, '2023-02-06', 6, 24484.84, 3183.03, 'Efectivo', 5),
    (43, '2023-02-07', 7, 4633, 602.29, 'Sinpe', 1),
    (44, '2023-02-08', 8, 25375.28, 3298.79, 'Tarjeta', 2),
    (45, '2023-02-09', 9, 54240, 7051.2, 'Tarjeta', 3),
    (46, '2023-02-10', 10, 25375.28, 3298.79, 'Efectivo', 1),
    (47, '2023-02-11', 11, 160002.35, 20800.31, 'Tarjeta', 1),
    (48, '2023-02-12', 12, 10000, 1300, 'Tarjeta', 5),
    (49, '2023-02-13', 15, 11783.64, 1531.87, 'Efectivo', 3),
    (50, '2023-02-14', 13, 5683.9, 8525.85, 'Sinpe', 4),
    (51, '2023-02-15', 14, 55370, 7198.1, 'Tarjeta', 1),
    (52, '2023-02-16', 5, 10000, 1300, 'Tarjeta', 4),
    (53, '2023-02-17', 4, 55370, 7198.1, 'Tarjeta', 1),
    (54, '2023-02-18', 6, 25375.28, 3298.79, 'Tarjeta', 5);

INSERT INTO Facturacion_detalle (id_factura_detalle, id_factura, num_linea, id_producto)
VALUES
    (41, 37, 1, 1),
    (42, 37, 2, 15),
    (43, 38, 1, 8),
    (44, 39, 1, 10),
    (45, 39, 2, 2),
    (46, 40, 1, 14),
    (47, 41, 1, 8),
    (48, 42, 1, 13),
    (49, 43, 1, 9),
    (50, 44, 1, 5),
    (51, 45, 1, 6),
    (52, 46, 1, 5),
    (53, 47, 1, 7),
    (54, 48, 1, 4),
    (55, 49, 1, 3),
    (56, 50, 1, 1),
    (57, 51, 1, 11),
    (58, 52, 1, 4),
    (59, 53, 1, 1),
    (60, 54, 1, 5);

INSERT INTO Clientes_productos (id_cliente_producto, id_cliente, id_producto)
VALUES
    (39, 1, 1),
    (40, 1, 15),
    (41, 3, 10),
    (42, 6, 13),
    (43, 12, 4),
    (44, 9, 6),
    (45, 5, 8),
    (46, 11, 7),
    (47, 10, 5),
    (48, 8, 5),
    (49, 3, 2),
    (50, 4, 14),
    (51, 2, 8),
    (52, 7, 9),
    (53, 15, 11),
    (54, 13, 3),
    (55, 14, 1);

/*MÁS INSERTS PARA MARZO 2023*/

INSERT INTO Historial_pagos (id_historial, id_factura, id_cliente)
VALUES
    (55, 55, 1),
    (56, 56, 2),
    (57, 57, 3),
    (58, 58, 4),
    (59, 59, 5),
    (60, 60, 6),
    (61, 61, 7),
    (62, 62, 8),
    (63, 63, 9),
    (64, 64, 10),
    (65, 65, 11),
    (66, 66, 12),
    (67, 67, 15),
    (68, 68, 13),
    (69, 69, 14),
    (70, 70, 5),
    (71, 71, 4),
    (72, 72, 6);

INSERT INTO Facturacion (id_factura, fec_factura, id_cliente, mon_total, mon_iva, metodopago, id_sucursal)
VALUES
    (55, '2023-03-01', 1, 140120, 18215.6, 'Tarjeta', 1),
    (56, '2023-03-02', 2, 259900, 33787, 'Efectivo', 2),
    (57, '2023-03-03', 3, 147476.3, 19171.92, 'Tarjeta', 3),
    (58, '2023-03-04', 4, 197750, 25707.5, 'Tarjeta', 1),
    (59, '2023-03-05', 5, 259900, 33787, 'Tarjeta', 4),
    (60, '2023-03-06', 6, 24484.84, 3183.03, 'Efectivo', 5),
    (61, '2023-03-07', 7, 4633, 602.29, 'Sinpe', 1),
    (62, '2023-03-08', 8, 25375.28, 3298.79, 'Tarjeta', 2),
    (63, '2023-03-09', 9, 54240, 7051.2, 'Tarjeta', 3),
    (64, '2023-03-10', 10, 25375.28, 3298.79, 'Efectivo', 1),
    (65, '2023-03-11', 11, 160002.35, 20800.31, 'Tarjeta', 1),
    (66, '2023-03-12', 12, 10000, 1300, 'Tarjeta', 5),
    (67, '2023-03-13', 15, 11783.64, 1531.87, 'Efectivo', 3),
    (68, '2023-03-14', 13, 5683.9, 8525.85, 'Sinpe', 4),
    (69, '2023-03-15', 14, 55370, 7198.1, 'Tarjeta', 1),
    (70, '2023-03-16', 5, 10000, 1300, 'Tarjeta', 4),
    (71, '2023-03-17', 4, 55370, 7198.1, 'Tarjeta', 1),
    (72, '2023-03-18', 6, 25375.28, 3298.79, 'Tarjeta', 5);

INSERT INTO Facturacion_detalle (id_factura_detalle, id_factura, num_linea, id_producto)
VALUES
    (61, 55, 1, 1),
    (62, 55, 2, 15),
    (63, 56, 1, 8),
    (64, 57, 1, 10),
    (65, 57, 2, 2),
    (66, 58, 1, 14),
    (67, 59, 1, 8),
    (68, 60, 1, 13),
    (69, 61, 1, 9),
    (70, 62, 1, 5),
    (71, 63, 1, 6),
    (72, 64, 1, 5),
    (73, 65, 1, 7),
    (74, 66, 1, 4),
    (75, 67, 1, 3),
    (76, 68, 1, 1),
    (77, 69, 1, 11),
    (78, 70, 1, 4),
    (79, 71, 1, 1),
    (80, 72, 1, 5);

INSERT INTO Clientes_productos (id_cliente_producto, id_cliente, id_producto)
VALUES
    (55, 55, 1),
    (56, 56, 15),
    (57, 57, 10),
    (58, 58, 13),
    (59, 59, 4),
    (60, 60, 6),
    (61, 61, 8),
    (62, 62, 7),
    (63, 63, 5),
    (64, 64, 5),
    (65, 65, 2),
    (66, 66, 14),
    (67,67, 8),
    (68, 68, 9),
    (69, 69, 11),
    (70, 70, 3),
    (71, 71, 1);

/*MÁS INSERTS EN ABRIL*/

INSERT INTO Historial_pagos (id_historial, id_factura, id_cliente)
VALUES
	(81, 81, 2),
	(82, 82, 3),
	(83, 83, 4),
	(84, 84, 5),
	(85, 85, 6),
	(86, 86, 7),
	(87, 87, 8),
	(88, 88, 9),
	(89, 89, 10),
	(90, 90, 11),
	(91, 91, 12),
	(92, 92, 15),
	(93, 93, 14),
	(94, 94, 15),
	(95, 95, 5),
	(96, 96, 4),
	(97, 97, 6),
	(98, 98, 1);

INSERT INTO Facturacion (id_factura, fec_factura, id_cliente, mon_total, mon_iva, metodopago, id_sucursal)
VALUES
    (81, '2023-04-01', 1, 140120, 18215.6, 'Tarjeta', 1),
    (82, '2023-04-02', 2, 259900, 33787, 'Efectivo', 2),
    (83, '2023-04-03', 3, 147476.3, 19171.92, 'Tarjeta', 3),
    (84, '2023-04-04', 4, 197750, 25707.5, 'Tarjeta', 1),
    (85, '2023-04-05', 5, 259900, 33787, 'Tarjeta', 4),
    (86, '2023-04-06', 6, 24484.84, 3183.03, 'Efectivo', 5),
    (87, '2023-04-07', 7, 4633, 602.29, 'Sinpe', 1),
    (88, '2023-04-08', 8, 25375.28, 3298.79, 'Tarjeta', 2),
    (89, '2023-04-09', 9, 54240, 7051.2, 'Tarjeta', 3),
    (90, '2023-04-10', 10, 25375.28, 3298.79, 'Efectivo', 1),
    (91, '2023-04-11', 11, 160002.35, 20800.31, 'Tarjeta', 1),
    (92, '2023-04-12', 12, 10000, 1300, 'Tarjeta', 5),
    (93, '2023-04-13', 15, 11783.64, 1531.87, 'Efectivo', 3),
    (94, '2023-04-14', 13, 5683.9, 8525.85, 'Sinpe', 4),
    (95, '2023-04-15', 14, 55370, 7198.1, 'Tarjeta', 1),
    (96, '2023-04-16', 5, 10000, 1300, 'Tarjeta', 4),
    (97, '2023-04-17', 4, 55370, 7198.1, 'Tarjeta', 1),
    (98, '2023-04-18', 6, 25375.28, 3298.79, 'Tarjeta', 5);

INSERT INTO Facturacion_detalle (id_factura_detalle, id_factura, num_linea, id_producto)
VALUES
    (81, 81, 1, 1),
    (82, 81, 2, 15),
    (83, 82, 1, 8),
    (84, 83, 1, 10),
    (85, 83, 2, 2),
    (86, 84, 1, 14),
    (87, 85, 1, 8),
    (88, 86, 1, 13),
    (89, 87, 1, 9),
    (90, 88, 1, 5),
    (91, 89, 1, 6),
    (92, 90, 1, 5),
    (93, 91, 1, 7),
    (94, 92, 1, 4),
    (95, 93, 1, 3),
    (96, 94, 1, 1),
    (97, 95, 1, 11),
    (98, 96, 1, 4),
    (99, 97, 1, 1),
    (100, 98, 1, 5);

INSERT INTO Clientes_productos (id_cliente_producto, id_cliente, id_producto)
VALUES
    (72, 1, 1),
    (73, 1, 15),
    (74, 3, 10),
    (75, 6, 13),
    (76, 12, 4),
    (77, 9, 6),
    (78, 5, 9),
    (79, 11, 7),
    (80, 10, 5),
    (81, 8, 5),
    (82, 3, 2),
    (83, 4, 14),
    (84, 2, 8),
    (85, 7, 9),
    (86, 15, 11),
    (87, 13, 3),
    (88, 14, 1);


/*MÁS INSERTS EN MAYO*/

INSERT INTO Historial_pagos (id_historial, id_factura, id_cliente)
VALUES
	(99, 99, 1),
	(100, 100, 2),
	(101, 101, 3),
	(102, 102, 4),
	(103, 103, 5),
	(104, 104, 6),
	(105, 105, 7),
	(106, 106, 8),
	(107, 107, 9),
	(108, 108, 10),
	(109, 109, 11),
	(110, 110, 12),
	(111, 111, 15),
	(112, 112, 13),
	(113, 113, 14),
	(114, 114, 5),
	(115, 115, 4),
	(116, 116, 6);

INSERT INTO Facturacion (id_factura, fec_factura, id_cliente, mon_total, mon_iva, metodopago, id_sucursal)
VALUES
    (99, '2023-05-01', 1, 140120, 18215.6, 'Tarjeta', 1),
    (100, '2023-05-02', 2, 259900, 33787, 'Efectivo', 2),
    (101, '2023-05-03', 3, 147476.3, 19171.92, 'Tarjeta', 3),
    (102, '2023-05-04', 4, 197750, 25707.5, 'Tarjeta', 1),
    (103, '2023-05-05', 5, 259900, 33787, 'Tarjeta', 4),
    (104, '2023-05-06', 6, 24484.84, 3183.03, 'Efectivo', 5),
    (105, '2023-05-07', 7, 4633, 602.29, 'Sinpe', 1),
    (106, '2023-05-08', 8, 25375.28, 3298.79, 'Tarjeta', 2),
    (107, '2023-05-09', 9, 54240, 7051.2, 'Tarjeta', 3),
    (108, '2023-05-10', 10, 25375.28, 3298.79, 'Efectivo', 1),
    (109, '2023-05-11', 11, 160002.35, 20800.31, 'Tarjeta', 1),
    (110, '2023-05-12', 12, 10000, 1300, 'Tarjeta', 5),
    (111, '2023-05-13', 15, 11783.64, 1531.87, 'Efectivo', 3),
    (112, '2023-05-14', 13, 5683.9, 8525.85, 'Sinpe', 4),
    (113, '2023-05-15', 14, 55370, 7198.1, 'Tarjeta', 1),
    (114, '2023-05-16', 5, 10000, 1300, 'Tarjeta', 4),
    (115, '2023-05-17', 4, 55370, 7198.1, 'Tarjeta', 1),
    (116, '2023-05-18', 6, 25375.28, 3298.79, 'Tarjeta', 5);

INSERT INTO Facturacion_detalle (id_factura_detalle, id_factura, num_linea, id_producto)
VALUES
    (101, 99, 1, 1),
    (102, 99, 2, 15),
    (103, 100, 1, 8),
    (104, 101, 1, 10),
    (105, 101, 2, 2),
    (106, 102, 1, 14),
    (107, 103, 1, 8),
    (108, 104, 1, 13),
    (109, 105, 1, 9),
    (110, 106, 1, 5),
    (111, 107, 1, 6),
    (112, 108, 1, 5),
    (113, 109, 1, 7),
    (114, 110, 1, 4),
    (115, 111, 1, 3),
    (116, 112, 1, 1),
    (117, 113, 1, 11),
    (118, 114, 1, 4),
    (119, 115, 1, 1),
    (120, 116, 1, 5);

INSERT INTO Clientes_productos (id_cliente_producto, id_cliente, id_producto)
VALUES
    (89, 1, 1),
    (90, 1, 15),
    (91, 3, 10),
    (92, 6, 13),
    (93, 12, 4),
    (94, 9, 6),
    (95, 5, 8),
    (96, 11, 7),
    (97, 10, 5),
    (98, 8, 5),
    (99, 3, 2),
    (100, 4, 14),
    (101, 2, 8),
    (102, 7, 9),
    (103, 15, 11),
    (104, 13, 3),
    (105, 14, 1);

/*MÁS INSERTS EN JUNIO*/

INSERT INTO Historial_pagos (id_historial, id_factura, id_cliente)
VALUES
	(121, 121, 1),
	(122, 122, 2),
	(123, 123, 3),
	(124, 124, 4),
	(125, 125, 5),
	(126, 126, 6),
	(127, 127, 7),
	(128, 128, 8),
	(129, 129, 9),
	(130, 130, 10),
	(131, 131, 11),
	(132, 132, 12),
	(133, 133, 15),
	(134, 134, 13),
	(135, 135, 14),
	(136, 136, 5),
	(137, 137, 4),
	(138, 138, 6);

INSERT INTO Facturacion (id_factura, fec_factura, id_cliente, mon_total, mon_iva, metodopago, id_sucursal)
VALUES
    (121, '2023-06-01', 1, 140120, 18215.6, 'Tarjeta', 1),
    (122, '2023-06-02', 2, 259900, 33787, 'Efectivo', 2),
    (123, '2023-06-03', 3, 147476.3, 19171.92, 'Tarjeta', 3),
    (124, '2023-06-04', 4, 197750, 25707.5, 'Tarjeta', 1),
    (125, '2023-06-05', 5, 259900, 33787, 'Tarjeta', 4),
    (126, '2023-06-06', 6, 24484.84, 3183.03, 'Efectivo', 5),
    (127, '2023-06-07', 7, 4633, 602.29, 'Sinpe', 1),
    (128, '2023-06-08', 8, 25375.28, 3298.79, 'Tarjeta', 2),
    (129, '2023-06-09', 9, 54240, 7051.2, 'Tarjeta', 3),
    (130, '2023-06-10', 10, 25375.28, 3298.79, 'Efectivo', 1),
    (131, '2023-06-11', 11, 160002.35, 20800.31, 'Tarjeta', 1),
    (132, '2023-06-12', 12, 10000, 1300, 'Tarjeta', 5),
    (133, '2023-06-13', 15, 11783.64, 1531.87, 'Efectivo', 3),
    (134, '2023-06-14', 13, 5683.9, 8525.85, 'Sinpe', 4),
    (135, '2023-06-15', 14, 55370, 7198.1, 'Tarjeta', 1),
    (136, '2023-06-16', 5, 10000, 1300, 'Tarjeta', 4),
    (137, '2023-06-17', 4, 55370, 7198.1, 'Tarjeta', 1),
    (138, '2023-06-18', 6, 25375.28, 3298.79, 'Tarjeta', 5);

INSERT INTO Facturacion_detalle (id_factura_detalle, id_factura, num_linea, id_producto)
VALUES
    (121, 121, 1, 1),
    (122, 121, 2, 15),
    (123, 122, 1, 8),
    (124, 123, 1, 10),
    (125, 123, 2, 2),
    (126, 124, 1, 14),
    (127, 125, 1, 8),
    (128, 126, 1, 13),
    (129, 127, 1, 9),
    (130, 128, 1, 5),
    (131, 129, 1, 6),
    (132, 130, 1, 5),
    (133, 131, 1, 7),
    (134, 132, 1, 4),
    (135, 133, 1, 3),
    (136, 134, 1, 1),
    (137, 135, 1, 11),
    (138, 136, 1, 4),
    (139, 137, 1, 1),
    (140, 138, 1, 5);

INSERT INTO Clientes_productos (id_cliente_producto, id_cliente, id_producto)
VALUES
    (106, 1, 1),
    (107, 1, 15),
    (108, 3, 10),
    (109, 6, 13),
    (110, 12, 4),
    (111, 9, 6),
    (112, 5, 8),
    (113, 11, 7),
    (114, 10, 5),
    (115, 8, 5),
    (116, 3, 2),
    (117, 4, 14),
    (118, 2, 8),
    (119, 7, 9),
    (120, 15, 11),
    (121, 13, 3),
    (122, 14, 1);

/*MÁS INSERTS EN JULIO*/

INSERT INTO Historial_pagos (id_historial, id_factura, id_cliente)
VALUES
	(141, 141, 1),
	(142, 142, 2),
	(143, 143, 3),
	(144, 144, 4),
	(145, 145, 5),
	(146, 146, 6),
	(147, 147, 7),
	(148, 148, 8),
	(149, 149, 9),
	(150, 150, 10),
	(151, 151, 11),
	(152, 152, 12),
	(153, 153, 15),
	(154, 154, 13),
	(155, 155, 14),
	(156, 156, 5),
	(157, 157, 4),
	(158, 158, 6),
	(159, 159, 1),
	(160, 160, 2),
	(161, 161, 3),
	(162, 162, 4),
	(163, 163, 5),
	(164, 164, 6),
	(165, 165, 7),
	(166, 166, 8),
	(167, 167, 9),
	(168, 168, 10),
	(169, 169, 11),
	(170, 170, 12),
	(171, 171, 15);

INSERT INTO Facturacion (id_factura, fec_factura, id_cliente, mon_total, mon_iva, metodopago, id_sucursal)
VALUES
    (141, '2023-07-01', 1, 140120, 18215.6, 'Tarjeta', 1),
    (142, '2023-07-02', 2, 259900, 33787, 'Efectivo', 2),
    (143, '2023-07-03', 3, 147476.3, 19171.92, 'Tarjeta', 3),
    (144, '2023-07-04', 4, 197750, 25707.5, 'Tarjeta', 1),
    (145, '2023-07-05', 5, 259900, 33787, 'Tarjeta', 4),
    (146, '2023-07-06', 6, 24484.84, 3183.03, 'Efectivo', 5),
    (147, '2023-07-07', 7, 4633, 602.29, 'Sinpe', 1),
    (148, '2023-07-08', 8, 25375.28, 3298.79, 'Tarjeta', 2),
    (149, '2023-07-09', 9, 54240, 7051.2, 'Tarjeta', 3),
    (150, '2023-07-10', 10, 25375.28, 3298.79, 'Efectivo', 1),
    (151, '2023-07-11', 11, 160002.35, 20800.31, 'Tarjeta', 1),
    (152, '2023-07-12', 12, 10000, 1300, 'Tarjeta', 5),
    (153, '2023-07-13', 15, 11783.64, 1531.87, 'Efectivo', 3),
    (154, '2023-07-14', 13, 5683.9, 8525.85, 'Sinpe', 4),
    (155, '2023-07-15', 14, 55370, 7198.1, 'Tarjeta', 1),
    (156, '2023-07-16', 5, 10000, 1300, 'Tarjeta', 4),
    (157, '2023-07-17', 4, 55370, 7198.1, 'Tarjeta', 1),
    (158, '2023-07-18', 6, 25375.28, 3298.79, 'Tarjeta', 5),
    (159, '2023-07-19', 1, 140120, 18215.6, 'Tarjeta', 1),
    (160, '2023-07-20', 2, 259900, 33787, 'Efectivo', 2),
    (161, '2023-07-21', 3, 147476.3, 19171.92, 'Tarjeta', 3),
    (162, '2023-07-22', 4, 197750, 25707.5, 'Tarjeta', 1),
    (163, '2023-07-23', 5, 259900, 33787, 'Tarjeta', 4),
    (164, '2023-07-24', 6, 24484.84, 3183.03, 'Efectivo', 5),
    (165, '2023-07-25', 7, 4633, 602.29, 'Sinpe', 1),
    (166, '2023-07-26', 8, 25375.28, 3298.79, 'Tarjeta', 2),
    (167, '2023-07-27', 9, 54240, 7051.2, 'Tarjeta', 3),
    (168, '2023-07-28', 10, 25375.28, 3298.79, 'Efectivo', 1),
    (169, '2023-07-29', 11, 160002.35, 20800.31, 'Tarjeta', 1),
    (170, '2023-07-30', 12, 10000, 1300, 'Tarjeta', 5),
    (171, '2023-07-31', 15, 11783.64, 1531.87, 'Efectivo', 3);

INSERT INTO Facturacion_detalle (id_factura_detalle, id_factura, num_linea, id_producto)
VALUES
    (141, 141, 1, 1),
    (142, 141, 2, 15),
    (143, 142, 1, 8),
    (144, 143, 1, 10),
    (145, 143, 2, 2),
    (146, 144, 1, 14),
    (147, 145, 1, 8),
    (148, 146, 1, 13),
    (149, 147, 1, 9),
    (150, 148, 1, 5),
    (151, 149, 1, 6),
    (152, 150, 1, 5),
    (153, 151, 1, 7),
    (154, 152, 1, 4),
    (155, 153, 1, 3),
    (156, 154, 1, 1),
    (157, 155, 1, 11),
    (158, 156, 1, 4),
    (159, 157, 1, 1),
    (160, 158, 1, 5),
    (161, 159, 1, 1),
    (162, 160, 1, 15),
    (163, 161, 1, 8),
    (164, 162, 1, 10),
    (165, 163, 1, 2),
    (166, 164, 1, 14),
    (167, 165, 1, 8),
    (168, 166, 1, 13),
    (169, 167, 1, 9),
    (170, 168, 1, 5),
    (171, 169, 1, 6),
    (172, 170, 1, 5),
    (173, 171, 1, 7);

INSERT INTO Clientes_productos (id_cliente_producto, id_cliente, id_producto)
VALUES
    (123, 1, 1),
    (124, 1, 15),
    (125, 3, 10),
    (126, 6, 13),
    (127, 12, 4),
    (128, 9, 6),
    (129, 5, 8),
    (130, 11, 7),
    (131, 10, 5),
    (132, 8, 5),
    (133, 3, 2),
    (134, 4, 14),
    (135, 2, 8),
    (136, 7, 9),
    (137, 15, 11),
    (138, 13, 3),
    (139, 14, 1);

/*MÁS INSERTS EN AGOSTO*/

INSERT INTO Historial_pagos (id_historial, id_factura, id_cliente)
VALUES
	(172, 172, 1),
	(173, 173, 2),
	(174, 174, 3),
	(175, 175, 4),
	(176, 176, 5),
	(177, 177, 6),
	(178, 178, 7),
	(179, 179, 8),
	(180, 180, 9),
	(181, 181, 10),
	(182, 182, 11),
	(183, 183, 12),
	(184, 184, 15),
	(185, 185, 13),
	(186, 186, 14),
	(187, 187, 5),
	(188, 188, 4),
	(189, 189, 6),
	(190, 190, 1),
	(191, 191, 2),
	(192, 192, 3),
	(193, 193, 4),
	(194, 194, 5),
	(195, 195, 6),
	(196, 196, 7),
	(197, 197, 8),
	(198, 198, 9),
	(199, 199, 10),
	(200, 200, 11),
	(201, 201, 12),
	(202, 202, 15);


INSERT INTO Facturacion (id_factura, fec_factura, id_cliente, mon_total, mon_iva, metodopago, id_sucursal)
VALUES
    (172, '2023-08-01', 1, 140120, 18215.6, 'Tarjeta', 1),
    (173, '2023-08-02', 2, 259900, 33787, 'Efectivo', 2),
    (174, '2023-08-03', 3, 147476.3, 19171.92, 'Tarjeta', 3),
    (175, '2023-08-04', 4, 197750, 25707.5, 'Tarjeta', 1),
    (176, '2023-08-05', 5, 259900, 33787, 'Tarjeta', 4),
    (177, '2023-08-06', 6, 24484.84, 3183.03, 'Efectivo', 5),
    (178, '2023-08-07', 7, 4633, 602.29, 'Sinpe', 1),
    (179, '2023-08-08', 8, 25375.28, 3298.79, 'Tarjeta', 2),
    (180, '2023-08-09', 9, 54240, 7051.2, 'Tarjeta', 3),
    (181, '2023-08-10', 10, 25375.28, 3298.79, 'Efectivo', 1),
    (182, '2023-08-11', 11, 160002.35, 20800.31, 'Tarjeta', 1),
    (183, '2023-08-12', 12, 10000, 1300, 'Tarjeta', 5),
    (184, '2023-08-13', 15, 11783.64, 1531.87, 'Efectivo', 3),
    (185, '2023-08-14', 13, 5683.9, 8525.85, 'Sinpe', 4),
    (186, '2023-08-15', 14, 55370, 7198.1, 'Tarjeta', 1),
    (187, '2023-08-16', 5, 10000, 1300, 'Tarjeta', 4),
    (188, '2023-08-17', 4, 55370, 7198.1, 'Tarjeta', 1),
    (189, '2023-08-18', 6, 25375.28, 3298.79, 'Tarjeta', 5),
    (190, '2023-08-19', 1, 140120, 18215.6, 'Tarjeta', 1),
    (191, '2023-08-20', 2, 259900, 33787, 'Efectivo', 2),
    (192, '2023-08-21', 3, 147476.3, 19171.92, 'Tarjeta', 3),
    (193, '2023-08-22', 4, 197750, 25707.5, 'Tarjeta', 1),
    (194, '2023-08-23', 5, 259900, 33787, 'Tarjeta', 4),
    (195, '2023-08-24', 6, 24484.84, 3183.03, 'Efectivo', 5),
    (196, '2023-08-25', 7, 4633, 602.29, 'Sinpe', 1),
    (197, '2023-08-26', 8, 25375.28, 3298.79, 'Tarjeta', 2),
    (198, '2023-08-27', 9, 54240, 7051.2, 'Tarjeta', 3),
    (199, '2023-08-28', 10, 25375.28, 3298.79, 'Efectivo', 1),
    (200, '2023-08-29', 11, 160002.35, 20800.31, 'Tarjeta', 1),
    (201, '2023-08-30', 12, 10000, 1300, 'Tarjeta', 5),
    (202, '2023-08-31', 15, 11783.64, 1531.87, 'Efectivo', 3);

INSERT INTO Facturacion_detalle (id_factura_detalle, id_factura, num_linea, id_producto)
VALUES
    (203, 172, 1, 1),
    (204, 172, 2, 15),
    (174, 173, 1, 8),
    (175, 174, 1, 10),
    (176, 174, 2, 2),
    (177, 175, 1, 14),
    (178, 176, 1, 8),
    (179, 177, 1, 13),
    (180, 178, 1, 9),
    (181, 179, 1, 5),
    (182, 180, 1, 6),
    (183, 181, 1, 5),
    (184, 182, 1, 7),
    (185, 183, 1, 4),
    (186, 184, 1, 3),
    (187, 185, 1, 1),
    (188, 186, 1, 11),
    (189, 187, 1, 4),
    (190, 188, 1, 1),
    (191, 189, 1, 5),
    (192, 190, 1, 1),
    (193, 190, 1, 15),
    (194, 191, 2, 8),
    (195, 192, 1, 10),
    (196, 192, 2, 2),
    (197, 193, 1, 14),
    (198, 194, 1, 8),
    (199, 195, 1, 13),
    (200, 196, 1, 9),
    (201, 197, 1, 5),
    (202, 198, 1, 6),
	(209, 199, 1, 5),
	(210, 200, 1, 7),
	(211, 201, 1, 4),
	(212, 202, 1, 3);

INSERT INTO Clientes_productos (id_cliente_producto, id_cliente, id_producto)
VALUES
    (140, 1, 1),
    (141, 1, 15),
    (142, 3, 10),
    (143, 6, 13),
    (144, 12, 4),
    (145, 9, 6),
    (146, 5, 8),
    (147, 11, 7),
    (148, 10, 5),
    (149, 8, 5),
    (150, 3, 2),
    (151, 4, 14),
    (152, 2, 8),
    (153, 7, 9),
    (154, 15, 11),
    (155, 13, 3),
    (156, 14, 1);

/*MÁS INSERTS EN SETIEMBRE*/

INSERT INTO Historial_pagos (id_historial, id_factura, id_cliente)
VALUES
	(213, 213, 1),
	(214, 214, 2),
	(215, 215, 3),
	(216, 216, 4),
	(217, 217, 5),
	(218, 218, 6),
	(219, 219, 7),
	(220, 220, 8),
	(221, 221, 9),
	(222, 222, 10),
	(223, 223, 11),
	(224, 224, 12),
	(225, 225, 15),
	(226, 226, 13),
	(227, 227, 14),
	(228, 228, 5),
	(229, 229, 4),
	(230, 230, 6),
	(231, 231, 1),
	(232, 232, 2),
	(233, 233, 3),
	(234, 234, 4),
	(235, 235, 5),
	(236, 236, 6),
	(237, 237, 7),
	(238, 238, 8),
	(239, 239, 9),
	(240, 240, 10),
	(241, 241, 11),
	(242, 242, 12);

INSERT INTO Facturacion (id_factura, fec_factura, id_cliente, mon_total, mon_iva, metodopago, id_sucursal)
VALUES
    (213, '2023-09-01', 1, 140120, 18215.6, 'Tarjeta', 1),
    (214, '2023-09-02', 2, 259900, 33787, 'Efectivo', 2),
    (215, '2023-09-03', 3, 147476.3, 19171.92, 'Tarjeta', 3),
    (216, '2023-09-04', 4, 197750, 25707.5, 'Tarjeta', 1),
    (217, '2023-09-05', 5, 259900, 33787, 'Tarjeta', 4),
    (218, '2023-09-06', 6, 24484.84, 3183.03, 'Efectivo', 5),
    (219, '2023-09-07', 7, 4633, 602.29, 'Sinpe', 1),
    (220, '2023-09-08', 8, 25375.28, 3298.79, 'Tarjeta', 2),
    (221, '2023-09-09', 9, 54240, 7051.2, 'Tarjeta', 3),
    (222, '2023-09-10', 10, 25375.28, 3298.79, 'Efectivo', 1),
    (223, '2023-09-11', 11, 160002.35, 20800.31, 'Tarjeta', 1),
    (224, '2023-09-12', 12, 10000, 1300, 'Tarjeta', 5),
    (225, '2023-09-13', 15, 11783.64, 1531.87, 'Efectivo', 3),
    (226, '2023-09-14', 13, 5683.9, 8525.85, 'Sinpe', 4),
    (227, '2023-09-15', 14, 55370, 7198.1, 'Tarjeta', 1),
    (228, '2023-09-16', 5, 10000, 1300, 'Tarjeta', 4),
    (229, '2023-09-17', 4, 55370, 7198.1, 'Tarjeta', 1),
    (230, '2023-09-18', 6, 25375.28, 3298.79, 'Tarjeta', 5),
    (231, '2023-09-19', 1, 140120, 18215.6, 'Tarjeta', 1),
    (232, '2023-09-20', 2, 259900, 33787, 'Efectivo', 2),
    (233, '2023-09-21', 3, 147476.3, 19171.92, 'Tarjeta', 3),
    (234, '2023-09-22', 4, 197750, 25707.5, 'Tarjeta', 1),
    (235, '2023-09-23', 5, 259900, 33787, 'Tarjeta', 4),
    (236, '2023-09-24', 6, 24484.84, 3183.03, 'Efectivo', 5),
    (237, '2023-09-25', 7, 4633, 602.29, 'Sinpe', 1),
    (238, '2023-09-26', 8, 25375.28, 3298.79, 'Tarjeta', 2),
    (239, '2023-09-27', 9, 54240, 7051.2, 'Tarjeta', 3),
    (240, '2023-09-28', 10, 25375.28, 3298.79, 'Efectivo', 1),
    (241, '2023-09-29', 11, 160002.35, 20800.31, 'Tarjeta', 1),
    (242, '2023-09-30', 12, 10000, 1300, 'Tarjeta', 5);

INSERT INTO Facturacion_detalle (id_factura_detalle, id_factura, num_linea, id_producto)
VALUES
    (213, 213, 1, 1),
    (214, 213, 2, 15),
    (215, 214, 1, 8),
    (216, 215, 1, 10),
    (217, 215, 2, 2),
    (218, 216, 1, 14),
    (219, 217, 1, 8),
    (220, 218, 1, 13),
    (221, 219, 1, 9),
    (222, 220, 1, 5),
    (223, 221, 1, 6),
    (224, 222, 1, 5),
    (225, 223, 1, 7),
    (226, 224, 1, 4),
    (227, 225, 1, 3),
    (228, 226, 1, 1),
    (229, 227, 1, 11),
    (230, 228, 1, 4),
    (231, 229, 1, 1),
    (232, 230, 1, 5),
    (233, 231, 1, 1),
    (234, 231, 2, 15),
    (235, 232, 1, 8),
    (236, 233, 1, 10),
    (237, 233, 2, 2),
    (238, 234, 1, 14),
    (239, 235, 1, 8),
    (240, 236, 1, 13),
    (241, 237, 1, 9),
    (242, 238, 1, 5),
    (205, 239, 1, 6),
	(206, 240, 1, 5),
	(207, 241, 1, 7),
	(208, 242, 1, 4);

INSERT INTO Clientes_productos (id_cliente_producto, id_cliente, id_producto)
VALUES
    (157, 1, 1),
    (158, 1, 15),
    (159, 3, 10),
    (160, 6, 13),
    (161, 12, 4),
    (162, 9, 6),
    (163, 5, 8),
    (164, 11, 7),
    (165, 10, 5),
    (166, 8, 5),
    (167, 3, 2),
    (168, 4, 14),
    (169, 2, 8),
    (170, 7, 9),
    (171, 15, 11),
    (172, 13, 3),
    (173, 14, 1);

/*MÁS INSERTS EN OCTUBRE*/

INSERT INTO Historial_pagos (id_historial, id_factura, id_cliente)
VALUES
	(243, 243, 1),
	(244, 244, 2),
	(245, 245, 3),
	(246, 246, 4),
	(247, 247, 5),
	(248, 248, 6),
	(249, 249, 7),
	(250, 250, 8),
	(251, 251, 9),
	(252, 252, 10),
	(253, 253, 11),
	(254, 254, 12),
	(255, 255, 15),
	(256, 256, 13),
	(257, 257, 14),
	(258, 258, 5),
	(259, 259, 4),
	(260, 260, 6),
	(261, 261, 1),
	(262, 262, 2),
	(263, 263, 3),
	(264, 264, 4),
	(265, 265, 5),
	(266, 266, 6),
	(267, 267, 7),
	(268, 268, 8),
	(269, 269, 9),
	(270, 270, 10),
	(271, 271, 11),
	(272, 272, 12),
	(273, 273, 15);


INSERT INTO Facturacion (id_factura, fec_factura, id_cliente, mon_total, mon_iva, metodopago, id_sucursal)
VALUES
    (243, '2023-10-01', 1, 140120, 18215.6, 'Tarjeta', 1),
    (244, '2023-10-02', 2, 259900, 33787, 'Efectivo', 2),
    (245, '2023-10-03', 3, 147476.3, 19171.92, 'Tarjeta', 3),
    (246, '2023-10-04', 4, 197750, 25707.5, 'Tarjeta', 1),
    (247, '2023-10-05', 5, 259900, 33787, 'Tarjeta', 4),
    (248, '2023-10-06', 6, 24484.84, 3183.03, 'Efectivo', 5),
    (249, '2023-10-07', 7, 4633, 602.29, 'Sinpe', 1),
    (250, '2023-10-08', 8, 25375.28, 3298.79, 'Tarjeta', 2),
    (251, '2023-10-09', 9, 54240, 7051.2, 'Tarjeta', 3),
    (252, '2023-10-10', 10, 25375.28, 3298.79, 'Efectivo', 1),
    (253, '2023-10-11', 11, 160002.35, 20800.31, 'Tarjeta', 1),
    (254, '2023-10-12', 12, 10000, 1300, 'Tarjeta', 5),
    (255, '2023-10-13', 15, 11783.64, 1531.87, 'Efectivo', 3),
    (256, '2023-10-14', 13, 5683.9, 8525.85, 'Sinpe', 4),
    (257, '2023-10-15', 14, 55370, 7198.1, 'Tarjeta', 1),
    (258, '2023-10-16', 5, 10000, 1300, 'Tarjeta', 4),
    (259, '2023-10-17', 4, 55370, 7198.1, 'Tarjeta', 1),
    (260, '2023-10-18', 6, 25375.28, 3298.79, 'Tarjeta', 5),
    (261, '2023-10-19', 1, 140120, 18215.6, 'Tarjeta', 1),
    (262, '2023-10-20', 2, 259900, 33787, 'Efectivo', 2),
    (263, '2023-10-21', 3, 147476.3, 19171.92, 'Tarjeta', 3),
    (264, '2023-10-22', 4, 197750, 25707.5, 'Tarjeta', 1),
    (265, '2023-10-23', 5, 259900, 33787, 'Tarjeta', 4),
    (266, '2023-10-24', 6, 24484.84, 3183.03, 'Efectivo', 5),
    (267, '2023-10-25', 7, 4633, 602.29, 'Sinpe', 1),
    (268, '2023-10-26', 8, 25375.28, 3298.79, 'Tarjeta', 2),
    (269, '2023-10-27', 9, 54240, 7051.2, 'Tarjeta', 3),
    (270, '2023-10-28', 10, 25375.28, 3298.79, 'Efectivo', 1),
    (271, '2023-10-29', 11, 160002.35, 20800.31, 'Tarjeta', 1),
    (272, '2023-10-30', 12, 10000, 1300, 'Tarjeta', 5),
    (273, '2023-10-31', 15, 11783.64, 1531.87, 'Efectivo', 3);

INSERT INTO Facturacion_detalle (id_factura_detalle, id_factura, num_linea, id_producto)
VALUES
    (243, 243, 1, 1),
    (244, 243, 2, 15),
    (245, 244, 1, 8),
    (246, 245, 1, 10),
    (247, 245, 2, 2),
    (248, 246, 1, 14),
    (249, 247, 1, 8),
    (250, 248, 1, 13),
    (251, 249, 1, 9),
    (252, 250, 1, 5),
    (253, 251, 1, 6),
    (254, 252, 1, 5),
    (255, 253, 1, 7),
    (256, 254, 1, 4),
    (257, 255, 1, 3),
    (258, 256, 1, 1),
    (259, 257, 1, 11),
    (260, 258, 1, 4),
    (261, 259, 1, 1),
    (262, 260, 1, 5),
    (263, 261, 1, 1),
    (264, 261, 2, 15),
    (265, 262, 1, 8),
    (266, 263, 1, 10),
    (267, 264, 2, 2),
    (268, 265, 1, 14),
    (269, 266, 1, 8),
    (270, 267, 1, 13),
    (271, 268, 1, 9),
    (272, 269, 1, 5),
	(273, 270, 1, 6),
	(306, 271, 1, 5),
	(307, 272, 1, 7),
	(308, 273, 1, 4);

INSERT INTO Clientes_productos (id_cliente_producto, id_cliente, id_producto)
VALUES
    (174, 1, 1),
    (175, 1, 15),
    (176, 3, 10),
    (177, 6, 13),
    (178, 12, 4),
    (179, 9, 6),
    (180, 5, 8),
    (181, 11, 7),
    (182, 10, 5),
    (183, 8, 5),
    (184, 3, 2),
    (185, 4, 14),
    (186, 2, 8),
    (187, 7, 9),
    (188, 15, 11),
    (189, 13, 3),
    (190, 14, 1);

/*MÁS INSERTS NOVIEMBRE*/

INSERT INTO Historial_pagos (id_historial, id_factura, id_cliente)
VALUES
	(274, 274, 1),
	(275, 275, 2),
	(276, 276, 3),
	(277, 277, 4),
	(278, 278, 5),
	(279, 279, 6),
	(280, 280, 7),
	(281, 281, 8),
	(282, 282, 9),
	(283, 283, 10),
	(284, 284, 11),
	(285, 285, 12),
	(286, 286, 15),
	(287, 287, 13),
	(288, 288, 14),
	(289, 289, 5),
	(290, 290, 4),
	(291, 291, 6),
	(292, 292, 1),
	(293, 293, 2),
	(294, 294, 3),
	(295, 295, 4),
	(296, 296, 5),
	(297, 297, 6),
	(298, 298, 7),
	(299, 299, 8),
	(300, 300, 9),
	(301, 301, 10),
	(302, 302, 11),
	(303, 303, 12);


INSERT INTO Facturacion (id_factura, fec_factura, id_cliente, mon_total, mon_iva, metodopago, id_sucursal)
VALUES
    (274, '2023-11-01', 1, 140120, 18215.6, 'Tarjeta', 1),
    (275, '2023-11-02', 2, 259900, 33787, 'Efectivo', 2),
    (276, '2023-11-03', 3, 147476.3, 19171.92, 'Tarjeta', 3),
    (277, '2023-11-04', 4, 197750, 25707.5, 'Tarjeta', 1),
    (278, '2023-11-05', 5, 259900, 33787, 'Tarjeta', 4),
    (279, '2023-11-06', 6, 24484.84, 3183.03, 'Efectivo', 5),
    (280, '2023-11-07', 7, 4633, 602.29, 'Sinpe', 1),
    (281, '2023-11-08', 8, 25375.28, 3298.79, 'Tarjeta', 2),
    (282, '2023-11-09', 9, 54240, 7051.2, 'Tarjeta', 3),
    (283, '2023-11-10', 10, 25375.28, 3298.79, 'Efectivo', 1),
    (284, '2023-11-11', 11, 160002.35, 20800.31, 'Tarjeta', 1),
    (285, '2023-11-12', 12, 10000, 1300, 'Tarjeta', 5),
    (286, '2023-11-13', 15, 11783.64, 1531.87, 'Efectivo', 3),
    (287, '2023-11-14', 13, 5683.9, 8525.85, 'Sinpe', 4),
    (288, '2023-11-15', 14, 55370, 7198.1, 'Tarjeta', 1),
    (289, '2023-11-16', 5, 10000, 1300, 'Tarjeta', 4),
    (290, '2023-11-17', 4, 55370, 7198.1, 'Tarjeta', 1),
    (291, '2023-11-18', 6, 25375.28, 3298.79, 'Tarjeta', 5),
    (292, '2023-11-19', 1, 140120, 18215.6, 'Tarjeta', 1),
    (293, '2023-11-20', 2, 259900, 33787, 'Efectivo', 2),
    (294, '2023-11-21', 3, 147476.3, 19171.92, 'Tarjeta', 3),
    (295, '2023-11-22', 4, 197750, 25707.5, 'Tarjeta', 1),
    (296, '2023-11-23', 5, 259900, 33787, 'Tarjeta', 4),
    (297, '2023-11-24', 6, 24484.84, 3183.03, 'Efectivo', 5),
    (298, '2023-11-25', 7, 4633, 602.29, 'Sinpe', 1),
    (299, '2023-11-26', 8, 25375.28, 3298.79, 'Tarjeta', 2),
    (300, '2023-11-27', 9, 54240, 7051.2, 'Tarjeta', 3),
    (301, '2023-11-28', 10, 25375.28, 3298.79, 'Efectivo', 1),
    (302, '2023-11-29', 11, 160002.35, 20800.31, 'Tarjeta', 1),
    (303, '2023-11-30', 12, 10000, 1300, 'Tarjeta', 5);

INSERT INTO Facturacion_detalle (id_factura_detalle, id_factura, num_linea, id_producto)
VALUES
    (274, 274, 1, 1),
    (275, 274, 2, 15),
    (276, 275, 1, 8),
    (277, 276, 1, 10),
    (278, 276, 2, 2),
    (279, 277, 1, 14),
    (280, 278, 1, 8),
    (281, 279, 1, 13),
    (282, 280, 1, 9),
    (283, 281, 1, 5),
    (284, 282, 1, 6),
    (285, 283, 1, 5),
    (286, 284, 1, 7),
    (287, 285, 1, 4),
    (288, 286, 1, 3),
    (289, 287, 1, 1),
    (290, 288, 1, 11),
    (291, 289, 1, 4),
    (292, 290, 1, 1),
    (293, 291, 1, 5),
    (294, 292, 1, 1),
    (295, 293, 1, 15),
    (296, 294, 1, 8),
    (297, 295, 1, 10),
    (298, 296, 1, 2),
    (299, 297, 1, 14),
    (300, 298, 1, 8),
    (301, 299, 1, 13),
    (302, 300, 1, 9),
    (303, 301, 1, 5),
	(304, 302, 1, 6),
	(305, 303, 1, 5);

INSERT INTO Clientes_productos (id_cliente_producto, id_cliente, id_producto)
VALUES
    (191, 1, 1),
    (192, 1, 15),
    (193, 3, 10),
    (194, 6, 13),
    (195, 12, 4),
    (196, 9, 6),
    (197, 5, 8),
    (198, 11, 7),
    (199, 10, 5),
    (200, 8, 5),
    (201, 3, 2),
    (202, 4, 14),
    (203, 2, 8),
    (204, 7, 9),
    (205, 15, 11),
    (206, 13, 3),
    (207, 14, 1);

/*MÁS INSERTS EN DICIEMBRE*/

INSERT INTO Historial_pagos (id_historial, id_factura, id_cliente)
VALUES
	(334, 334, 1),
	(335, 335, 2),
	(336, 336, 3),
	(337, 337, 4),
	(338, 338, 5),
	(339, 339, 6),
	(340, 340, 7),
	(341, 341, 8),
	(342, 342, 9),
	(343, 343, 10),
	(344, 344, 11),
	(345, 345, 12),
	(346, 346, 15),
	(347, 347, 13),
	(348, 348, 14),
	(349, 349, 5),
	(350, 350, 4),
	(351, 351, 6),
	(352, 352, 1),
	(353, 353, 2),
	(354, 354, 3),
	(355, 355, 4),
	(356, 356, 5),
	(357, 357, 6);

INSERT INTO Facturacion (id_factura, fec_factura, id_cliente, mon_total, mon_iva, metodopago, id_sucursal)
VALUES
    (334, '2023-12-01', 1, 140120, 18215.6, 'Tarjeta', 1),
    (335, '2023-12-02', 2, 259900, 33787, 'Efectivo', 2),
    (336, '2023-12-03', 3, 147476.3, 19171.92, 'Tarjeta', 3),
    (337, '2023-12-04', 4, 197750, 25707.5, 'Tarjeta', 1),
    (338, '2023-12-05', 5, 259900, 33787, 'Tarjeta', 4),
    (339, '2023-12-06', 6, 24484.84, 3183.03, 'Efectivo', 5),
    (340, '2023-12-07', 7, 4633, 602.29, 'Sinpe', 1),
    (341, '2023-12-08', 8, 25375.28, 3298.79, 'Tarjeta', 2),
    (342, '2023-12-09', 9, 54240, 7051.2, 'Tarjeta', 3),
    (343, '2023-12-10', 10, 25375.28, 3298.79, 'Efectivo', 1),
    (344, '2023-12-11', 11, 160002.35, 20800.31, 'Tarjeta', 1),
    (345, '2023-12-12', 12, 10000, 1300, 'Tarjeta', 5),
    (346, '2023-12-13', 15, 11783.64, 1531.87, 'Efectivo', 3),
    (347, '2023-12-14', 13, 5683.9, 8525.85, 'Sinpe', 4),
    (348, '2023-12-15', 14, 55370, 7198.1, 'Tarjeta', 1),
    (349, '2023-12-16', 5, 10000, 1300, 'Tarjeta', 4),
    (350, '2023-12-17', 4, 55370, 7198.1, 'Tarjeta', 1),
    (351, '2023-12-18', 6, 25375.28, 3298.79, 'Tarjeta', 5),
    (352, '2023-12-19', 1, 140120, 18215.6, 'Tarjeta', 1),
    (353, '2023-12-20', 2, 259900, 33787, 'Efectivo', 2),
    (354, '2023-12-21', 3, 147476.3, 19171.92, 'Tarjeta', 3),
    (355, '2023-12-22', 4, 197750, 25707.5, 'Tarjeta', 1),
    (356, '2023-12-23', 5, 259900, 33787, 'Tarjeta', 4),
    (357, '2023-12-24', 6, 24484.84, 3183.03, 'Efectivo', 5);

INSERT INTO Facturacion_detalle (id_factura_detalle, id_factura, num_linea, id_producto)
VALUES
    (334, 334, 1, 1),
    (335, 334, 2, 15),
    (336, 335, 1, 8),
    (337, 336, 1, 10),
    (338, 336, 2, 2),
    (339, 337, 1, 14),
    (340, 338, 1, 8),
    (341, 339, 1, 13),
    (342, 340, 1, 9),
    (343, 341, 1, 5),
    (344, 342, 1, 6),
    (345, 343, 1, 5),
    (346, 344, 1, 7),
    (347, 345, 1, 4),
    (348, 346, 1, 3),
    (349, 347, 1, 1),
    (350, 348, 1, 11),
    (351, 349, 1, 4),
    (352, 350, 1, 1),
    (353, 351, 1, 5),
    (354, 352, 1, 1),
    (355, 352, 2, 15),
	(356, 353, 1, 8),
    (357, 354, 1, 10),
	(358, 354, 2, 2),
	(359, 355, 1, 14),
	(360, 356, 1, 8),
	(361, 357, 1, 10);

INSERT INTO Clientes_productos (id_cliente_producto, id_cliente, id_producto)
VALUES
    (229, 1, 1),
    (230, 1, 15),
    (231, 3, 10),
    (232, 6, 13),
    (233, 12, 4),
    (234, 9, 6),
    (235, 5, 8),
    (236, 11, 7),
    (237, 10, 5),
    (238, 8, 5),
    (239, 3, 2),
    (240, 4, 14),
    (241, 2, 8),
    (242, 7, 9),
    (243, 15, 11),
    (244, 13, 3);