-- Función para registrar en la tabla categoria_producto.
use minimarket;

drop function if exists registrar_nombre_categoria_producto;

delimiter $$
create function registrar_nombre_categoria_producto(
	p_nombre_categoria_producto varchar(25)
)
returns varchar(100)
deterministic
begin 
    
    if exists(
		select 1 from categoria_producto where nombre_categoria_producto = upper(p_nombre_categoria_producto)
    ) then
		return 'Esa categoría ya se encuentra registrada en el sistema.';
	end if;
	
    insert into categoria_producto(
        nombre_categoria_producto,
        estado_categoria_producto
    )
    values(
        upper(p_nombre_categoria_producto),
        'ACTIVO'
    );
    return 'Se registro la categoría exitosamente en el sistema.';
    
end $$
delimiter ;