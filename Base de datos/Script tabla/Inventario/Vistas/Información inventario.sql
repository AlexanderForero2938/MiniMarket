-- Vista tabla inventario.
use minimarket;

drop view if exists informacion_inventario;

create view informacion_inventario as
select
	i.numero_inventario,
    i.fecha_creacion_inventario,
    i.fecha_cierre_inventario,
    i.valor_inventario,
    i.estado_inventario
    from inventario as i;