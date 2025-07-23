-- Procedimiento para buscar en la tabla persona y cliente
use minimarket;

drop procedure if exists buscar_cliente_por_numero_identificacion;

delimiter $$
create procedure buscar_cliente_por_numero_identificacion(
	in p_numero_identificacion_persona varchar(10),
    out mensaje varchar(100)
)
begin
	
    if exists(
		select 1 
        from persona as p
        inner join cliente c on p.id_persona = c.id_persona
        where numero_identificacion_persona = p_numero_identificacion_persona
			and c.estado_cliente = 'ACTIVO'
    )then
		select
			p.numero_identificacion_persona,
			p.primer_nombre_persona,
			p.segundo_nombre_persona,
			p.primer_apellido_persona,
			p.segundo_apellido_persona,
			t.nombre_tipo_identificacion
			from tipo_identificacion as t
			inner join persona p on t.id_tipo_identificacion = p.id_tipo_identificacion
            inner join cliente c on p.id_persona = c.id_persona
			where p.numero_identificacion_persona = p_numero_identificacion_persona
				and c.estado_cliente = 'ACTIVO';
	
		set mensaje = '';
	else
		set mensaje = concat('No se encontro ningun cliente registrado con el número de identificación ', p_numero_identificacion_persona);
	end if;

end $$
delimiter ;