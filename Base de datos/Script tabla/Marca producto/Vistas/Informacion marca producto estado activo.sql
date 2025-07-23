-- Vista tabla marca_producto.
use minimarket;

drop view if exists informacion_marca_producto_estado_activo;

create view informacion_marca_producto_estado_activo as
select 
    m.nombre_marca_producto
    from marca_producto as m
    where m.estado_marca_producto = 'ACTIVO'
    order by m.nombre_marca_producto asc;
