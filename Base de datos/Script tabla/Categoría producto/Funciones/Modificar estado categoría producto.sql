-- Procedimiento para modificar en la tabla categoria_producto
use minimarket;

drop function if exists modificar_estado_categoria_producto;

delimiter $$

create function modificar_estado_categoria_producto(
	p_id_categoria_producto int,
    p_nuevo_estado_categoria_producto varchar(10)
)
returns varchar(100)
deterministic
begin
	update categoria_producto
		set estado_categoria_producto = upper(p_nuevo_estado_categoria_producto)
	where id_categoria_producto = p_id_categoria_producto;

	if upper(p_nuevo_estado_categoria_producto) = 'ACTIVO' then
		return 'Se activo la categoría';
	else
		return 'Se inactivo la categoría';
	end if;

end $$
delimiter ;