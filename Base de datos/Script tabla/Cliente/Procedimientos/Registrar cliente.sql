-- Procedimiento para registrar en las tablas persona y cliente.
use minimarket;

drop procedure if exists registrar_cliente;

delimiter $$
create procedure registrar_cliente(
	p_numero_identificacion_persona varchar(10),
    p_primer_nombre_persona varchar(25),
    p_segundo_nombre_persona varchar(25),
    p_primer_apellido_persona varchar(25),
    p_segundo_apellido_persona varchar(25),
	out mensaje varchar(100)
)
begin
    declare nuevo_id_persona int;
	
    main: begin
    if exists(
		select 1 from persona where numero_identificacion_persona = p_numero_identificacion_persona
    ) then
		set mensaje = 'Ese número de identificación ya se encuentra registrado en el sistema.';
        leave main;
	end if;

    insert into persona(
		numero_identificacion_persona,
        primer_nombre_persona,
        segundo_nombre_persona,
        primer_apellido_persona,
        segundo_apellido_persona,
        estado_persona,
        id_tipo_identificacion
    )
    values(
		p_numero_identificacion_persona,
		upper(p_primer_nombre_persona),
		upper(p_segundo_nombre_persona),
		upper(p_primer_apellido_persona),
		upper(p_segundo_apellido_persona),
        'ACTIVO',
        1
    );

	set nuevo_id_persona = last_insert_id();
    
    insert into cliente(
		estado_cliente,
        id_persona
    )
    values(
		'ACTIVO',
        nuevo_id_persona
    );
    
    set mensaje = 'Se registro el cliente en el sistema exitosamente.';
    end;

end $$
delimiter ;