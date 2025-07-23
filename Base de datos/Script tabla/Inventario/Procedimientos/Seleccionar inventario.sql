-- Procedimiento para seleccionar un inventario.
use minimarket;

drop procedure if exists seleccionar_inventario;

delimiter $$
create procedure seleccionar_inventario(
	in p_numero_inventario int
)
begin
	select
		i.numero_inventario,
        i.fecha_creacion_inventario,
        i.fecha_cierre_inventario,
        i.valor_inventario,
        i.estado_inventario
        from inventario as i
        where i.numero_inventario = p_numero_inventario;
        
    select
		p.codigo_producto,
		concat(n.nombre_producto, ' ', m.nombre_marca_producto, ' ', g.nombre_gramaje_producto, ' ', c.nombre_color_producto) as descripcion_producto,
        iva.valor_IVA_producto,
        ca.nombre_categoria_producto,
        d.cantidad_producto,
        d.fecha_vencimiento_producto,
        d.precio_detalle_inventario,
        d.precio_producto_actual,
        d.numero_lote_producto,
        d.estado_detalle_inventario
        from nombre_producto as n
        inner join producto p on n.id_nombre_producto = p.id_nombre_producto
        inner join marca_producto m on m.id_marca_producto = p.id_marca_producto
		left join gramaje_producto g on g.id_gramaje_producto = p.id_gramaje_producto
        left join color_producto c on c.id_color_producto = p.id_color_producto
        left join iva_producto iva on iva.id_IVA_producto = p.id_IVA_producto
        inner join categoria_producto ca on ca.id_categoria_producto = p.id_categoria_producto
        inner join detalle_inventario d on p.id_producto = d.id_producto
        inner join inventario iv on iv.numero_inventario = d.numero_inventario
        where iv.numero_inventario = p_numero_inventario;

end $$
delimiter ;