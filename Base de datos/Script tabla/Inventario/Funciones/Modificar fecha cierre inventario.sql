-- Función para modificar en la tabla inventario.
use minimarket;

drop function if exists modificar_fecha_cierre_inventario;

delimiter $$
create function modificar_fecha_cierre_inventario(
	p_numero_inventario int,
    p_nueva_fecha_cierre_inventario varchar(10)
)
returns varchar(100)
deterministic
begin
	declare fecha_cierre_actual date;
    declare nueva_fecha_cierre date;
    
    select fecha_cierre_inventario
    into fecha_cierre_actual
    from inventario
    where numero_inventario = p_numero_inventario;
    
    set nueva_fecha_cierre = str_to_date(p_nueva_fecha_cierre_inventario, '%d-%m-%Y');
    
    if nueva_fecha_cierre <> fecha_cierre_actual then
		update inventario
        set fecha_cierre_inventario = nueva_fecha_cierre
        where numero_inventario = p_numero_inventario;
		
        return 'Se modifico la fecha de cierre del inventario';
    else
		return 'La nueva fecha de cierre no puede ser igual a la anterior';
	end if;
    
end $$
delimiter ;
    
    
    