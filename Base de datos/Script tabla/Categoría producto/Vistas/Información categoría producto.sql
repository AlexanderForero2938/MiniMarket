-- Vista tabla categoria_producto.
use minimarket;

drop view if exists informacion_categoria_producto;

create view informacion_categoria_producto as
select
	c.id_categoria_producto,
    c.nombre_categoria_producto,
    c.estado_categoria_producto
    from categoria_producto as c
    order by c.id_categoria_producto asc;