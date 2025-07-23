create database minimarket;

use minimarket;

create table persona(
id_persona int not null primary key auto_increment,
numero_identificacion_persona varchar(10) not null unique,
primer_nombre_persona varchar(25) not null,
segundo_nombre_persona varchar(25) null,
primer_apellido_persona varchar(25) not null,
segundo_apellido_persona varchar(25) null,
estado_persona varchar(10) not null,
id_tipo_identificacion int not null
);

create table tipo_identificacion(
id_tipo_identificacion int not null primary key auto_increment,
nombre_tipo_identificacion varchar(30) not null unique,
estado_tipo_identificacion varchar(10) not null
);

create table empleado(
id_empleado int not null primary key auto_increment,
estado_empleado varchar(10) not null,
id_persona int not null,
id_usuario int not null
);

create table usuario(
id_usuario int not null primary key auto_increment,
nombre_usuario varchar(10),
contraseina_usuario varchar(255) not null,
estado_usuario varchar(10) not null,
id_rol_usuario int not null
);

create table rol_usuario(
id_rol_usuario int not null primary key auto_increment,
nombre_rol_usuario varchar(25) not null unique,
estado_rol_usuario varchar(10) not null
);

create table cliente(
id_cliente int not null primary key auto_increment,
estado_cliente varchar(10) not null,
id_persona int not null
);

create table annio_factura(
id_annio_factura int not null primary key auto_increment,
annio_emision_factura year not null unique,
estado_annio_factura varchar(10) not null
);

create table factura(
id_factura int not null primary key,
numero_factura int not null,
codigo_factura varchar(20) not null unique,
fecha_emision_factura date null,
hora_emision_factura time null,
valor_total_factura decimal(10,2) not null,
estado_factura varchar(10) not null,
id_metodo_pago int not null,
id_cliente int not null,
id_empleado int not null,
id_annio_factura int not null
);

create table detalle_factura(
id_detalle_factura int not null primary key auto_increment,
precio_producto decimal(10,2) not null,
porcentaje_IVA int not null,
cantidad_producto int not null,
valor_total_detalle_factura decimal(10,2) not null,
valor_total_mas_IVA decimal(10,2) not null, 
valor_IVA_detalle_factura decimal(10,2) not null,
estado_detalle_factura varchar(10) not null,
numero_factura int not null,
id_producto int not null
);

create table marca_producto(
id_marca_producto int not null primary key auto_increment,
nombre_marca_producto varchar(25) not null unique,
estado_marca_producto varchar(10) not null
);

create table gramaje_producto(
id_gramaje_producto int not null primary key auto_increment,
nombre_gramaje_producto varchar(25) not null unique,
estado_gramaje_producto varchar(10) not null
);

create table iva_producto(
id_IVA_producto int not null primary key auto_increment,
valor_IVA_producto int not null unique,
estado_IVA_producto varchar(10) not null
);

create table color_producto(
id_color_producto int not null primary key auto_increment,
nombre_color_producto varchar(25) not null unique,
estado_color_producto varchar(10) not null
);

create table categoria_producto(
id_categoria_producto int not null primary key auto_increment,
nombre_categoria_producto varchar(25) not null unique,
estado_categoria_producto varchar(10) not null
);

create table nombre_producto(
id_nombre_producto int not null primary key auto_increment,
nombre_producto varchar(25) not null unique,
estado_nombre_producto varchar(10) not null
);

create table producto(
id_producto int not null primary key auto_increment,
codigo_producto varchar(30) not null unique,
precio_producto decimal(10,2) not null,
requiere_caducidad boolean not null,
estado_producto varchar(10) not null,
id_nombre_producto int not null,
id_marca_producto int not null,
id_gramaje_producto int null,
id_IVA_producto int null,
id_color_producto int null,
id_categoria_producto int not null
);

create table detalle_inventario(
id_detalle_inventario int not null primary key auto_increment,
cantidad_producto int not null,
fecha_vencimiento_producto date null,
precio_detalle_inventario decimal(10,2) not null,
precio_producto_actual decimal(10,2) not null,
numero_lote_producto varchar(25) null,
estado_detalle_inventario varchar(10) not null,
id_producto int not null,
numero_inventario int not null
);

create table inventario(
numero_inventario int not null primary key,
fecha_creacion_inventario date not null,
fecha_cierre_inventario date not null,
valor_inventario decimal(10,2) null,
estado_inventario varchar(10) not null
);

create table seguimiento_producto(
id_seguimiento_producto int not null primary key auto_increment,
codigo_segduimiento varchar(25) not null unique,
cantidad_producto int not null,
fecha_seguimiento date not null,
estado_seguimiento_producto varchar(10) not null,
id_seguimiento int,
id_producto int
);

create table seguimiento(
id_seguimiento int not null primary key auto_increment,
nombre_seguimiento varchar(25) not null unique,
estado_seguimiento varchar(10) not null
);

create table detalle_pedido(
id_detalle_pedido int not null primary key auto_increment,
precio_producto_proveedor decimal(10,2) not null,
precio_producto_venta decimal(10,2) not null,
valor_total_detalle decimal(10,2) not null,
valor_ganancia_unitaria_detalle decimal(10,2) not null,
valor_ganancia_total_detalle decimal(10,2) not null,
estado_detalle_pedido varchar(10) not null,
numero_pedido int not null,
id_producto int not null
);

create table pedido(
numero_pedido int not null primary key,
codigo_pedido varchar(20) not null unique,
fecha_realizo_pedido date not null,
fecha_llegada_pedido date not null,
valor_total_pedido decimal(10,2) not null,
ganancia_pedido decimal(10,2) not null,
estado_pedido varchar(10) not null,
id_proveedor int not null
);

create table proveedor(
id_proveedor int not null primary key auto_increment,
NIT_proveedor varchar(10) not null unique,
nombre_proveedor varchar(25) not null unique,
direccion_proveedor varchar(30) not null unique,
numero_contacto_proveedor varchar(10) not null unique,
estado_proveedor varchar(10) not null
);

create table metodo_pago(
id_metodo_pago int not null primary key auto_increment,
nombre_metodo_pago varchar(25) not null unique,
estado_metodo_pago varchar(10) not null
);