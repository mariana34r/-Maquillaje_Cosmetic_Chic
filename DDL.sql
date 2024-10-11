USE PerfumesMariana;

CREATE TABLE Productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10, 2) NOT NULL,
    stock_disponible INT NOT NULL
);

CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre_completo VARCHAR(100) NOT NULL,
    correo_electronico VARCHAR(100) NOT NULL,
    direccion TEXT,
    telefono VARCHAR(20)
);

CREATE TABLE Empleados (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre_completo VARCHAR(100) NOT NULL,
    puesto_trabajo VARCHAR(50) NOT NULL,
    fecha_contratacion DATE NOT NULL,
    area ENUM('venta', 'bodega', 'administración') NOT NULL
);

CREATE TABLE Ventas (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    fecha_venta DATE NOT NULL,
    id_cliente INT NOT NULL,
    id_empleado INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_empleado) REFERENCES Empleados(id_empleado)
);

CREATE TABLE DetalleVentas (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_venta INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    FOREIGN KEY (id_venta) REFERENCES Ventas(id_venta),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);


CREATE TABLE Proveedores (
    id_proveedor INT AUTO_INCREMENT PRIMARY KEY,
    nombre_empresa VARCHAR(100) NOT NULL,
    nombre_contacto VARCHAR(100),
    telefono VARCHAR(20),
    direccion TEXT
);

CREATE TABLE OrdenesCompra (
    id_orden INT AUTO_INCREMENT PRIMARY KEY,
    id_proveedor INT NOT NULL,
    fecha_orden DATE NOT NULL,
    FOREIGN KEY (id_proveedor) REFERENCES Proveedores(id_proveedor)
);

CREATE TABLE DetalleOrdenesCompra (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_orden INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    fecha_recibido DATE,
    FOREIGN KEY (id_orden) REFERENCES OrdenesCompra(id_orden),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);

CREATE TABLE Cosmeticos (
    id_cosmetico INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT NOT NULL,
    tipo VARCHAR(50), -- labial, base, sombra, etc.
    tono_color VARCHAR(50),
    fecha_expiracion DATE,
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);

CREATE TABLE CuidadoPiel (
    id_cuidado_piel INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT NOT NULL,
    tipo_piel ENUM('seca', 'grasa', 'mixta'),
    componentes_principales TEXT,
    fecha_expiracion DATE,
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);

CREATE TABLE Perfumes (
    id_perfume INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT NOT NULL,
    tipo_aroma VARCHAR(100),
    tamaño VARCHAR(50),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);

CREATE TABLE Accesorios (
    id_accesorio INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT NOT NULL,
    material VARCHAR(100),
    tamaño VARCHAR(50),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);