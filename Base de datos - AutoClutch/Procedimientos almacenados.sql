-- PROCEDIMIENTOS ALMACENADOS DE LA BD AUTOCLUTCH

-- PROCEDIMIENTOS ALMACENADOS PARA INSERT
-- Procedimiento para ingresar un cliente
DELIMITER $$
create procedure insert_clientes (
    in v_nombre varchar(30),
    in v_apellido varchar(30),
    in v_telefono varbinary(255),
    in v_DUI varbinary(555)
)
begin
    declare cliente_existente int default 0;

    -- Declarar el handler para manejar errores de SQL
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    begin
        -- Manejo de errores y rollback en caso de falla
        rollback;
        select 'Error al insertar cliente' as mensaje;
    end;

    -- Verificar si el cliente ya existe
    select COUNT(*) into cliente_existente
    from clientes 
    where nombre = v_nombre and apellido = v_apellido;

    if cliente_existente > 0 then
        -- Si el cliente ya existe
        select 'Cliente registrado' as mensaje;
    else
        -- Si el cliente no existe, insertar un nuevo registro
        -- Iniciar la transacción
        start transaction;
        
        insert into clientes (nombre, apellido, telefono, DUI)
        values (v_nombre, v_apellido, v_telefono, v_DUI);
        
        -- Confirmar la transacción si todo es correcto
        commit;
        
        select 'Cliente ingresado correctamente' as mensaje;
    end if;
end $$
DELIMITER ;


-- Procedimiento para ingresar un empleado
DELIMITER $$
create procedure insert_empleados(
    in v_nombre varchar(30),
    in v_apellido varchar(30),
    in v_telefono varbinary(255),
    in v_fechaNacimiento date,
    in v_Direccion varbinary(555)
)
begin
    declare empleado_existente int default 0;

    -- Declarar el handler para manejar errores de SQL
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    begin
        -- Manejo de errores y rollback en caso de falla
        rollback;
        select 'Error al insertar empleado' as mensaje;
    end;

    -- Verificar si el empleado ya existe
    select COUNT(*) into empleado_existente
    from empleados 
    where nombre = v_nombre and apellido = v_apellido;

    if empleado_existente > 0 then
        -- Si el empleado ya existe
        select 'Empleado registrado' as mensaje;
    else
        -- Si el empleado no existe, insertar un nuevo registro
        -- Iniciar la transacción
        start transaction;
        
        insert into empleados (nombre, apellido, telefono, fechaNacimiento,Direccion)
        values (v_nombre, v_apellido, v_telefono,v_fechaNacimiento,v_Direccion);
        
        -- Confirmar la transacción si todo es correcto
        commit;
        
        select 'Empleado ingresado correctamente' as mensaje;
    end if;
end $$
DELIMITER ;


-- Procedimiento para ingresar un servicio
DELIMITER $$
create procedure insert_servicios(
    in v_nombre varchar(50),
    in v_Descripcion varchar(100)
)
begin
    declare servicio_existente int default 0;

    -- Declarar el handler para manejar errores de SQL
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    begin
        -- Manejo de errores y rollback en caso de falla
        rollback;
        select 'Error al insertar el servicio' as mensaje;
    end;

    -- Verificar si el servicio ya existe
    select COUNT(*) into servicio_existente
    from servicios 
    where nombre = v_nombre;

    if servicio_existente > 0 then
        -- Si el servicio ya existe
        select 'Servicio registrado' as mensaje;
    else
        -- Si el servicio no existe, insertar un nuevo registro
        -- Iniciar la transacción
        start transaction;
        
        insert into servicios (nombre,Descripcion)
        values (v_nombre,v_Descripcion);
        
        -- Confirmar la transacción si todo es correcto
        commit;
        
        select 'Servicio ingresado correctamente' as mensaje;
    end if;
end $$
DELIMITER ;


-- Procedimiento para ingresar una categoria
DELIMITER $$
create procedure insert_categorias(
    in v_nombre varchar(30),
    in v_Descripcion varchar(100)
)
begin
    declare categoria_existente int default 0;

    -- Declarar el handler para manejar errores de SQL
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    begin
        -- Manejo de errores y rollback en caso de falla
        rollback;
        select 'Error al insertar la categoria' as mensaje;
    end;

    -- Verificar si la categoria ya existe
    select COUNT(*) into categoria_existente
    from categorias 
    where nombre = v_nombre;

    if categoria_existente > 0 then
        -- Si la categoria ya existe
        select 'Categoria registrada' as mensaje;
    else
        -- Si la categoria no existe, insertar un nuevo registro
        -- Iniciar la transacción
        start transaction;
        
        insert into categorias (nombre,Descripcion)
        values (v_nombre,v_Descripcion);
        
        -- Confirmar la transacción si todo es correcto
        commit;
        
        select 'categoria ingresada correctamente' as mensaje;
    end if;
