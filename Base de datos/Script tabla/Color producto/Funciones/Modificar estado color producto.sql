-- Procedimiento para modificar en la tabla color_producto
use minimarket;

drop function if exists modificar_estado_color_producto;

delimiter $$

create function modificar_estado_color_producto(
	p_id_color_producto int,
    p_nuevo_estado_color_producto varchar(10)
)
returns varchar(100)
deterministic
begin
	update color_producto
		set estado_color_producto = upper(p_nuevo_estado_color_producto)
	where id_color_producto = p_id_color_producto;
    
    if upper(p_nuevo_estado_color_producto) = 'ACTIVO' then
		return 'Se activo el color';
	else
		return 'Se inactivo el color';
	end if;

end $$
delimiter ;