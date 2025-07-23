-- Función para registrar en la tabla marca_producto.
use minimarket;

drop function if exists registrar_marca_producto;

delimiter $$
create function registrar_marca_producto(
	p_nombre_marca_producto varchar(25)
)
returns varchar(100)
deterministic
begin
    
    if exists(
		select 1 from marca_producto where nombre_marca_producto = upper(p_nombre_marca_producto)
    ) then
		return 'Esa marca ya se encuentra registrada en el sistema.';
	end if;
    
    insert into marca_producto(
	    nombre_marca_producto,
        estado_marca_producto
    )
    values(
	    upper(p_nombre_marca_producto),
        'ACTIVO'
    );
    return 'Se registro la marca exitosamente en el sistema.';
    
end $$
delimiter ;