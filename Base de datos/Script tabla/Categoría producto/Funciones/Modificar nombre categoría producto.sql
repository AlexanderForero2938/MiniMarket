-- Función para modificar en la tabla categoria_producto.
use minimarket;

drop function if exists modificar_nombre_categoria_producto;

delimiter $$
create function modificar_nombre_categoria_producto(
	p_id_categoria_producto int,
	p_nuevo_nombre_categoria_producto varchar(25)
)
returns varchar(100)
deterministic
begin
    
    if exists(
		select 1 from categoria_producto where nombre_categoria_producto = upper(p_nuevo_nombre_categoria_producto)
    ) then
		return 'Esa categoría ya se encuentra registrada en el sistema.';
	end if;
    
    update categoria_producto
		set nombre_categoria_producto = upper(p_nuevo_nombre_categoria_producto)
	where id_categoria_producto = p_id_categoria_producto;
    
    return 'Se modifico el nombre de la categoría exitosamente en el sistema.';
    
end $$
delimiter ;