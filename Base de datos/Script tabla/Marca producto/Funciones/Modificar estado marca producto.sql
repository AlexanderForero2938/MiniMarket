-- Procedimiento para modificar el estado en la tabla marca_producto
use minimarket;

drop function if exists modificar_estado_marca_producto;

delimiter $$
create function modificar_estado_marca_producto(
	p_id_marca_producto int,
    p_nuevo_estado_marca_producto varchar(10)
)
returns varchar(100)
deterministic
begin
	update marca_producto
		set estado_marca_producto = upper(p_nuevo_estado_marca_producto)
	where id_marca_producto = p_id_marca_producto;
	
    if upper(p_nuevo_estado_marca_producto) = 'ACTIVO' then
		return 'Se activo la marca';
	else
		return 'Se inactivo la marca';
	end if;

end $$
delimiter ;