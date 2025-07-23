-- Función para registrar en la tabla gramaje_producto.
use minimarket;

drop function if exists registrar_gramaje_producto;

delimiter $$
create function registrar_gramaje_producto(
	p_nombre_gramaje_producto varchar(25)
)
returns varchar(100)
deterministic
begin
    
    if exists(
		select 1 from gramaje_producto where nombre_gramaje_producto = upper(p_nombre_gramaje_producto)
    ) then
		return 'Ese gramaje ya se encuentra registrado en el sistema.';
	end if;
    
    insert into gramaje_producto(
	    nombre_gramaje_producto,
        estado_gramaje_producto
    )
    values(
	    upper(p_nombre_gramaje_producto),
        'ACTIVO'
    );
    return 'Se registro el gramaje exitosamente en el sistema.';
    
end $$
delimiter ;