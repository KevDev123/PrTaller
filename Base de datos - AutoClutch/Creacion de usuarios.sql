-- CREACION DE USUARIOS PARA BD
-- CREACION DE USUARIO : SECRETARIA
Create user 'Secretaria'@'%' 	identified by 'SecretAutoClutch';

-- revocar permisos ddl 
revoke create, alter, drop on autoclutch.* from 'Secretaria'@'%';
revoke create routine, alter routine on autoclutch.* from 'Secretaria'@'%';
revoke trigger on autoclutch.* from 'Secretaria'@'%';
revoke grant option on autoclutch.* from 'Secretaria'@'%';
flush privileges;


-- asignacion de permisos para la bd
grant select,update,insert on autoclutch.* to 'Secretaria'@'%';
grant select,update,insert on autoclutch.usuarios to 'Secretaria'@'%';
revoke update,insert on autoclutch.usuarios from 'Secretaria'@'%';

-- asignacion de permisos en ejecucion de procedimientos almacenados especificos
-- insert
grant execute on procedure autoclutch.insert_clientes to 'Secretaria'@'%';
grant execute on procedure autoclutch.insert_empleados to 'Secretaria'@'%';
grant execute on procedure autoclutch.insert_productos to 'Secretaria'@'%';
grant execute on procedure autoclutch.insert_proveedores to 'Secretaria'@'%';
grant execute on procedure autoclutch.insert_reparacion to 'Secretaria'@'%';
grant execute on procedure autoclutch.insert_vehiculos to 'Secretaria'@'%';

-- update
grant execute on procedure autoclutch.update_clientes to 'Secretaria'@'%';
grant execute on procedure autoclutch.update_empleados to 'Secretaria'@'%';
grant execute on procedure autoclutch.update_productos to 'Secretaria'@'%';
grant execute on procedure autoclutch.update_proveedores to 'Secretaria'@'%';
grant execute on procedure autoclutch.update_reparacion to 'Secretaria'@'%';
grant execute on procedure autoclutch.update_vehiculos to 'Secretaria'@'%';

-- filtrado
grant execute on procedure autoclutch.filtradoClientes to 'Secretaria'@'%';
grant execute on procedure autoclutch.filtradoEmpleados to 'Secretaria'@'%';
grant execute on procedure autoclutch.filtradoProductos to 'Secretaria'@'%';
grant execute on procedure autoclutch.filtradoProveedores to 'Secretaria'@'%';
grant execute on procedure autoclutch.filtradoReparaciones to 'Secretaria'@'%';
grant execute on procedure autoclutch.filtradoVehiculos to 'Secretaria'@'%';
grant execute on procedure autoclutch.filtradoCategorias to 'Secretaria'@'%';
grant execute on procedure autoclutch.filtradoServicios to 'Secretaria'@'%';

FLUSH PRIVILEGES;



-- CREACION DE USUARIO : GERENTE
Create user 'Gerente'@'%' 	identified by 'GerenteAutoClutch';

-- revocar permisos ddl 
revoke create, alter, drop on autoclutch.* from 'Gerente'@'%';
revoke create routine, alter routine on autoclutch.* from 'Gerente'@'%';
revoke trigger on autoclutch.* from 'Gerente'@'%';
revoke grant option on autoclutch.* from 'Gerente'@'%';
flush privileges;


-- asignacion de permisos para la bd
grant select,update,insert on autoclutch.* to 'Gerente'@'%';
grant select,update,insert on autoclutch.usuarios to 'Gerente'@'%';
revoke update,insert on autoclutch.usuarios from 'Gerente'@'%';

-- asignacion de permisos en ejecucion de procedimientos almacenados especificos
-- insert
grant execute on procedure autoclutch.insert_clientes to 'Gerente'@'%';
grant execute on procedure autoclutch.insert_empleados to 'Gerente'@'%';
grant execute on procedure autoclutch.insert_productos to 'Gerente'@'%';
grant execute on procedure autoclutch.insert_proveedores to 'Gerente'@'%';
grant execute on procedure autoclutch.insert_reparacion to 'Gerente'@'%';
grant execute on procedure autoclutch.insert_vehiculos to 'Gerente'@'%';

-- update
grant execute on procedure autoclutch.update_clientes to 'Gerente'@'%';
grant execute on procedure autoclutch.update_empleados to 'Gerente'@'%';
grant execute on procedure autoclutch.update_productos to 'Gerente'@'%';
grant execute on procedure autoclutch.update_proveedores to 'Gerente'@'%';
grant execute on procedure autoclutch.update_reparacion to 'Gerente'@'%';
grant execute on procedure autoclutch.update_vehiculos to 'Gerente'@'%';

-- delete
grant execute on procedure autoclutch.delete_clientes to 'Gerente'@'%';
grant execute on procedure autoclutch.delete_empleados to 'Gerente'@'%';
grant execute on procedure autoclutch.delete_productos to 'Gerente'@'%';
grant execute on procedure autoclutch.delete_proveedores to 'Gerente'@'%';
grant execute on procedure autoclutch.delete_vehiculos to 'Gerente'@'%';


-- filtrado
grant execute on procedure autoclutch.filtradoClientes to 'Gerente'@'%';
grant execute on procedure autoclutch.filtradoEmpleados to 'Gerente'@'%';
grant execute on procedure autoclutch.filtradoProductos to 'Gerente'@'%';
grant execute on procedure autoclutch.filtradoProveedores to 'Gerente'@'%';
grant execute on procedure autoclutch.filtradoReparaciones to 'Gerente'@'%';
grant execute on procedure autoclutch.filtradoVehiculos to 'Gerente'@'%';
grant execute on procedure autoclutch.filtradoCategorias to 'Gerente'@'%';
grant execute on procedure autoclutch.filtradoServicios to 'Gerente'@'%';

FLUSH PRIVILEGES;


-- CREACION DE USUARIO : ADMIN


create user 'admin'@'%' identified by 'AdminAutoClutch';


grant all privileges on *.* to 'admin'@'%' with grant option;


flush privileges;
