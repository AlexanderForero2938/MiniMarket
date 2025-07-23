-- Funcion para registrar en la tabla detalle_inventario
use minimarket;

drop function if exists registrar_producto;

delimiter $$
create function registrar_producto(
	p_codigo_producto varchar(30),
    p_cantidad_producto int,
    p_fecha_vencimiento_producto varchar(10),
    p_numero_lote_producto varchar(25)
)
returns varchar(100)
deterministic
begin 
	declare p_id_producto int;
    declare caduca boolean;
    declare p_precio_producto decimal(10,2);
    declare p_numero_inventario int;
    declare fecha_vencimiento date;
    declare p_id_detalle_inventario int;
    declare p_cantidad_producto_actual int;
    
    -- Obtener el inventario abierto.
    select numero_inventario
    into p_numero_inventario
    from inventario
    where estado_inventario = 'ABIERTO'
    order by numero_inventario desc
    limit 1;
    
    if p_numero_inventario is null then
		return 'No se encuentra ningun inventario abierto.';
	end if;
    
    -- Obtener información del producto.
    select 
		id_producto,
        precio_producto,
        requiere_caducidad
    into 
		p_id_producto,
        p_precio_producto,
        caduca
    from producto
    where codigo_producto = p_codigo_producto;
    
    -- Si el producto requere caducidad.
	if caduca then
		if p_fecha_vencimiento_producto is null or p_numero_lote_producto is null then
			return 'La fecha de vencimiento y el número de lote son obligatorios';
		end if;
		set fecha_vencimiento = str_to_date(p_fecha_vencimiento_producto, '%d-%m-%Y');

		-- Se registra un nuevo producto con caducidad.
       	insert into detalle_inventario(
			cantidad_producto,
			fecha_vencimiento_producto,
			precio_detalle_inventario,
            precio_producto_actual,
			numero_lote_producto,
			estado_detalle_inventario,
			id_producto,
			numero_inventario
		)
		values(
			p_cantidad_producto,
			fecha_vencimiento,
			0.00,
            p_precio_producto,
			p_numero_lote_producto,
			'DISPONIBLE',
			p_id_producto,
			p_numero_inventario
		);
	
		return concat('Se registro el producto exitosamente en el inventario Número ', p_numero_inventario);
	else
		-- Verificar si ya hay un producto sin caducidad registrado en el sistema y con el mismo precio.
        select
			id_detalle_inventario,
            cantidad_producto
		into
			p_id_detalle_inventario,
            p_cantidad_producto_actual
		from detalle_inventario
        where id_producto = p_id_producto
            and numero_inventario = p_numero_inventario
			and precio_producto_actual = p_precio_producto
            and fecha_vencimiento is null
		limit 1;
            
		-- Si ya existe el producto se actualiza la cantidad de este.
		if p_id_detalle_inventario is not null then
			update detalle_inventario
				set cantidad_producto = p_cantidad_producto_actual + cantidad_producto
			where id_detalle_inventario = p_id_detalle_inventario;
			
		return concat('Se actualizo la cantidad del producto en el inventario', p_numero_inventario);
        
        end if;
        
        -- Si no existe el producto se registra uno nuevo sin caducidad.
        	insert into detalle_inventario(
			cantidad_producto,
			fecha_vencimiento_producto,
			precio_detalle_inventario,
            precio_producto_actual,
			numero_lote_producto,
			estado_detalle_inventario,
			id_producto,
			numero_inventario
		)
		values(
			p_cantidad_producto,
			fecha_vencimiento,
			0.00,
            p_precio_producto,
			p_numero_lote_producto,
			'DISPONIBLE',
			p_id_producto,
			p_numero_inventario
		);
		
		return concat('Se registro el producto exitosamente en el inventario Número ', p_numero_inventario);

    end if;
   
end $$
delimiter ;