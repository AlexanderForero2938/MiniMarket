-- Función para modificar en la tabla color_producto.
use minimarket;

drop function if exists modificar_nombre_color_producto;

delimiter $$
create function modificar_nombre_color_producto(
	p_id_color_producto int,
	p_nuevo_nombre_color_producto varchar(25)
)
returns varchar(100)
deterministic
begin
    
    if exists(
		select 1 from color_producto where nombre_color_producto = upper(p_nuevo_nombre_color_producto)
    ) then
		return 'Ese color ya se encuentra registrado en el sistema.';
	end if;
    
    update color_producto
		set nombre_color_producto = upper(p_nuevo_nombre_color_producto)
	where id_color_producto = p_id_color_producto;
    
    return 'Se modifico el color exitosamente en el sistema.';
    
end $$
delimiter ;