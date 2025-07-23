 -- Función para registrar en la tabla nombre_producto.
use minimarket;

drop function if exists registrar_nombre_producto;

delimiter $$
create function registrar_nombre_producto(
	p_nombre_producto varchar(25)
)
returns varchar(100)
deterministic
begin
    
    if exists(
		select 1 from nombre_producto where nombre_producto = upper(p_nombre_producto)
    ) then
		return 'Ese nombre ya se encuentra registrado en el sistema.';
	end if;
    
    insert into nombre_producto(
	    nombre_producto,
        estado_nombre_producto
    )
    values(
	    upper(p_nombre_producto),
        'ACTIVO'
    );
    return 'Se registro el nombre exitosamente en el sistema.';
    
end $$
delimiter ;