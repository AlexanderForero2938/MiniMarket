-- Función para modificar en la tabla gramaje_producto.
use minimarket;

drop function if exists modificar_nombre_gramaje_producto;

delimiter $$
create function modificar_nombre_gramaje_producto(
	p_id_gramaje_producto int,
	p_nuevo_nombre_gramaje_producto varchar(25)
)
returns varchar(100)
deterministic
begin
    
    if exists(
		select 1 from gramaje_producto where nombre_gramaje_producto = upper(p_nuevo_nombre_gramaje_producto)
    ) then
		return 'Ese gramaje ya se encuentra registrado en el sistema.';
	end if;
    
    update gramaje_producto
		set nombre_gramaje_producto = upper(p_nuevo_nombre_gramaje_producto)
	where id_gramaje_producto = p_id_gramaje_producto;
    
    return 'Se modifico el nombre del gramaje exitosamente en el sistema.';
    
end $$
delimiter ;