-- Vista información producto.
use minimarket;

drop view if exists informacion_producto;

create view informacion_producto as
	select
		p.codigo_producto,
		n.nombre_producto,
        m.nombre_marca_producto,
        c.nombre_categoria_producto,
        co.nombre_color_producto,
        g.nombre_gramaje_producto,
        i.valor_IVA_producto
        from nombre_producto as n
        inner join producto p on n.id_nombre_producto = p.id_nombre_producto
        inner join marca_producto m on m.id_marca_producto = p.id_marca_producto
        inner join categoria_producto c on c.id_categoria_producto = p.id_categoria_producto
        left join color_producto co on co.id_color_producto = p.id_color_producto
        left join gramaje_producto g on g.id_gramaje_producto = p.id_gramaje_producto
        left join iva_producto i on i.id_IVA_producto = p.id_IVA_producto
        order by p.codigo_producto asc;