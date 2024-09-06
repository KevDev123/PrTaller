use autoclutch;

-- trigger para la encriptacion de contras de usuarios cuando se hace una insercion

delimiter $$
create trigger encriptacionUser
 before insert on usuarios
for each row
begin
     set new.contra = aes_encrypt(new.contra, '@auto');
end$$

delimiter ;

-- trigger para la encriptacion de contras de usuarios cuando se hace una actualizacion

delimiter $$
create trigger encriptacionActUser
 before update on usuarios
for each row
begin
     set new.contra = aes_encrypt(new.contra, '@auto');
end$$

delimiter ;


-- trigger para la encriptacion de datos de los clientes cuando se hace una insercion
delimiter $$

create trigger encriptacionCliente
before insert on clientes
for each row
begin 
     set new.telefono = aes_encrypt(new.telefono,'@auto');
     set new.DUI = aes_encrypt(new.DUI,'@auto');
end$$

delimiter ;

-- trigger para la encriptacion de datos de los clientes cuando se hace una actualizacion
delimiter $$

create trigger encriptacionActCliente
before update on clientes
for each row
begin 
     set new.telefono = aes_encrypt(new.telefono,'@auto');
     set new.DUI = aes_encrypt(new.DUI,'@auto');
end$$

delimiter ;


-- trigger para la encriptacion de datos de los empleados cuando se hace una insercion
delimiter $$

create trigger encriptacionEmpleado
before insert on empleados
for each row
begin 
     set new.telefono = aes_encrypt(new.telefono,'@auto');
     set new.Direccion = aes_encrypt(new.Direccion,'@auto');
end$$

delimiter ;


-- trigger para la encriptacion de datos de los empleados cuando se hace una actualizacion
delimiter $$

create trigger encriptacionActEmpleado
before update on empleados
for each row
begin 
     set new.telefono = aes_encrypt(new.telefono,'@auto');
     set new.Direccion = aes_encrypt(new.Direccion,'@auto');
end$$

delimiter ;
