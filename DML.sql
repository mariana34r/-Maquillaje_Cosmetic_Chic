INSERT INTO Productos (nombre, descripcion, precio, stock_disponible) 
VALUES 
('Labial Rojo', 'Labial de larga duración', 25000, 150),
('Crema Hidratante', 'Crema para piel seca con aloe vera', 35000, 100),
('Perfume Floral', 'Perfume con aroma a flores', 120000, 50),
('Pulsera de Plata', 'Pulsera de plata con diseño único', 60000, 80);

INSERT INTO Clientes (nombre_completo, correo_electronico, direccion, telefono) 
VALUES 
('Ana Pérez', 'ana.perez@example.com', 'Calle 123, Bogotá', '3001234567'),
('Carlos Martínez', 'carlos.martinez@example.com', 'Carrera 45, Medellín', '3109876543');

INSERT INTO Empleados (nombre_completo, puesto_trabajo, fecha_contratacion, area) 
VALUES 
('Lucía Rodríguez', 'Vendedor', '2022-05-10', 'venta'),
('Jorge Gómez', 'Administrador', '2020-08-15', 'administración');

INSERT INTO Ventas (fecha_venta, id_cliente, id_empleado) 
VALUES 
('2024-10-10', 1, 1),
('2024-10-11', 2, 1);

INSERT INTO DetalleVentas (id_venta, id_producto, cantidad) 
VALUES 
(1, 1, 2), 
(1, 3, 1), 
(2, 2, 1), 
(2, 4, 1); 

INSERT INTO Proveedores (nombre_empresa, nombre_contacto, telefono, direccion) 
VALUES 
('Cosméticos Bella', 'Sofía López', '3123456789', 'Calle 5, Bogotá'),
('Aromas S.A.', 'David Sánchez', '3159876543', 'Avenida 10, Medellín');

INSERT INTO OrdenesCompra (id_proveedor, fecha_orden) 
VALUES 
(1, '2024-09-30'), 
(2, '2024-10-05');

INSERT INTO DetalleOrdenesCompra (id_orden, id_producto, cantidad, fecha_recibido) 
VALUES 
(1, 1, 200, '2024-10-02'),
(1, 2, 150, '2024-10-03'), 
(2, 3, 60, '2024-10-07'); 

INSERT INTO Cosmeticos (id_producto, tipo, tono_color, fecha_expiracion) 
VALUES 
(1, 'Labial', 'Rojo Intenso', '2026-05-01');

INSERT INTO CuidadoPiel (id_producto, tipo_piel, componentes_principales, fecha_expiracion) 
VALUES 
(2, 'seca', 'Aloe Vera, Vitamina E', '2025-12-31');

INSERT INTO Perfumes (id_producto, tipo_aroma, tamaño) 
VALUES 
(3, 'Floral', '100ml');

INSERT INTO Accesorios (id_producto, material, tamaño) 
VALUES 
(4, 'Plata', '20cm');
