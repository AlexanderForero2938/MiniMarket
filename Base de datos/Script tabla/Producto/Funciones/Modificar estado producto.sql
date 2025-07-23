-- Función para modificar en la tabla producto.
use minimarket;

drop function if exists modificar_estado_producto;

delimiter $$
create function modificar_estado_producto(
	p_codigo_producto varchar(30),
	p_nuevo_estado_producto varchar(10)
)
returns varchar(100)
deterministic
begin 
	declare p_id_producto int;
    
    update producto
		set estado_producto = upper(p_nuevo_estado_producto)
	where codigo_producto = p_codigo_producto;
    
    if upper(p_nuevo_estado_producto) = 'ACTIVO' then
		return concat('Se activo el producto con el código ', p_codigo_producto);
	else
		return concat('Se inactivo el producto con el código ', p_codigo_producto);
    end if;
    
end $$
delimiter ;