end $$
DELIMITER ;


-- Procedimiento para ingresar un proveedor
DELIMITER $$
create procedure insert_proveedores(
    in v_nombreContacto varchar(30),
    in v_Direccion varbinary(255),
    in v_telefono varbinary(255)
)
begin
    declare proveedor_existente int default 0;

    -- Declarar el handler para manejar errores de SQL
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    begin
        -- Manejo de errores y rollback en caso de falla
        rollback;
        select 'Error al insertar el proveedor' as mensaje;
    end;

    -- Verificar si el proveedor ya existe
    select COUNT(*) into proveedor_existente
    from proveedores 
    where nombreContacto = v_nombreContacto;

    if proveedor_existente > 0 then
        -- Si el proveedor ya existe
        select 'Proveedor registrado' as mensaje;
    else
        -- Si el proveedor no existe, insertar un nuevo registro
        -- Iniciar la transacción
        start transaction;
        
        insert into proveedores (nombreContacto,telefono,Direccion)
        values (v_nombreContacto,v_telefono,v_Direccion);
        
        -- Confirmar la transacción si todo es correcto
        commit;
        
        select 'proveedor ingresado correctamente' as mensaje;
    end if;
end $$
DELIMITER ;


-- Procedimiento para ingresar un usuario
DELIMITER $$
create procedure insert_usuarios(
    in v_usuario varchar(50),
    in v_contra varbinary(100),
     in v_tipoUsuario varchar(20)
)
begin
    declare usuario_existente int default 0;

    -- Declarar el handler para manejar errores de SQL
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    begin
        -- Manejo de errores y rollback en caso de falla
        rollback;
        select 'Error al insertar el usuario' as mensaje;
    end;

    -- Verificar si el usuario ya existe
    select COUNT(*) into usuario_existente
    from usuarios 
    where usuario = v_usuario and contra = v_contra;

    if usuario_existente > 0 then
        -- Si el usuario ya existe
        select 'Usuario registrado' as mensaje;
    else
        -- Si el usuario no existe, insertar un nuevo registro
        -- Iniciar la transacción
        start transaction;
        
        insert into usuarios (usuario,contra,tipoUsuario)
        values (v_usuario,v_contra,v_tipoUsuario);
        
        -- Confirmar la transacción si todo es correcto
        commit;
        
        select 'usuario ingresado correctamente' as mensaje;
    end if;
end $$
DELIMITER ;



-- Procedimiento para ingresar un vehiculo
DELIMITER $$
create procedure insert_vehiculos(
    in v_matricula varchar(20),
    in v_idCliente int,
     in v_marca varchar(20),
     in v_año char(4),
     in v_modelo varchar(20),
     in v_descripcion varchar(50)
)
begin
    declare vehiculo_existente int default 0;

    -- Declarar el handler para manejar errores de SQL
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    begin
        -- Manejo de errores y rollback en caso de falla
        rollback;
        select 'Error al insertar el vehiculo' as mensaje;
    end;

    -- Verificar si el vehiculo ya existe
    select COUNT(*) into vehiculo_existente
    from vehiculos 
    where matricula = v_matricula;

    if vehiculo_existente > 0 then
        -- Si el vehiculo ya existe
        select 'Vehiculo registrado' as mensaje;
    else
        -- Si el vehiculo no existe, insertar un nuevo registro
        -- Iniciar la transacción
        start transaction;
        
        insert into vehiculos (matricula,idCliente,marca,año,modelo,descripcion)
        values (v_matricula,v_idCliente,v_marca,v_año,v_modelo,v_descripcion);
        
        -- Confirmar la transacción si todo es correcto
        commit;
        
        select 'vehiculo ingresado correctamente' as mensaje;
    end if;
end $$
DELIMITER ;


-- Procedimiento para ingresar un producto
DELIMITER $$
create procedure insert_productos(
    in v_idCategoria int,
    in v_idProveedor int,
     in v_nombre varchar(50),
     in v_precio double,
     in v_stock int
)
begin
    declare producto_existente int default 0;

    -- Declarar el handler para manejar errores de SQL
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    begin
        -- Manejo de errores y rollback en caso de falla
        rollback;
        select 'Error al insertar el producto' as mensaje;
    end;

    -- Verificar si el producto ya existe
    select COUNT(*) into producto_existente
    from productos 
    where nombre = v_nombre;

    if producto_existente > 0 then
        -- Si el producto ya existe
        select 'Producto registrado' as mensaje;
    else
        -- Si el producto no existe, insertar un nuevo registro
        -- Iniciar la transacción
        start transaction;
        
        insert into productos (idCategoria,idProveedor,nombre,precio,stock)
        values (v_idCategoria,v_idProveedor,v_nombre,v_precio,v_stock);
        
        -- Confirmar la transacción si todo es correcto
        commit;
        
        select 'producto ingresado correctamente' as mensaje;
    end if;
