-- Vista tabla nombre_producto.
use minimarket;

drop view if exists informacion_nombre_producto;

create view informacion_nombre_producto as
select 
	n.id_nombre_producto,
    n.nombre_producto,
    n.estado_nombre_producto
    from nombre_producto as n
    order by n.id_nombre_producto asc;