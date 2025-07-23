-- Procedimiento para modificar en la tabla gramaje_producto
use minimarket;

drop function if exists modificar_estado_gramaje_producto;

delimiter $$

create function modificar_estado_gramaje_producto(
	p_id_gramaje_producto int,
    p_nuevo_estado_gramaje_producto varchar(10)
)
returns varchar(100)
deterministic
begin
	update gramaje_producto
		set estado_gramaje_producto = upper(p_nuevo_estado_gramaje_producto)
	where id_gramaje_producto = p_id_gramaje_producto;
    
    if upper(p_nuevo_estado_gramaje_producto) = 'ACTIVO' then
		return 'Se activo el gramaje';
	else
		return 'Se inactivo el gramaje';
	end if;
    
end $$
delimiter ;