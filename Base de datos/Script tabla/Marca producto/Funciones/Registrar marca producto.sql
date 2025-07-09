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
	declare existe_marca int;
    declare nuevo_id int;
    
    select count(*) 
    into existe_marca
    from marca_producto
    where nombre_marca_producto = upper(p_nombre_marca_producto);
    
    if existe_marca > 0 then
    return 'Esa marca ya se encuentra registrada en el sistema.';
    end if;
    
    select coalesce(max(id_marca_producto), 0) + 1
    into nuevo_id
    from marca_producto;
    
    insert into marca_producto(
		id_marca_producto,
        nombre_marca_producto,
        estado_marca_producto
    )
    values(
		nuevo_id,
        upper(p_nombre_marca_producto),
        'ACTIVO'
    );
    return 'Se registro la marca exitosamente en el sistema.';
    
end $$
delimiter ;