end $$
DELIMITER ;


-- Procedimiento para ingresar reparaciones y detalleReparacion
delimiter $$

create procedure insert_reparacion (
    in v_matricula varchar(20),
    in v_idServicio int,
    in v_idEmpleado int,
    in v_costo double,
    in v_idProducto int,
    in v_CantidadUsada int
)
begin
    declare matricula_existente int default 0;
    declare servicio_existente int default 0;
    declare empleado_existente int default 0;
    declare producto_existente int default 0;

    -- Declarar el handler para manejar errores de SQL
    declare exit handler for sqlexception
    begin
        -- Manejo de errores y rollback en caso de falla
        rollback;
        select 'Error al insertar la reparacion' as mensaje;
    end;

    -- Etiqueta de inicio del bloque
    etiqueta_proc: begin

        -- Verificar que la matricula existe en la tabla de vehículos
        select count(*) into matricula_existente
        from vehiculos 
        where matricula = v_matricula;

        if matricula_existente = 0 then
            select 'Error: la matricula no existe' as mensaje;
            leave etiqueta_proc;
        end if;

        -- Verificar que el servicio existe
        select count(*) into servicio_existente
        from servicios 
        where idServicio = v_idServicio;

        if servicio_existente = 0 then
            select 'Error: el servicio no existe' as mensaje;
            leave etiqueta_proc;
        end if;

        -- Verificar que el empleado existe
        select count(*) into empleado_existente
        from empleados 
        where idEmpleado = v_idEmpleado;

        if empleado_existente = 0 then
            select 'Error: el empleado no existe' as mensaje;
            leave etiqueta_proc;
        end if;

        -- Verificar que el producto existe
        select count(*) into producto_existente
        from productos 
        where idProducto = v_idProducto;

        if producto_existente = 0 then
            select 'Error: el producto no existe' as mensaje;
            leave etiqueta_proc;
        end if;

        -- Iniciar la transacción
        start transaction;

        -- Insertar la reparación en la tabla reparaciones
        insert into reparaciones (matricula, idServicio, idEmpleado, fechaReparacion, costo)
        values (v_matricula, v_idServicio, v_idEmpleado, now(), v_costo);

        -- Obtener el id de la reparación insertada
        set @idReparacion = last_insert_id();

        -- Insertar el detalle de la reparación en la tabla detallesreparacion
        insert into detallesreparacion (idReparacion, idProducto, CantidadUsada)
        values (@idReparacion, v_idProducto, v_CantidadUsada);

        -- Confirmar la transacción si todo es correcto
        commit;

        select 'Reparacion ingresada correctamente' as mensaje;

    end etiqueta_proc;

end $$

delimiter ;

-- PROCEDIMIENTOS PARA UPDATE
-- Procedimiento para actualizar un cliente
DELIMITER $$
create procedure update_clientes (
    in v_idCliente int,
    in v_nombre varchar(30),
    in v_apellido varchar(30),
    in v_telefono varbinary(255),
    in v_DUI varbinary(555)
)
begin
    declare cliente_existente int default 0;

    -- Declarar el handler para manejar errores de SQL
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    begin
        -- Manejo de errores y rollback en caso de falla
        rollback;
        select 'Error al actualizar el cliente' as mensaje;
    end;

    -- Verificar si el cliente ya existe
    select COUNT(*) into cliente_existente
    from clientes 
    where idCliente = v_idCliente;

    if cliente_existente = 0 then
        -- Si el cliente no existe
        select 'Cliente no existe' as mensaje;
    else
        -- Si el cliente existe, actualizar el registro
        -- Iniciar la transacción
        start transaction;
        
        update clientes set nombre = v_nombre, apellido = v_apellido,
        telefono = v_telefono, DUI = v_DUI
        where idCliente = v_idCliente;

        
        -- Confirmar la transacción si todo es correcto
        commit;
        
        select 'Cliente actualizado correctamente' as mensaje;
    end if;
end $$
DELIMITER ;


