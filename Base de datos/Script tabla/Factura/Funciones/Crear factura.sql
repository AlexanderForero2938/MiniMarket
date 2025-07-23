-- Función para insertar en la tabla factura
use minimarket;

drop function if exists crear_factura;

delimiter $$
create function crear_factura(
	p_numero_factura int,
    p_numero_identificacion_cliente varchar(10),
    p_id_usuario int,
    p_nombre_metodo_pago varchar(25),
    p_annio_emision_factura varchar(4)
)
returns int
deterministic
begin
	declare p_id_cliente int;
    declare p_id_empleado int;
    declare p_id_metodo_pago int;
    declare p_id_annio_factura int;
    declare p_codigo_factura varchar(20);

    -- Generar código de factura
    set p_codigo_factura = concat('FACTURA N° ', p_numero_factura, '-', p_annio_emision_factura);

    -- Obtener ID del cliente
    select c.id_cliente
    into p_id_cliente
    from persona as p
    inner join cliente c on p.id_persona = c.id_persona
    where p.numero_identificacion_persona = p_numero_identificacion_cliente;

    -- Obtener ID del empleado
    select e.id_empleado
    into p_id_empleado
    from usuario as u
    inner join empleado e on u.id_usuario = e.id_usuario
    where u.id_usuario = p_id_usuario;

    -- Obtener ID del método de pago
    select id_metodo_pago
    into p_id_metodo_pago
    from metodo_pago
    where nombre_metodo_pago = p_nombre_metodo_pago;

    -- Obtener ID del año
    select id_annio_factura
    into p_id_annio_factura
    from annio_factura
    where annio_emision_factura = cast(p_annio_emision_factura as unsigned);

    -- Insertar factura
    insert into factura (
        numero_factura,
        codigo_factura,
        valor_total_factura,
        estado_factura,
        id_cliente,
        id_empleado,
        id_metodo_pago,
        id_annio_factura
    ) values (
        p_numero_factura,
        p_codigo_factura,
        0.00,
        'PROCESO',
        p_id_cliente,
        p_id_empleado,
        p_id_metodo_pago,
        p_id_annio_factura
    );

	return last_insert_id();

end $$
delimiter ;
