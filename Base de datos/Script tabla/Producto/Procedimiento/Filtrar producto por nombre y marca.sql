-- Precedimiento para poder filtrar un producto
use minimarket;

drop procedure if exists filtrar_producto_por_nombre_y_marca;

delimiter $$
create procedure filtrar_producto_por_nombre_y_marca(
	in p_nombre_producto varchar(25),
    in p_nombre_marca_producto varchar(25)
)
begin
	select
		p.codigo_producto,
		n.nombre_producto,
        m.nombre_marca_producto,
        c.nombre_categoria_producto,
        co.nombre_color_producto,
        g.nombre_gramaje_producto,
        i.valor_IVA_producto,
        d.cantidad_producto,
        d.fecha_vencimiento_producto,
        d.precio_producto_actual,
        d.numero_lote_producto,
        d.estado_detalle_inventario
        from nombre_producto as n
        inner join producto p on n.id_nombre_producto = p.id_nombre_producto
        inner join marca_producto m on m.id_marca_producto = p.id_marca_producto
        inner join categoria_producto c on c.id_categoria_producto = p.id_categoria_producto
        left join color_producto co on co.id_color_producto = p.id_color_producto
        left join gramaje_producto g on g.id_gramaje_producto = p.id_gramaje_producto
        left join iva_producto i on i.id_IVA_producto = p.id_IVA_producto
        inner join detalle_inventario d on p.id_producto = d.id_producto
        where (p_nombre_producto is null or n.nombre_producto = p_nombre_producto)
			and (p_nombre_marca_producto is null or m.nombre_marca_producto = p_nombre_marca_producto)
        order by p.codigo_producto asc;

end $$
delimiter ;