-- Procedimiento para actualizar un empleado
DELIMITER $$
create procedure update_empleados(
    in v_idEmpleado int,
    in v_nombre varchar(30),
    in v_apellido varchar(30),
    in v_telefono varbinary(255),
    in v_fechaNacimiento date,
    in v_Direccion varbinary(555)
)
begin
    declare empleado_existente int default 0;

    -- Declarar el handler para manejar errores de SQL
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    begin
        -- Manejo de errores y rollback en caso de falla
        rollback;
        select 'Error al actualizar el empleado' as mensaje;
    end;

    -- Verificar si el empleado ya existe
    select COUNT(*) into empleado_existente
    from empleados 
    where idEmpleado = v_idEmpleado;

    if empleado_existente = 0 then
        -- Si el empleado no  existe
        select 'Empleado no existente' as mensaje;
    else
       -- Si el empleado existe, actualizar el registro
        -- Iniciar la transacción
        start transaction;
        
        update empleados set nombre = v_nombre , apellido = v_apellido , telefono = v_telefono,
        fechaNacimiento = v_fechaNacimiento, Direccion = v_Direccion
        where idEmpleado = v_idEmpleado;
        
        -- Confirmar la transacción si todo es correcto
        commit;
        
        select 'Empleado actualizado correctamente' as mensaje;
    end if;
end $$
DELIMITER ;

-- Procedimiento para actualizar un servicio
DELIMITER $$
create procedure update_servicios(
    in v_idServicio int,
    in v_nombre varchar(50),
    in v_Descripcion varchar(100)
)
begin
    declare servicio_existente int default 0;

    -- Declarar el handler para manejar errores de SQL
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    begin
        -- Manejo de errores y rollback en caso de falla
        rollback;
        select 'Error al actualizar el servicio' as mensaje;
    end;

    -- Verificar si el servicio ya existe
    select COUNT(*) into servicio_existente
    from servicios 
    where idServicio = v_idServicio;

    if servicio_existente = 0 then
        -- Si el servicio no existe
        select 'Servicio no existente' as mensaje;
    else
       -- Si el servicio existe, actualizar el registro
        -- Iniciar la transacción
        start transaction;
        
        update servicios set nombre = v_nombre, Descripcion = v_Descripcion
        where idServicio = v_idServicio;
        
        -- Confirmar la transacción si todo es correcto
        commit;
        
        select 'Servicio actualizado correctamente' as mensaje;
    end if;
end $$
DELIMITER ;

-- Procedimiento para actualizar una categoria
DELIMITER $$
create procedure update_categorias(
    in v_idCategoria int,
    in v_nombre varchar(30),
    in v_Descripcion varchar(100)
)
begin
    declare categoria_existente int default 0;

    -- Declarar el handler para manejar errores de SQL
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    begin
        -- Manejo de errores y rollback en caso de falla
        rollback;
        select 'Error al actualizar la categoria' as mensaje;
    end;

    -- Verificar si la categoria ya existe
    select COUNT(*) into categoria_existente
    from categorias 
    where idCategoria = v_idCategoria;

    if categoria_existente = 0 then
        -- Si la categoria no existe
        select 'Categoria no existente' as mensaje;
    else
        -- Si la categoria existe, actualizar el registro
        -- Iniciar la transacción
        start transaction;
        
        update categorias set nombre = v_nombre , Descripcion = v_Descripcion
        where idCategoria = v_idCategoria;
        
        -- Confirmar la transacción si todo es correcto
        commit;
        
        select 'categoria actualizada correctamente' as mensaje;
    end if;
end $$
DELIMITER ;



-- Procedimiento para actualizar un proveedor
DELIMITER $$
create procedure update_proveedores(
    in v_idProveedor int,
    in v_nombreContacto varchar(30),
    in v_Direccion varbinary(255),
    in v_telefono varbinary(255)
)
begin
    declare proveedor_existente int default 0;

    -- Declarar el handler para manejar errores de SQL
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    begin
        -- Manejo de errores y rollback en caso de falla
        rollback;
        select 'Error al actualizar el proveedor' as mensaje;
    end;

    -- Verificar si el proveedor ya existe
    select COUNT(*) into proveedor_existente
    from proveedores 
    where idProveedor = v_idProveedor;

    if proveedor_existente = 0 then
        -- Si el proveedor no existe
        select 'Proveedor no existente' as mensaje;
    else
        -- Si el proveedor existe, actualizar el registro
        -- Iniciar la transacción
        start transaction;
        
        update proveedores set nombreContacto = v_nombreContacto, telefono = v_telefono, Direccion = v_Direccion
        where idProveedor = v_idProveedor;
        
        -- Confirmar la transacción si todo es correcto
        commit;
        
        select 'proveedor actualizado correctamente' as mensaje;
    end if;
end $$
DELIMITER ;


