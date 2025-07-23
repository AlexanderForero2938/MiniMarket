-- Restricción unica tabla factura
alter table factura
add constraint factura_unica_annio unique(numero_factura, id_annio_factura);