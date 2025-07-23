-- Procedimiento para modificar en la tabla persona y cliente.
use minimarket;

drop procedure if exists modificar_estado_cliente;

delimiter $$ 
create procedure modificar_estado_cliente(
	in p_numero_identificacion_persona varchar(10),
	in p_nuevo_estado varchar(10),
	out mensaje varchar(100)
)
begin
	declare p_id_persona int;
    
    select id_persona
    into p_id_persona
    from persona
    where numero_identificacion_persona = p_numero_identificacion_persona;
    
    update persona
		set estado_persona = upper(p_nuevo_estado)
	where id_persona = p_id_persona;
    
    update cliente
		set estado_cliente = upper(p_nuevo_estado)
	where id_persona = p_id_persona;
    
    if upper(p_nuevo_estado) = 'ACTIVO' then
		set mensaje = concat('Se activo el cliente con el número de identificación ', p_numero_identificacion_persona);
	else
		set mensaje = concat('Se inactivo el cliente con el nímero de identificación ', p_numero_identificacion_persona);
	end if;
    
end $$
delimiter ;