-- Procedimiento para actualizar un usuario
DELIMITER $$
create procedure update_usuarios(
    in v_usuario varchar(50),
    in v_contra varbinary(100),
     in v_tipoUsuario varchar(20)
)
begin
    declare usuario_existente int default 0;

    -- Declarar el handler para manejar errores de SQL
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    begin
        -- Manejo de errores y rollback en caso de falla
        rollback;
        select 'Error al actualizar el usuario' as mensaje;
    end;

    -- Verificar si el usuario ya existe
    select COUNT(*) into usuario_existente
    from usuarios 
    where usuario = v_usuario and contra = v_contra;

    if usuario_existente = 0 then
        -- Si el usuario no existe
        select 'Usuario que quiere actualizar no existe' as mensaje;
    else
        -- Si el usuario existe, actualizar el registro
        -- Iniciar la transacción
        start transaction;
        
        update usuarios set usuario = v_usuario, contra = v_contra, tipoUsuario = v_tipoUsuario
        where usuario = v_usuario;
        -- Confirmar la transacción si todo es correcto
        commit;
        
        select 'usuario actualizado correctamente' as mensaje;
    end if;
end $$
DELIMITER ;

-- Procedimiento para actualizar un vehiculo
DELIMITER $$
create procedure update_vehiculos(
    in v_matricula varchar(20),
    in v_idCliente int,
     in v_marca varchar(20),
     in v_año char(4),
     in v_modelo varchar(20),
     in v_descripcion varchar(50)
)
begin
    declare vehiculo_existente int default 0;

    -- Declarar el handler para manejar errores de SQL
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    begin
        -- Manejo de errores y rollback en caso de falla
        rollback;
        select 'Error al actualizar el vehiculo' as mensaje;
    end;

    -- Verificar si el vehiculo ya existe
    select COUNT(*) into vehiculo_existente
    from vehiculos 
    where matricula = v_matricula;

    if vehiculo_existente = 0 then
        -- Si el vehiculo no existe
        select 'Vehiculo no registrado' as mensaje;
    else
        -- Si el vehiculo existe, actualizar el registro
        -- Iniciar la transacción
        start transaction;
        
		update vehiculos set matricula = v_matricula,idCliente = v_idCliente,marca = v_marca,
        año = v_año, modelo = v_modelo, descripcion = v_descripcion where matricula = v_matricula;
	
        
        -- Confirmar la transacción si todo es correcto
        commit;
        
        select 'vehiculo actualizado correctamente' as mensaje;
    end if;
end $$
DELIMITER ;

-- Procedimiento para actualizar un producto
DELIMITER $$
create procedure update_productos(
    in v_idProducto int,
    in v_idCategoria int,
    in v_idProveedor int,
     in v_nombre varchar(50),
     in v_precio double,
     in v_stock int
)
begin
    declare producto_existente int default 0;

    -- Declarar el handler para manejar errores de SQL
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    begin
        -- Manejo de errores y rollback en caso de falla
        rollback;
        select 'Error al actualizar el producto' as mensaje;
    end;

    -- Verificar si el producto ya existe
    select COUNT(*) into producto_existente
    from productos 
    where idCategoria = v_idCategoria;

    if producto_existente = 0 then
        -- Si el producto no existe
        select 'Producto no existente' as mensaje;
    else
        -- Si el producto ya existe, actualizar el registro
        -- Iniciar la transacción
        start transaction;
        
        update productos set idCategoria = v_idCategoria,idProveedor = v_idProveedor,nombre = v_nombre,
        precio = v_precio, stock = v_stock where idProducto = v_idProducto;
        
        -- Confirmar la transacción si todo es correcto
        commit;
        
        select 'producto actualizado correctamente' as mensaje;
    end if;
end $$
DELIMITER ;




-- Procedimiento para actualizar las reparaciones
delimiter $$

create procedure update_reparacion (
    in v_idReparacion int, 
    in v_matricula varchar(20),
    in v_idServicio int,
    in v_idEmpleado int,
    in v_fechaReparacion datetime,
    in v_costo double,
    in v_idProducto int,
    in v_CantidadUsada int
)
begin
    declare reparacion_existente int default 0;

    -- Declarar el handler para manejar errores de SQL
    declare exit handler for sqlexception
    begin
        -- Manejo de errores y rollback en caso de falla
        rollback;
        select 'Error al actualizar la reparacion' as mensaje;
    end;

    -- Verificar que la reparación existe
    select count(*) into reparacion_existente
    from reparaciones
    where idReparacion = v_idReparacion;

    if reparacion_existente = 0 then
     -- Si la reparacion no existe
        select 'Error: la reparación no existe' as mensaje;
    else
        -- Iniciar la transacción
        start transaction;
        -- Si la reparacion ya existe, actualizar el registro
        -- Iniciar la transacción
        update reparaciones 
        set matricula = v_matricula, 
            idServicio = v_idServicio, 
            idEmpleado = v_idEmpleado,
            fechaReparacion = v_fechaReparacion,
            costo = v_costo 
        where idReparacion = v_idReparacion;

        -- Actualizar el detalle de la reparación en la tabla detallereparacion
        update detallereparacion 
        set idProducto = v_idProducto, 
            CantidadUsada = v_CantidadUsada
        where idReparacion = v_idReparacion
          and idProducto = v_idProducto;

        -- Confirmar la transacción si todo es correcto
        commit;

        select 'Reparación actualizada correctamente' as mensaje;
    end if;
