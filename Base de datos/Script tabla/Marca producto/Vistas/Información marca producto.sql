-- Vista tabla marca_producto.
use minimarket;

drop view if exists informacion_marca_producto;

create view informacion_marca_producto as
select 
	m.id_marca_producto,
    m.nombre_marca_producto,
    m.estado_marca_producto
    from marca_producto as m
    order by m.id_marca_producto asc;
