-- Vista tabla color_producto.
use minimarket;

drop view if exists informacion_color_producto;

create view informacion_color_producto as
select
	c.id_color_producto,
    c.nombre_color_producto,
    c.estado_color_producto
    from color_producto as c
    order by c.id_color_producto asc;