end $$

delimiter ;

-- PROCEDIMIENTOS ALMACENADOS PARA DELETE
-- Procedimiento para eliminar un cliente
DELIMITER $$
create procedure delete_clientes (
    in v_idCliente int
)
begin
    declare cliente_existente int default 0;

    -- Declarar el handler para manejar errores de SQL
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    begin
        -- Manejo de errores y rollback en caso de falla
        rollback;
        select 'Error al eliminar el cliente' as mensaje;
    end;

    -- Verificar si el cliente ya existe
    select COUNT(*) into cliente_existente
    from clientes c
    where idCliente = v_idCliente;

    if cliente_existente = 0 then
        -- Si el cliente no existe
        select 'Cliente no existe' as mensaje;
    else
        -- Si el cliente existe, eliminar el registro
        -- Iniciar la transacción
        start transaction;
        
                 delete from clientes where idCliente = v_idCliente;

        
        -- Confirmar la transacción si todo es correcto
        commit;
        
        select 'Cliente eliminado correctamente' as mensaje;
    end if;
end $$
DELIMITER ;

-- Procedimiento para eliminar un empleado
DELIMITER $$
create procedure delete_empleados(
    in v_idEmpleado int
)
begin
    declare empleado_existente int default 0;

    -- Declarar el handler para manejar errores de SQL
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    begin
        -- Manejo de errores y rollback en caso de falla
        rollback;
        select 'Error al eliminar empleado' as mensaje;
    end;

    -- Verificar si el empleado ya existe
    select COUNT(*) into empleado_existente
    from empleados 
    where idEmpleado = v_idEmpleado;

    if empleado_existente = 0 then
        -- Si el empleado no  existe
        select 'Empleado no existente' as mensaje;
    else
       -- Si el empleado existe, eliminar el registro
        -- Iniciar la transacción
        start transaction;
        
        delete from empleados where idEmpleado = v_idEmpleado;
        
        -- Confirmar la transacción si todo es correcto
        commit;
        
        select 'Empleado eliminado correctamente' as mensaje;
    end if;
end $$
DELIMITER ;

-- Procedimiento para eliminar un servicio
DELIMITER $$
create procedure delete_servicios(
    in v_idServicio int
)
begin
    declare servicio_existente int default 0;

    -- Declarar el handler para manejar errores de SQL
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    begin
        -- Manejo de errores y rollback en caso de falla
        rollback;
        select 'Error al eliminar el servicio' as mensaje;
    end;

    -- Verificar si el servicio ya existe
    select COUNT(*) into servicio_existente
    from servicios c
    where idServicio = v_idServicio;

    if servicio_existente = 0 then
        -- Si el servicio no existe
        select 'Servicio no existente' as mensaje;
    else
       -- Si el servicio existe, eliminar el registro
        -- Iniciar la transacción
        start transaction;
        
        delete from servicios where idServicio = v_idServicio;
        
        -- Confirmar la transacción si todo es correcto
        commit;
        
        select 'Servicio eliminado correctamente' as mensaje;
    end if;
end $$
DELIMITER ;

-- Procedimiento para eliminar un proveedor
DELIMITER $$
create procedure delete_proveedores(
    in v_idProveedor int
)
begin
    declare proveedor_existente int default 0;

    -- Declarar el handler para manejar errores de SQL
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    begin
        -- Manejo de errores y rollback en caso de falla
        rollback;
        select 'Error al eliminar el proveedor' as mensaje;
    end;

    -- Verificar si el proveedor ya existe
    select COUNT(*) into proveedor_existente
    from proveedores c
    where idProveedor = v_idProveedor;

    if proveedor_existente = 0 then
        -- Si el proveedor no existe
        select 'Proveedor no existente' as mensaje;
    else
        -- Si el proveedor existe, eliminar el registro
        -- Iniciar la transacción
        start transaction;
        
        delete from proveedores where idProveedor = v_idProveedor;
        
        -- Confirmar la transacción si todo es correcto
        commit;
        
        select 'proveedor eliminar correctamente' as mensaje;
    end if;
end $$
DELIMITER ;

