
-- CREACION DE VISTAS 

create view descrypCliente as
select nombre,apellido,convert(aes_decrypt(telefono,'@auto') using utf8) as telefono, 
convert(aes_decrypt(DUI,'@auto') using utf8) as DUI from clientes; 

create view descrypEmpleado as
select nombre,apellido,convert(aes_decrypt(telefono,'@auto') using utf8) as telefono,fechaNacimiento,
convert(aes_decrypt(Direccion,'@auto') using utf8) as Direccion from empleados;

create view descrypProveedor as
select nombreContacto,convert(aes_decrypt(telefono,'@auto') using utf8) as telefono,
convert(aes_decrypt(Direccion,'@auto') using utf8) as Direccion from proveedores;

