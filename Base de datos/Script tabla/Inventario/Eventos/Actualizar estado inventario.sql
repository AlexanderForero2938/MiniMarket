-- Evento para actualizar la tabla inventario.
use minimarket;

drop event if exists actualizar_estado_inventario;

delimiter $$
create event actualizar_estado_inventario
on schedule every 1 day
starts timestamp(current_date(), '21:00:00')
do
begin
	update inventario
		set estado_inventario = 'CERRADO'
    where fecha_cierren_inventario = curdate();

end $$
delimiter ;