-- Procedimiento para eliminar un usuario
DELIMITER $$
create procedure delete_usuarios(
    in v_usuario varchar(50)
)
begin
    declare usuario_existente int default 0;

    -- Declarar el handler para manejar errores de SQL
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    begin
        -- Manejo de errores y rollback en caso de falla
        rollback;
        select 'Error al eliminar el usuario' as mensaje;
    end;

    -- Verificar si el usuario ya existe
    select COUNT(*) into usuario_existente
    from usuarios 
    where usuario = v_usuario;

    if usuario_existente = 0 then
        -- Si el usuario no existe
        select 'Usuario que quiere eliminar no existe' as mensaje;
    else
        -- Si el usuario existe, eliminar el registro
        -- Iniciar la transacción
        start transaction;
        
       delete from usuarios
        where usuario = v_usuario;
        -- Confirmar la transacción si todo es correcto
        commit;
        
        select 'usuario eliminado correctamente' as mensaje;
    end if;
end $$
DELIMITER ;



-- Procedimiento para eliminar un vehiculo
DELIMITER $$
create procedure delete_vehiculos(
    in v_matricula varchar(20)
)
begin
    declare vehiculo_existente int default 0;

    -- Declarar el handler para manejar errores de SQL
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    begin
        -- Manejo de errores y rollback en caso de falla
        rollback;
        select 'Error al eliminar el vehiculo' as mensaje;
    end;

    -- Verificar si el vehiculo ya existe
    select COUNT(*) into vehiculo_existente
    from vehiculos 
    where matricula = v_matricula;

    if vehiculo_existente = 0 then
        -- Si el vehiculo no existe
        select 'Vehiculo no registrado' as mensaje;
    else
        -- Si el vehiculo existe, eliminar el registro
        -- Iniciar la transacción
        start transaction;
        
		 delete from vehiculos where matricula = v_matricula;
	
        
        -- Confirmar la transacción si todo es correcto
        commit;
        
        select 'vehiculo eliminado correctamente' as mensaje;
    end if;
end $$
DELIMITER ;


-- Procedimiento para eliminar un producto
DELIMITER $$
create procedure delete_productos(
    in v_idProducto int
)
begin
    declare producto_existente int default 0;

    -- Declarar el handler para manejar errores de SQL
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    begin
        -- Manejo de errores y rollback en caso de falla
        rollback;
        select 'Error al eliminar el producto' as mensaje;
    end;

    -- Verificar si el producto ya existe
    select COUNT(*) into producto_existente
    from productos 
    where idProducto = v_idProducto;

    if producto_existente = 0 then
        -- Si el producto no existe
        select 'Producto no existente' as mensaje;
    else
        -- Si el producto ya existe, eliminar el registro
        -- Iniciar la transacción
        start transaction;
        
         delete from productos where idProducto = v_idProducto;
        
        -- Confirmar la transacción si todo es correcto
        commit;
        
        select 'producto eliminado correctamente' as mensaje;
    end if;
end $$
DELIMITER ;

-- PROCEDIMIENTOS ALMACENADOS PARA FILTRO DE DATOS
delimiter $$

-- Filtrado de clientes
create procedure filtradoClientes(
    in filtro varchar(50),
    in tipUsuario varchar(20)
)
begin
    declare validacion varchar(20) default '';

    -- declarar el handler para manejar errores de sql
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    begin
        -- manejo de errores en caso de fallo
        select 'error al filtrar' as mensaje;
    end;

    -- buscar el tipo de usuario
    select tipoUsuario into validacion 
    from usuarios
    where tipoUsuario = tipUsuario;

    -- verificar el tipo de usuario 
    if validacion = 'secretaria' then
        select * from clientes
        where nombre like concat(filtro,'%');
    elseif validacion = 'gerente' or validacion = 'admin' then
        select * from descrypCliente
        where nombre like concat(filtro,'%');
    else
        select 'usuario no autorizado o no existente' as mensaje;
    end if;

end$$

delimiter ;

-- Filtrado de empleados
delimiter $$
create procedure filtradoEmpleados(
    in filtro varchar(50),
    in tipUsuario varchar(20)
)
begin
    declare validacion varchar(20) default '';

    -- declarar el handler para manejar errores de sql
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    begin
        -- manejo de errores en caso de fallo
        select 'error al filtrar' as mensaje;
    end;

    -- buscar el tipo de usuario
    select tipoUsuario into validacion 
    from usuarios
    where tipoUsuario = tipUsuario;

    -- verificar el tipo de usuario 
    if validacion = 'secretaria' then
        select * from empleados
        where nombre like concat(filtro,'%') or apellido like concat(filtro,'%');
    elseif validacion = 'gerente' or validacion = 'admin' then
        select * from descrypempleado
        where nombre like concat(filtro,'%') or apellido like concat(filtro,'%');
    else
        select 'usuario no autorizado o no existente' as mensaje;
    end if;

end$$

delimiter ;


