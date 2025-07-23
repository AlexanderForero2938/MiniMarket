-- Función para modificar en la tabla producto.
use minimarket;

drop function if exists modificar_precio_o_IVA_producto;

delimiter $$
create function modificar_informacion_producto(
	p_codigo_producto varchar(30),
	p_nuevo_precio_producto decimal(10,2),
    p_nuevo_valor_IVA_producto int
)
returns varchar(255)
deterministic
begin 
	declare p_precio_actual_producto decimal(10,2);
	declare p_id_IVA_actual_producto int;
    declare p_id_nuevo_IVA_producto int;
    
    select 
		p.precio_producto,
        p.id_IVA_producto
	into
		p_precio_actual_producto,
        p_id_IVA_actual_producto
	from producto as p
    where codigo_producto = p_codigo_producto;
           
	select id_IVA_producto
    into p_id_nuevo_IVA_producto
    from IVA_producto
    where valor_IVA_producto = p_nuevo_valor_IVA_producto;
		
    update producto
		set precio_producto = p_nuevo_precio_producto,
			id_IVA_producto = p_id_nuevo_IVA_producto
    where codigo_producto = p_codigo_producto;
    
    if p_precio_actual_producto <> p_nuevo_precio_producto and p_id_IVA_actual_producto <> p_id_nuevo_IVA_producto then
		return concat('Se modifico el precio y el IVA del producto con el código ', p_codigo_producto, 'exitosamente.');
	elseif p_precio_actual_producto <> p_nuevo_precio_producto then
		return concat('Se modifico el precio del producto con el código', p_codigo_producto, 'exitosamente');
	elseif p_id_IVA_actual_producto <> p_id_nuevo_IVA_producto then
		return concat('Se modifico el IVA del producto con el código', p_codigo_producto, 'exitosamente');
	end if;
    
end $$
delimiter ;