-- Función para registrar en la tabla inventario.
use minimarket;

drop function if exists crear_inventario;

delimiter $$
create function crear_inventario(
	p_fecha_cierre varchar(10)    
)
returns varchar(100)
deterministic
begin 
	declare nuevo_id int;
    declare fecha date;
    
    -- Convierte la p_fecha_cierre a date.
    set fecha = str_to_date(p_fecha_cierre, '%d-%m-%Y');
    
	if fecha <= curdate() then
     return 'La fecha de cierre no puede ser igual o menor a la fecha actual';
	end if;
    
    -- Obtiene el ultimo id de la tabla inventario.
	select coalesce(max(numero_inventario), 0) + 1
    into nuevo_id
    from inventario;
    
    insert into inventario(
		numero_inventario,
        fecha_creacion_inventario,
        fecha_cierre_inventario,
        valor_inventario,
        estado_inventario
    )
    values(
		nuevo_id,
        curdate(),
        fecha,
        0.00,
        'ABIERTO'
    );
    return 'Se creo el inventario exitosamente en el sistema.';
    
end $$
delimiter ;
    