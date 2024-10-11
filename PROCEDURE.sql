--Listar todos los productos de cosméticos de un tipo específico (por ejemplo, "labial")--

DELIMITER //
CREATE PROCEDURE ListarProductosCosmeticosPorTipo(IN tipo_especifico VARCHAR(50))
BEGIN
    SELECT P.nombre, P.descripcion, C.tipo, C.tono_color, C.fecha_expiracion
    FROM Productos P
    JOIN Cosmeticos C ON P.id_producto = C.id_producto
    WHERE C.tipo = tipo_especifico;
END //
DELIMITER ;
CALL ListarProductosCosmeticosPorTipo('labial');

-- Obtener todos los productos en una categoría (cosméticos, cuidado de la piel, perfumes, accesorios) cuyo stock sea inferior a un valor dado --

DELIMITER //

CREATE PROCEDURE ProductosConStockInferior(IN stock_limite INT)
BEGIN
    SELECT P.nombre, P.descripcion, P.precio, P.stock_disponible
    FROM Productos P
    WHERE P.stock_disponible < stock_limite;
END //

DELIMITER ;
CALL ProductosConStockInferior(100); 

-- Mostrar todas las ventas realizadas por un cliente específico en un rango de fechas --

DELIMITER //

CREATE PROCEDURE VentasPorClienteYRangoDeFechas(
    IN nombre_cliente VARCHAR(100), 
    IN fecha_inicio DATE, 
    IN fecha_fin DATE)
BEGIN
    SELECT V.id_venta, V.fecha_venta, C.nombre_completo, E.nombre_completo AS empleado
    FROM Ventas V
    JOIN Clientes C ON V.id_cliente = C.id_cliente
    JOIN Empleados E ON V.id_empleado = E.id_empleado
    WHERE C.nombre_completo = nombre_cliente
    AND V.fecha_venta BETWEEN fecha_inicio AND fecha_fin;
END //

DELIMITER ;
CALL VentasPorClienteYRangoDeFechas('Ana Pérez', '2024-01-01', '2024-12-31');

-- Calcular el total de ventas realizadas por un empleado en un mes dado --

DELIMITER //

CREATE PROCEDURE TotalVentasPorEmpleadoYMes(
    IN nombre_empleado VARCHAR(100), 
    IN mes INT, 
    IN anio INT)
BEGIN
    SELECT E.nombre_completo, COUNT(V.id_venta) AS total_ventas
    FROM Ventas V
    JOIN Empleados E ON V.id_empleado = E.id_empleado
    WHERE E.nombre_completo = nombre_empleado
    AND MONTH(V.fecha_venta) = mes
    AND YEAR(V.fecha_venta) = anio
    GROUP BY E.nombre_completo;
END //

DELIMITER ;
CALL TotalVentasPorEmpleadoYMes('Lucía Rodríguez', 10, 2024);

-- Listar los productos más vendidos en un período determinado --

DELIMITER //

CREATE PROCEDURE ProductosMasVendidos(
    IN fecha_inicio DATE, 
    IN fecha_fin DATE)
BEGIN
    SELECT P.nombre, SUM(DV.cantidad) AS total_vendido
    FROM DetalleVentas DV
    JOIN Productos P ON DV.id_producto = P.id_producto
    JOIN Ventas V ON DV.id_venta = V.id_venta
    WHERE V.fecha_venta BETWEEN fecha_inicio AND fecha_fin
    GROUP BY P.nombre
    ORDER BY total_vendido DESC;
END //

DELIMITER ;
CALL ProductosMasVendidos('2024-01-01', '2024-12-31');

-- Consultar el stock disponible de un producto por su nombre o identificador --

DELIMITER //

CREATE PROCEDURE ConsultarStockProducto(IN nombre_producto VARCHAR(100))
BEGIN
    SELECT nombre, stock_disponible
    FROM Productos
    WHERE nombre = nombre_producto;
END //

DELIMITER ;
CALL ConsultarStockProducto('Labial Rojo');

-- Mostrar las órdenes de compra realizadas a un proveedor específico en el último año --

DELIMITER //

CREATE PROCEDURE OrdenesCompraProveedor(IN nombre_proveedor VARCHAR(100))
BEGIN
    SELECT O.id_orden, O.fecha_orden, P.nombre_empresa
    FROM OrdenesCompra O
    JOIN Proveedores P ON O.id_proveedor = P.id_proveedor
    WHERE P.nombre_empresa = nombre_proveedor
    AND O.fecha_orden BETWEEN DATE_SUB(CURDATE(), INTERVAL 1 YEAR) AND CURDATE();
END //

DELIMITER ;
CALL OrdenesCompraProveedor('Cosméticos Bella');

-- Listar los empleados que han trabajado más de un año en la tienda --

DELIMITER //

CREATE PROCEDURE EmpleadosConMasDeUnAnio()
BEGIN
    SELECT nombre_completo, puesto_trabajo, fecha_contratacion
    FROM Empleados
    WHERE fecha_contratacion < DATE_SUB(CURDATE(), INTERVAL 1 YEAR);
END //

DELIMITER ;
CALL EmpleadosConMasDeUnAnio();

-- Obtener la cantidad total de productos vendidos en un día específico --

DELIMITER //

CREATE PROCEDURE TotalProductosVendidosPorDia(IN fecha_venta_especifica DATE)
BEGIN
    SELECT SUM(DV.cantidad) AS total_productos_vendidos
    FROM DetalleVentas DV
    JOIN Ventas V ON DV.id_venta = V.id_venta
    WHERE V.fecha_venta = fecha_venta_especifica;
END //

DELIMITER ;
CALL TotalProductosVendidosPorDia('2024-10-11');

-- Consultar las ventas de un producto específico (por nombre o ID) y cuántas unidades se vendieron --

DELIMITER //

CREATE PROCEDURE VentasProductoEspecifico(IN nombre_producto VARCHAR(100))
BEGIN
    SELECT P.nombre, SUM(DV.cantidad) AS total_vendido
    FROM DetalleVentas DV
    JOIN Productos P ON DV.id_producto = P.id_producto
    WHERE P.nombre = nombre_producto
    GROUP BY P.nombre;
END //

DELIMITER ;
CALL VentasProductoEspecifico('Perfume Floral');




