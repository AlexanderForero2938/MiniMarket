-- Función para modificar en la tabla nombre_producto.
use minimarket;

drop function if exists modificar_nombre_producto;

delimiter $$
create function modificar_nombre_producto(
	p_id_nombre_producto int,
	p_nuevo_nombre_producto varchar(25)
)
returns varchar(100)
deterministic
begin
    
    if exists(
		select 1 from nombre_producto where nombre_producto = upper(p_nuevo_nombre_producto)
    ) then
		return 'Ese nombre ya se encuentra registrado en el sistema.';
	end if;
    
    update nombre_producto
		set nombre_producto = upper(p_nuevo_nombre_producto)
	where id_nombre_producto = p_id_nombre_producto;
    
    return 'Se modifico el nombre exitosamente en el sistema.';
    
end $$
delimiter ;