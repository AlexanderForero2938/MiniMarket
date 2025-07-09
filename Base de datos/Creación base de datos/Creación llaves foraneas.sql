-- Llave foranea tabla persona.
alter table persona
add constraint fk_id_tipo_identificacion foreign key(id_tipo_identificacion) references tipo_identificacion(id_tipo_identificacion);

-- Llave foranea tabla usuario.
alter table usuario
add constraint fk_id_rol_usuario foreign key(id_rol_usuario) references rol_usuario(id_rol_usuario);

-- Llave foranea tabla empleado.
alter table empleado
add constraint fk_id_persona_empleado foreign key(id_persona) references persona(id_persona);

alter table empleado
add constraint fk_id_usuario foreign key(id_usuario) references usuario(id_usuario);

-- Llave foranea tabla cliente.
alter table cliente
add constraint fk_id_persona_cliente foreign key(id_persona) references persona(id_persona);

-- Llave foranea tabla factura.
alter table factura
add constraint fk_id_cliente foreign key(id_cliente) references cliente(id_cliente);

alter table factura
add constraint fk_id_empleado foreign key(id_empleado) references empleado(id_empleado);

-- Llave foranea tabla detalle_factura.
alter table detalle_factura
add constraint fk_numero_factura foreign key(numero_factura) references factura(numero_factura);

alter table detalle_factura
add constraint fk_id_producto_detalle_factura foreign key(id_producto) references producto(id_producto);

-- Llave foranea producto.
alter table producto
add constraint fk_id_nombre_producto foreign key(id_nombre_producto) references nombre_producto(id_nombre_producto);

alter table producto
add constraint fk_id_marca_producto foreign key(id_marca_producto) references marca_producto(id_marca_producto);

alter table producto
add constraint fk_id_gramaje_producto foreign key(id_gramaje_producto) references gramaje_producto(id_gramaje_producto);

alter table producto
add constraint fk_id_IVA_producto foreign key(id_IVA_producto) references iva_producto(id_IVA_producto);

alter table producto
add constraint fk_id_color_producto foreign key(id_color_producto) references color_producto(id_color_producto);

alter table producto
add constraint fk_id_categoria_producto foreign key(id_categoria_producto) references categoria_producto(id_categoria_producto);

-- Llave foranea tabla detalle_inventario.
alter table detalle_inventario
add constraint fk_id_producto_detalle_inventario foreign key(id_producto) references producto(id_producto);

alter table detalle_inventario
add constraint fk_numero_inventario foreign key(numero_inventario) references inventario(numero_inventario);	

-- Llave foranea tabla seguimiento_producto.
alter table seguimiento_producto
add constraint fk_id_seguimiento foreign key(id_seguimiento) references seguimiento(id_seguimiento);

alter table seguimiento_producto
add constraint fk_id_seguimiento_producto foreign key(id_producto) references producto(id_producto);

-- Llave foranea tabla detalle_pedido.
alter table detalle_pedido
add constraint fk_numero_pedido foreign key(numero_pedido) references pedido(numero_pedido);

alter table detalle_pedido
add constraint fk_id_producto_detalle_pedido foreign key(id_producto) references producto(id_producto);

-- Llave foranea tabla pedido.
alter table pedido
add constraint fk_id_proveedor foreign key(id_proveedor) references proveedor(id_proveedor);