-- Filtrado de proveedores 
delimiter $$
create procedure filtradoProveedores(
    in filtro varchar(50),
    in tipUsuario varchar(20)
)
begin
    declare validacion varchar(20) default '';

    -- declarar el handler para manejar errores de sql
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    begin
        -- manejo de errores en caso de fallo
        select 'error al filtrar' as mensaje;
    end;

    -- buscar el tipo de usuario
    select tipoUsuario into validacion 
    from usuarios
    where tipoUsuario = tipUsuario;

    -- verificar el tipo de usuario 
    if validacion = 'secretaria' then
        select * from proveedores
        where nombreContacto like concat(filtro,'%');
    elseif validacion = 'gerente' or validacion = 'admin' then
        select * from descrypproveedor
        where nombreContacto like concat(filtro,'%');
    else
        select 'usuario no autorizado o no existente' as mensaje;
    end if;

end$$

delimiter ;


-- Filtrado de servicios 
delimiter $$
create procedure filtradoServicios(
    in filtro varchar(50),
    in tipUsuario varchar(20)
)
begin
    declare validacion varchar(20) default '';

    -- declarar el handler para manejar errores de sql
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    begin
        -- manejo de errores en caso de fallo
        select 'error al filtrar' as mensaje;
    end;

    -- buscar el tipo de usuario
    select tipoUsuario into validacion 
    from usuarios
    where tipoUsuario = tipUsuario;

    -- verificar el tipo de usuario 
    if validacion in ('secretaria','gerente','admin') then
        select * from servicios
        where nombre like concat(filtro,'%');
    else
        select 'usuario no autorizado o no existente' as mensaje;
    end if;

end$$

delimiter ;

-- Filtrado de vehiculos
delimiter $$
create procedure filtradoVehiculos(
    in filtro varchar(50),
    in tipUsuario varchar(20)
)
begin
    declare validacion varchar(20) default '';

    -- declarar el handler para manejar errores de sql
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    begin
        -- manejo de errores en caso de fallo
        select 'error al filtrar' as mensaje;
    end;

    -- buscar el tipo de usuario
    select tipoUsuario into validacion 
    from usuarios
    where tipoUsuario = tipUsuario;

    -- verificar el tipo de usuario 
    if validacion in ('secretaria','gerente','admin') then
        select * from vehiculos
        where filtro like concat(filtro,'%');
    else
        select 'usuario no autorizado o no existente' as mensaje;
    end if;

end$$

delimiter ;


-- Filtrado de productos
delimiter $$
create procedure filtradoProductos(
    in filtro varchar(50),
    in tipUsuario varchar(20)
)
begin
    declare validacion varchar(20) default '';

    -- declarar el handler para manejar errores de sql
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    begin
        -- manejo de errores en caso de fallo
        select 'error al filtrar' as mensaje;
    end;

    -- buscar el tipo de usuario
    select tipoUsuario into validacion 
    from usuarios
    where tipoUsuario = tipUsuario;

    -- verificar el tipo de usuario 
    if validacion in ('secretaria','gerente','admin') then
        select * from productos
        where nombre like concat(filtro,'%');
    else
        select 'usuario no autorizado o no existente' as mensaje;
    end if;

end$$

delimiter ;


-- Filtrado de categorias
delimiter $$
create procedure filtradoCategorias(
    in filtro varchar(50),
    in tipUsuario varchar(20)
)
begin
    declare validacion varchar(20) default '';

    -- declarar el handler para manejar errores de sql
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    begin
        -- manejo de errores en caso de fallo
        select 'error al filtrar' as mensaje;
    end;

    -- buscar el tipo de usuario
    select tipoUsuario into validacion 
    from usuarios
    where tipoUsuario = tipUsuario;

    -- verificar el tipo de usuario 
    if validacion in ('secretaria','gerente','admin') then
        select * from categorias
        where nombre like concat(filtro,'%');
    else
        select 'usuario no autorizado o no existente' as mensaje;
    end if;

end$$

delimiter ;


-- Filtrado de reparaciones
delimiter $$
create procedure filtradoReparaciones(
    in filtro varchar(50),
    in tipUsuario varchar(20)
)
begin
    declare validacion varchar(20) default '';

    -- declarar el handler para manejar errores de sql
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    begin
        -- manejo de errores en caso de fallo
        select 'error al filtrar' as mensaje;
    end;

    -- buscar el tipo de usuario
    select tipoUsuario into validacion 
    from usuarios
    where tipoUsuario = tipUsuario;

    -- verificar el tipo de usuario 
    if validacion in ('secretaria','gerente','admin') then
        select r.*,dt.idProducto,dt.CantidadUsada from reparaciones r
        inner join detallereparacion dt on r.idReparacion = dt.idReparacion
        where matricula like concat(filtro,'%') or idReparacion = convert(filtro, signed);
    else
        select 'usuario no autorizado o no existente' as mensaje;
    end if;

end$$

delimiter ;

