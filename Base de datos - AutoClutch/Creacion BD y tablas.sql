create schema AutoClutch;
use AutoClutch;

create table clientes(
idCliente int auto_increment primary key not null,
nombre varchar(30) not null,
apellido varchar(30) not null,
telefono varbinary(255) not null,
DUI varbinary(255) unique not null
);

create table empleados(
idEmpleado int auto_increment primary key not null,
nombre varchar(30) not null,
apellido varchar(30) not null,
telefono varbinary(255) not null,
fechaNacimiento date,
direccion varbinary(255) not null
);

create table servicios(
idServicio int auto_increment primary key not null,
nombre varchar(50) not null,
descripcion varchar(100) not null
);

create table categorias(
idCategoria int auto_increment primary key not null,
nombre varchar(30) not null,
descripcion varchar(100) not null
);


create table proveedores(
idProveedor int auto_increment primary key not null,
nombreContacto varchar(30) not null,
telefono varbinary(255) not null,
direccion varbinary(255) not null
);

create table usuarios(
usuario varchar(50) primary key not null,
contra varbinary(100) not null,
tipoUsuario varchar(20) not null
);


create table vehiculos(
matricula varchar(20) primary key not null,
idCliente int not null,
marca varchar(20) not null,
año int not null,
modelo varchar(20) not null,
descripcion varchar(50) not null,
foreign key (idCliente) references clientes(idCliente)
on update cascade
on delete cascade
);

create table productos(
idProducto int auto_increment primary key not null,
idCategoria int not null,
idProveedor int not null,
nombre varchar(50) not null,
precio double not null,
stock int not null,
foreign key (idCategoria) references categorias(idCategoria)
on update cascade
on delete cascade,
foreign key (idProveedor) references proveedores(idProveedor)
on update cascade
on delete cascade
);

create table reparaciones(
idReparacion int auto_increment primary key not null,
matricula varchar(20) not null,
idServicio int not null,
idEmpleado int not null,
fechaReparacion datetime not null,
costo double not null,
foreign key (matricula) references vehiculos(matricula)
on update cascade
on delete cascade,
foreign key (idServicio) references servicios(idServicio)
on update cascade
on delete cascade,
foreign key (idEmpleado) references empleados(idEmpleado)
on update cascade
on delete cascade
);

create table detalleReparacion(
 idReparacion int not null,
 idProducto int not null,
 cantidadUsada int not null,
 primary key (idReparacion, idProducto),
 foreign key (idReparacion) references reparaciones(idReparacion)
 on update cascade
 on delete cascade,
 foreign key (idProducto) references productos(idProducto)
 on update cascade
 on delete cascade
);
