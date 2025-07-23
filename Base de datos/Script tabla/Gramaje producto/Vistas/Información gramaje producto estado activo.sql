-- Vista tabla gramaje_producto
use minimarket;

drop view if exists informacion_gramaje_producto_estado_activo;

create view informacion_gramaje_producto_estado_activo as
select
	g.nombre_gramaje_producto
    from gramaje_producto as g
    where g.estado_gramaje_producto = 'ACTIVO'
    order by g.nombre_gramaje_producto asc;