-- Agragación de index tabla producto
alter table producto add index idx_id_nombre_producto (id_nombre_producto);
alter table producto add index idx_id_marca_producto (id_marca_producto);
alter table producto add index idx_id_gramaje_producto (id_gramaje_producto);
alter table producto add index idx_id_IVA_producto (id_IVA_producto);
alter table producto add index idx_id_color_producto (id_color_producto);
alter table producto add index idx_id_categoria_producto (id_categoria_producto);

-- Agregación de index tabla detalle_inventario
alter table detalle_inventario add index idx_id_producto (id_producto);
alter table detalle_inventario add index idx_numero_inventario (numero_inventario);

-- Agregación de index tabla persona
alter table persona add index idx_id_numero_identificacion_persona (numero_identificacion_persona);

-- Agregación de index tabla empleado
alter table empleado add index idx_id_usuario (id_usuario);
alter table empleado add index idx_id_persona_empleado (id_persona);

-- Agregación de index tabla cliente
alter table cliente add index idx_id_persona_cliente (id_persona);

-- Agregación de index tabla factura
alter table factura add index idx_id_cliente_factura (id_cliente);
alter table factura add index idx_id_empleado_factura (id_empleado);
alter table factura add index idx_id_metodo_pago (id_metodo_pago);
alter table factura add index idx_id_annio_factura (id_annio_factura);