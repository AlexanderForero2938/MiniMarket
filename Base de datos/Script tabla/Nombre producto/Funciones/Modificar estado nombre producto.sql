-- Procedimiento para modificar en la tabla nombre_producto
use minimarket;

drop function if exists modificar_estado_nombre_producto;

delimiter $$
create function modificar_estado_nombre_producto(
	p_id_nombre_producto int,
    p_nuevo_estado_nombre_producto varchar(10)
)
returns varchar(100)
deterministic
begin
	update nombre_producto
		set estado_nombre_producto = upper(p_nuevo_estado_nombre_producto)
	where id_nombre_producto = p_id_nombre_producto;
    
    if upper(p_nuevo_estado_nombre_producto) = 'ACTIVO' then
		return 'Se activo el nombre';
	else
		return 'Se inactivo el nombre';
	end if;

end $$
delimiter ;