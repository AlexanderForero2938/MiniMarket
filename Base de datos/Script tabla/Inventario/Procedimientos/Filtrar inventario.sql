-- Procedimiento para filtrar la tabla inventario.
use minimarket;

drop procedure if exists filtrar_inventario;

delimiter $$
create procedure filtrar_inventario(
	in p_fecha_inicio varchar(10),
    in p_fecha_final varchar(10)
)
begin
	declare fecha_inicio date;
    declare fecha_final date;
    
    set fecha_inicio = str_to_date(p_fecha_inicio, '%d-%m-%Y');
    set fecha_final = str_to_date(p_fecha_final, '%d-%m-%Y');
	
    select
		i.numero_inventario,
		i.fecha_creacion_inventario,
		i.fecha_cierre_inventario,
		i.valor_inventario,
		i.estado_inventario
		from inventario as i
		where fecha_cierre_inventario between fecha_inicio and fecha_final;
        
end $$
delimiter ;