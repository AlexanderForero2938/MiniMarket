-- Vista tabla nombre_producto.
use minimarket;

drop view if exists informacion_nombre_producto_estado_activo;

create view informacion_nombre_producto_estado_activo as
select 
    n.nombre_producto
    from nombre_producto as n
    where n.estado_nombre_producto = 'ACTIVO'
    order by n.nombre_producto asc;
