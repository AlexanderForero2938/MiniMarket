-- Función para modificar en la tabla marca_producto.
use minimarket;

drop function if exists modificar_nombre_marca_producto;

delimiter $$
create function modificar_nombre_marca_producto(
	p_id_marca_producto int,
	p_nuevo_nombre_marca_producto varchar(25)
)
returns varchar(100)
deterministic
begin
    
    if exists(
		select 1 from marca_producto where nombre_marca_producto = upper(p_nuevo_nombre_marca_producto)
    ) then
		return 'Esa maraca ya se encuentra registrada en el sistema.';
	end if;
    
    update marca_producto
		set nombre_marca_producto = upper(p_nuevo_nombre_marca_producto)
	where id_marca_producto = p_id_marca_producto;
    
    return 'Se modifico el nombre de la marca exitosamente en el sistema.';
    
end $$
delimiter ;