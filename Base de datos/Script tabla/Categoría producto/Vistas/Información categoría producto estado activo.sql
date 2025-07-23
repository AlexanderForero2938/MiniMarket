-- Vista tabla categoria_producto
use minimarket;

drop view if exists informacion_categoria_producto_estado_activo;

create view informacion_categoria_producto_estado_activo as
select
	c.nombre_categoria_producto
    from categoria_producto as c
    where c.estado_categoria_producto = 'ACTIVO'
    order by c.nombre_categoria_producto asc;