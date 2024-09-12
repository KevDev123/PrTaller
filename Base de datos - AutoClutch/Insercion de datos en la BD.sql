-- INGRESANDO DATOS A LA BD

-- tabla de clientes
insert into clientes(nombre,apellido,telefono,DUI)
values ('Ever', 'Jorgen' , '1234-5678','12345678-9'),
('Julien', 'Nagelsman' , '1752-5528','1675458-1');

-- tabla de empleados
insert into empleados(nombre,apellido,telefono,fechaNacimiento,Direccion)
values('Efrain','Gabriel','1234-5643','1993-02-02','Comunidad Rosa Virginia 1'),
('Eugin','Sanchex','1258-5533','1995-03-02','Calle perez #1');


-- tabla servicios
Insert into servicios (nombre, descripcion)
values
('Cambio de aceite', 'Cambio completo de aceite para motor a gasolina'),
('Alineación y balanceo', 'Ajuste de la alineación y balanceo de las ruedas'),
('Revisión de frenos', 'Inspección y mantenimiento del sistema de frenos'),
('Cambio de llantas', 'Reemplazo de las llantas desgastadas por unas nuevas'),
('Diagnóstico general', 'Evaluación completa del estado del vehículo'),
('Revisión de batería', 'Verificación y carga de batería del automóvil'),
('Cambio de filtro de aire', 'Reemplazo del filtro de aire del motor'),
('Lavado completo', 'Lavado exterior e interior del vehículo con detallado'),
('Revisión de luces', 'Comprobación y ajuste del sistema de iluminación'),
('Mantenimiento del sistema de refrigeración', 'Revisión y limpieza del sistema de enfriamiento del motor');

-- tabla de proveedores
insert into proveedores (nombreContacto, telefono, direccion)
values
('Distribuidora La Llanta', '2345-6789', 'San Salvador'),
('Lubricantes El Salvador', '2255-9876', 'Santa Tecla'),
('Repuestos Mendoza', '2201-4567', 'San Miguel'),
('Autopartes Central', '2244-3344', 'Sonsonate'),
('Frenos del Sur', '2333-2221', 'San Vicente'),
('Llantas y Más', '2277-8910', 'Santa Ana'),
('Baterías Energía', '2233-4455', 'Chalatenango'),
('Filtros Automotrices', '2123-8765', 'La Libertad'),
('Repuestos Guzmán', '2134-5678', 'Usulután'),
('Autopartes Express', '2567-1234', 'San Salvador');

-- tabla de categorias 
insert into categorias (nombre, descripcion)
values
('Llantas', 'Llantas de diferentes tamaños y tipos para todo tipo de vehículo'),
('Aceites y Lubricantes', 'Aceites para motor, transmisión y otros fluidos lubricantes'),
('Frenos', 'Pastillas, discos y otros componentes del sistema de frenos'),
('Filtros', 'Filtros de aire, aceite y combustible para vehículos'),
('Baterías', 'Baterías automotrices de diversas marcas y capacidades'),
('Luces y Faros', 'Repuestos de faros, luces traseras y bombillas'),
('Repuestos de Motor', 'Piezas de motor como bujías, correas y más'),
('Sistema de Suspensión', 'Amortiguadores, resortes y otros componentes de suspensión'),
('Productos de Limpieza', 'Productos para limpieza interior y exterior de vehículos'),
('Refrigerantes', 'Líquidos refrigerantes y anticongelantes para motores');

-- tabla de productos
insert into productos (idCategoria, idProveedor, nombre, precio, stock)
values
(1, 1, 'Llanta Bridgestone 205/55R16', 85.50, 20),
(1, 1, 'Llanta Michelin 225/45R17', 105.00, 15),
(2, 2, 'Aceite sintético Mobil 5W-30', 32.00, 50),
(2, 2, 'Lubricante Castrol 10W-40', 28.00, 40),
(3, 3, 'Pastillas de freno Bosch', 45.00, 30),
(3, 5, 'Discos de freno Brembo', 65.00, 25),
(4, 4, 'Filtro de aire K&N', 20.00, 60),
(4, 4, 'Filtro de aceite Fram', 15.00, 80),
(5, 7, 'Batería Energizer 12V', 120.00, 25),
(5, 7, 'Batería AC Delco 12V', 135.00, 20),
(6, 8, 'Faros delanteros LED', 75.00, 40),
(6, 8, 'Bombillas halógenas Philips', 12.00, 100),
(7, 3, 'Bujías NGK Iridium', 12.50, 70),
(7, 9, 'Correa de distribución Gates', 55.00, 20),
(8, 5, 'Amortiguador KYB', 90.00, 15),
(8, 5, 'Resortes Eibach', 65.00, 10),
(9, 6, 'Limpiador de interiores Armor All', 10.00, 80),
(9, 6, 'Shampoo para autos Meguiar’s', 18.00, 50),
(10, 10, 'Refrigerante Prestone 1 galón', 25.00, 60),
(10, 10, 'Anticongelante Valvoline 1 galón', 22.00, 55);

-- tabla de vehiculo
INSERT INTO vehiculos (matricula, idCliente, marca, año, modelo, descripcion)
VALUES ('ABC123', 1, 'Toyota', 2022, 'Corolla', 'Sedan color rojo');

INSERT INTO vehiculos (matricula, idCliente, marca, año, modelo, descripcion)
VALUES ('XYZ789', 2, 'Honda', 2020, 'Civic', 'Coupe color azul');



-- tabla reparaciones
insert into reparaciones(matricula,idServicio,idEmpleado,fechaReparacion,costo)
values('ABC123',1,1,now(),150.0),
('XYZ789',2,2,now(),200.0);

select * from reparaciones;
-- tabla detallereparacion
insert into detallereparacion(idReparacion,idProducto,cantidadUsada)
values(3,1,2),
(4,2,5);


-- ejemplo de desencriptacion
select idcliente,nombre,apellido,CONVERT(AES_DECRYPT(telefono, '@auto') USING utf8) as telefono from clientes