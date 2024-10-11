--Listar todos los productos de cosméticos de un tipo específico (por ejemplo, "labial")--

SELECT P.nombre AS Nombre, P.descripcion, C.tipo, C.tono_color, C.fecha_expiracion
FROM Productos P
JOIN Cosmeticos C ON P.id_producto = C.id_producto
WHERE C.tipo = 'labial';

-- Obtener todos los productos en una categoría (cosméticos, cuidado de la piel, perfumes, accesorios) cuyo stock sea inferior a un valor dado --

SELECT P.nombre, P.descripcion, P.precio, P.stock_disponible
FROM Productos P
WHERE P.stock_disponible < 100;

-- Mostrar todas las ventas realizadas por un cliente específico en un rango de fechas --

SELECT V.id_venta, V.fecha_venta, C.nombre_completo, E.nombre_completo AS empleado
FROM Ventas V
JOIN Clientes C ON V.id_cliente = C.id_cliente
JOIN Empleados E ON V.id_empleado = E.id_empleado
WHERE C.nombre_completo = 'Ana Pérez' 
AND V.fecha_venta BETWEEN '2024-01-01' AND '2024-12-31'; 

-- Calcular el total de ventas realizadas por un empleado en un mes dado --

SELECT E.nombre_completo, COUNT(V.id_venta) AS total_ventas
FROM Ventas V
JOIN Empleados E ON V.id_empleado = E.id_empleado
WHERE E.nombre_completo = 'Lucía Rodríguez'
AND MONTH(V.fecha_venta) = 10 
AND YEAR(V.fecha_venta) = 2024 
GROUP BY E.nombre_completo;

-- Listar los productos más vendidos en un período determinado --

SELECT P.nombre, SUM(DV.cantidad) AS total_vendido
FROM DetalleVentas DV
JOIN Productos P ON DV.id_producto = P.id_producto
JOIN Ventas V ON DV.id_venta = V.id_venta
WHERE V.fecha_venta BETWEEN '2024-01-01' AND '2024-12-31'
GROUP BY P.nombre
ORDER BY total_vendido DESC;

-- Consultar el stock disponible de un producto por su nombre o identificador --

SELECT nombre, stock_disponible
FROM Productos
WHERE nombre = 'Labial Rojo' 

-- Mostrar las órdenes de compra realizadas a un proveedor específico en el último año --

SELECT O.id_orden, O.fecha_orden, P.nombre_empresa
FROM OrdenesCompra O
JOIN Proveedores P ON O.id_proveedor = P.id_proveedor
WHERE P.nombre_empresa = 'Cosméticos Bella'
AND O.fecha_orden BETWEEN DATE_SUB(CURDATE(), INTERVAL 1 YEAR) AND CURDATE();

-- Listar los empleados que han trabajado más de un año en la tienda --

SELECT nombre_completo, puesto_trabajo, fecha_contratacion
FROM Empleados
WHERE fecha_contratacion < DATE_SUB(CURDATE(), INTERVAL 1 YEAR);

-- Obtener la cantidad total de productos vendidos en un día específico --

SELECT SUM(DV.cantidad) AS total_productos_vendidos
FROM DetalleVentas DV
JOIN Ventas V ON DV.id_venta = V.id_venta
WHERE V.fecha_venta = '2024-10-11';

-- Consultar las ventas de un producto específico (por nombre o ID) y cuántas unidades se vendieron --

SELECT P.nombre, SUM(DV.cantidad) AS total_vendido
FROM DetalleVentas DV
JOIN Productos P ON DV.id_producto = P.id_producto
WHERE P.nombre = 'Perfume Floral'
GROUP BY P.nombre;





