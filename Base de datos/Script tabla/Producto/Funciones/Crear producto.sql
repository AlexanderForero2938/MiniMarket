-- Función para registrar en la tabla producto.
use minimarket;

drop function if exists crear_producto;

delimiter $$
create function crear_producto(
    p_precio_producto decimal(10,2),
    p_requiere_caducidad boolean,
	p_nombre_producto varchar(25),
    p_nombre_marca_producto varchar(25),
    p_nombre_gramaje_producto varchar(25),
    p_valor_IVA_producto int,
    p_nombre_color_producto varchar(25),
    p_nombre_categoria_producto varchar(25)
)
returns varchar(100)
deterministic
begin 
	declare p_codigo_producto varchar(30);
	declare existe_producto int;
    declare p_id_nombre_producto int;
    declare p_id_marca_producto int;
    declare p_id_gramaje_producto int;
    declare p_id_IVA_producto int;
    declare p_id_color_producto int;
    declare p_id_categoria_producto int;
    
    -- Obtener el id de la tabla nombre_producto.
    select id_nombre_producto
    into p_id_nombre_producto
    from nombre_producto
    where nombre_producto = upper(p_nombre_producto);
	
    -- Obtener el id de la tabla marca_producto.
    select id_marca_producto
    into p_id_marca_producto
    from marca_producto
    where nombre_marca_producto = upper(p_nombre_marca_producto);

    -- Obtener el id de la tabla gramaje_producto.
	select  id_gramaje_producto
    into p_id_gramaje_producto
    from gramaje_producto
    where nombre_gramaje_producto = upper(p_nombre_gramaje_producto);
    
    -- Obtener el id de la tabla IVA_producto.
    select id_IVA_producto
    into p_id_IVA_producto
    from IVA_producto
    where valor_IVA_producto = p_valor_IVA_producto;
    
    -- Obtener el id de la tabla color_producto.
    select id_color_producto
    into p_id_color_producto
    from color_producto
    where nombre_color_producto = upper(p_nombre_color_producto);
    
    -- Obtener el id de la tabla categoria_producto.
    select id_categoria_producto
    into p_id_categoria_producto
    from categoria_producto
    where nombre_categoria_producto = upper(p_nombre_categoria_producto);
    
    select count(*)
    into existe_producto
    from producto
    where id_nombre_producto = p_id_nombre_producto
		and id_marca_producto = p_id_marca_producto
        or id_gramaje_producto = p_id_gramaje_producto
        or id_IVA_producto = p_id_IVA_producto
        or id_color_producto = p_id_color_producto
        and id_categoria_producto = p_id_categoria_producto;
	
    if existe_producto > 0 then
    return 'Ese producto ya se encuentra registrado en el sistema.';
	end if;
    
    -- Código personalizado del producto
    set p_codigo_producto = concat('PROD-N', p_id_nombre_producto, '-M', p_id_marca_producto, '-C', p_id_categoria_producto);
    
    insert into producto(
		codigo_producto,
        precio_producto,
        requiere_caducidad,
        estado_producto,
        id_nombre_producto,
        id_marca_producto,
        id_gramaje_producto,
        id_IVA_producto,
        id_color_producto,
        id_categoria_producto
    )
    values(
		p_codigo_producto,
        p_precio_producto,
        p_requiere_caducidad,
        'ACTIVO',
        p_id_nombre_producto,
        p_id_marca_producto,
        p_id_gramaje_producto,
        p_id_IVA_producto,
        p_id_color_producto,
        p_id_categoria_producto
    );
    
    return 'Se creo el producto exitosamente en el sistema.';
    
end $$
delimiter ;
    