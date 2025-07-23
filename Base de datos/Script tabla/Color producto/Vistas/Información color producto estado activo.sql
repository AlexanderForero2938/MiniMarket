-- Vista tabla color_producto
use minimarket;

drop view if exists informacion_color_producto_estado_activo;

create view informacion_color_producto_estado_activo as
select
	c.nombre_color_producto
    from color_producto as c
    where c.estado_color_producto = 'ACTIVO'
    order by c.nombre_color_producto asc;