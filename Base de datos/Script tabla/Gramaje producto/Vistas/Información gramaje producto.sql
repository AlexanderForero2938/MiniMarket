-- Vista tabla gramaje_producto.
use minimarket;

drop view if exists informacion_gramaje_producto;

create view informacion_gramaje_producto as
select 
	g.id_gramaje_producto,
    g.nombre_gramaje_producto,
    g.estado_gramaje_producto
    from gramaje_producto as g
    order by g.id_gramaje_producto asc;
