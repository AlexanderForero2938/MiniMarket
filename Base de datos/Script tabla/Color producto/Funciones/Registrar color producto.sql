-- Función para registrar en la tabla color_producto.
use minimarket;

drop function if exists registrar_nombre_color_producto;

delimiter $$
create function registrar_nombre_color_producto(
	p_nombre_color_producto varchar(25)
)
returns varchar(100)
deterministic
begin
    
    if exists(
		select 1 from color_producto where nombre_color_producto = upper(p_nombre_color_producto)
    ) then
		return 'Esa color ya se encuentra registrado en el sistema.';
	end if;
    
    insert into color_producto(
	    nombre_color_producto,
        estado_color_producto
    )
    values(
	    upper(p_nombre_color_producto),
        'ACTIVO'
    );
    return 'Se registro el color exitosamente en el sistema.';
    
end $$
delimiter ;