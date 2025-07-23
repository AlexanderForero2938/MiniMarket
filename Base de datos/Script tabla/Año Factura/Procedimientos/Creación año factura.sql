-- Procedimiento para insertar en la tabla annio_factura.
use minimarket;

drop procedure if exists creacion_annio_factura;

delimiter $$
create procedure creacion_annio_factura()
begin
	declare ultimo_registro int;
    
    select max(id_annio_factura)
    into ultimo_registro
	from annio_factura;

	if ultimo_registro is not null then
	update annio_factura
		set estado_emision_factura = 'CERRADO'
	where id_annio_factura = ultimo_registro;
    end if;
    
    insert into annio_factura(
		annio_emision_factura,
        estado_annio_factura
    )
    values(
		year(current_date),
        'ABIERTO'
    );
    
end $$
delimiter ;
