# Base de datos maquillaje 💅

## Tabla de contenido 
| Indice | Título  |
|--|--|
| 1. | [Descripción_del_proyecto](#Descripción_del_proyecto) |
| 2. | [Estructura_de_la_Base_de_Datos](#Estructura_de_la_Base_de_Datos) |
| 3. | [Autores](#Autores) |

# Descripción del Proyecto 🚀

Esta es una base de datos para una tienda de maquillaje que vende productos como cosméticos, 
cuidado de la piel, perfumes, y accesorios. La base de datos debe permitir almacenar 
información sobre productos, clientes, ventas, empleados y proveedores.

# Imagen de la base de Base de datos maquillaje 💄:
![image](https://github.com/user-attachments/assets/0444d46d-c17a-4f3a-a708-337ceb918c40)

# Estructura de la Base de Datos 💅:
La base de datos consta de las siguientes tablas:

## 1.Productos:
![image](https://github.com/user-attachments/assets/01aa8fef-28d7-4006-b52f-1affdaacac06)

## columnas:

 Columna            | Tipo                                 | Descripción                                              |
|--------------------|--------------------------------------|----------------------------------------------------------|
| `id_producto`      | INT, AUTO_INCREMENT, PRIMARY KEY     | Identificador único del producto.                        |
| `nombre`           | VARCHAR(100), NOT NULL               | Nombre del producto.                                     |
| `descripcion`      | TEXT                                 | Descripción del producto.                                |
| `precio`           | DECIMAL(10, 2), NOT NULL             | Precio del producto.                                     |
| `stock_disponible` | INT, NOT NULL                        | Cantidad disponible en inventario.                       |


## 2.Accesorios:
![image](https://github.com/user-attachments/assets/807a58fe-9adb-4435-af8e-c09ccce853d2)

## columnas:

| Columna             | Tipo                                 | Descripción                                              |
|---------------------|--------------------------------------|----------------------------------------------------------|
| `id_accesorio`      | INT, AUTO_INCREMENT, PRIMARY KEY     | Identificador único del accesorio.                       |
| `id_producto`       | INT, NOT NULL                       | Identificador del producto correspondiente (FOREIGN KEY).|
| `material`          | VARCHAR(100)                        | Material del accesorio.                                 |
| `tamaño`            | VARCHAR(50)                         | Tamaño del accesorio.                                   |

## 3.Cuidado de piel:
![image](https://github.com/user-attachments/assets/19533114-6d9e-4439-8897-a32e83907e06)


## columnas:

 Columna             | Tipo                                 | Descripción                                              |
|---------------------|--------------------------------------|----------------------------------------------------------|
| `id_cuidado_piel`   | INT, AUTO_INCREMENT, PRIMARY KEY     | Identificador único del producto de cuidado de piel.    |
| `id_producto`       | INT, NOT NULL                       | Identificador del producto correspondiente (FOREIGN KEY).|
| `tipo_piel`         | ENUM('seca', 'grasa', 'mixta')     | Tipo de piel al que está dirigido.                       |
| `componentes_principales` | TEXT                          | Ingredientes principales del producto.                   |
| `fecha_expiracion`  | DATE                                 | Fecha de caducidad del producto.                        |

## 4.Detalles de ordenes de compra:
![image](https://github.com/user-attachments/assets/5954e8e2-2c08-4bb7-bace-cab020a85e04)

## columnas:


| Columna             | Tipo                                 | Descripción                                              |
|---------------------|--------------------------------------|----------------------------------------------------------|
| `id_detalle`        | INT, AUTO_INCREMENT, PRIMARY KEY     | Identificador único del detalle de la orden.            |
| `id_orden`          | INT, NOT NULL                        | Identificador de la orden correspondiente (FOREIGN KEY).|
| `id_producto`       | INT, NOT NULL                        | Identificador del producto solicitado (FOREIGN KEY).    |
| `cantidad`          | INT, NOT NULL                        | Cantidad de producto solicitada.                        |
| `fecha_recibido`    | DATE                                 | Fecha en que se recibió el producto.                    |


## 5.cosmeticos:
![image](https://github.com/user-attachments/assets/3ae20215-54ed-4736-a23e-f2baff6deb20)

## columnas:

| Columna             | Tipo                                 | Descripción                                              |
|---------------------|--------------------------------------|----------------------------------------------------------|
| `id_cosmetico`      | INT, AUTO_INCREMENT, PRIMARY KEY     | Identificador único del cosmético.                       |
| `id_producto`       | INT, NOT NULL                       | Identificador del producto correspondiente (FOREIGN KEY).|
| `tipo`              | VARCHAR(50)                         | Tipo de cosmético (labial, base, sombra, etc.).        |
| `tono_color`        | VARCHAR(50)                         | Tono o color del cosmético.                             |
| `fecha_expiracion`  | DATE                                 | Fecha de caducidad del cosmético.                       |

## 6.Perfumes:
![image](https://github.com/user-attachments/assets/d5499962-cf90-4d65-9565-c3a478f86ed0)

## columas:

| Columna             | Tipo                                 | Descripción                                              |
|---------------------|--------------------------------------|----------------------------------------------------------|
| `id_perfume`        | INT, AUTO_INCREMENT, PRIMARY KEY     | Identificador único del perfume.                         |
| `id_producto`       | INT, NOT NULL                       | Identificador del producto correspondiente (FOREIGN KEY).|
| `tipo_aroma`        | VARCHAR(100)                        | Descripción del tipo de aroma.                          |
| `tamaño`            | VARCHAR(50)                         | Tamaño del envase del perfume.                          |



## 7.Detalles de ventas:
![image](https://github.com/user-attachments/assets/39fc9675-7ac5-4fe9-9531-71e8a4b2af57)


## columnas:

| Columna         | Tipo                                 | Descripción                                              |
|------------------|--------------------------------------|----------------------------------------------------------|
| `id_detalle`    | INT, AUTO_INCREMENT, PRIMARY KEY     | Identificador único del detalle de la venta.            |
| `id_venta`      | INT, NOT NULL                       | Identificador de la venta correspondiente (FOREIGN KEY).|
| `id_producto`    | INT, NOT NULL                       | Identificador del producto vendido (FOREIGN KEY).       |
| `cantidad`      | INT, NOT NULL                       | Cantidad de producto vendido.                            |

## 8.Ordenes de compra:
![image](https://github.com/user-attachments/assets/028ccae7-3b38-4059-8d2a-f5c3dbf0330b)

## columnas:

| Columna         | Tipo                                 | Descripción                                              |
|------------------|--------------------------------------|----------------------------------------------------------|
| `id_orden`      | INT, AUTO_INCREMENT, PRIMARY KEY     | Identificador único de la orden de compra.              |
| `id_proveedor`   | INT, NOT NULL                       | Identificador del proveedor (FOREIGN KEY).              |
| `fecha_orden`    | DATE, NOT NULL                      | Fecha de realización de la orden.                       |

## 9.Provedores:
![image](https://github.com/user-attachments/assets/8da3f880-0a0e-4aa4-af9f-89bd88d5b609)


## columnas:

| Columna             | Tipo                                 | Descripción                                              |
|---------------------|--------------------------------------|----------------------------------------------------------|
| `id_proveedor`      | INT, AUTO_INCREMENT, PRIMARY KEY     | Identificador único del proveedor.                       |
| `nombre_empresa`    | VARCHAR(100), NOT NULL               | Nombre de la empresa proveedora.                         |
| `nombre_contacto`   | VARCHAR(100)                         | Nombre del contacto en la empresa.                       |
| `telefono`          | VARCHAR(20)                          | Número de teléfono del proveedor.                        |
| `direccion`         | TEXT                                 | Dirección del proveedor.                                 |



## 10.Empleados:
![image](https://github.com/user-attachments/assets/289829cb-de2f-4ef7-875e-55bed59a0e1c)

## columna:

| Columna             | Tipo                                 | Descripción                                              |
|---------------------|--------------------------------------|----------------------------------------------------------|
| `id_empleado`       | INT, AUTO_INCREMENT, PRIMARY KEY     | Identificador único del empleado.                        |
| `nombre_completo`   | VARCHAR(100), NOT NULL               | Nombre completo del empleado.                            |
| `puesto_trabajo`    | VARCHAR(50), NOT NULL                | Puesto de trabajo del empleado.                          |
| `fecha_contratacion` | DATE, NOT NULL                      | Fecha de contratación del empleado.                      |
| `area`              | ENUM('venta', 'bodega', 'administración'), NOT NULL | Área de trabajo del empleado.                            |

## 11. Ventas:
![image](https://github.com/user-attachments/assets/ebbefa34-601c-42ba-8a1a-f80d15cae9a1)

## columna:

| Columna         | Tipo                                 | Descripción                                              |
|------------------|--------------------------------------|----------------------------------------------------------|
| `id_venta`      | INT, AUTO_INCREMENT, PRIMARY KEY     | Identificador único de la venta.                         |
| `fecha_venta`   | DATE, NOT NULL                       | Fecha de la venta.                                      |
| `id_cliente`     | INT, NOT NULL                       | Identificador del cliente que realizó la compra (FOREIGN KEY). |
| `id_empleado`    | INT, NOT NULL                       | Identificador del empleado que atendió la venta (FOREIGN KEY). |




## 12.Clientes:
![image](https://github.com/user-attachments/assets/16adfb0c-1b30-43ce-afc6-d06b628d47dd)

## columnas:

| Columna             | Tipo                                 | Descripción                                              |
|---------------------|--------------------------------------|----------------------------------------------------------|
| `id_cliente`        | INT, AUTO_INCREMENT, PRIMARY KEY     | Identificador único del cliente.                         |
| `nombre_completo`   | VARCHAR(100), NOT NULL               | Nombre completo del cliente.                             |
| `correo_electronico`| VARCHAR(100), NOT NULL               | Correo electrónico del cliente.                          |
| `direccion`         | TEXT                                 | Dirección del cliente.                                   |
| `telefono`          | VARCHAR(20)                          | Número de teléfono del cliente.                          |



# Requerimientos 💋:
## 1.**Productos**:
    - Cada producto tendrá un identificador único, nombre, descripción, categoría (cosméticos, cuidado de la piel, perfumes, accesorios), precio y stock disponible.
    - Los productos de cosméticos incluirán campos adicionales como el tipo (labial, base, sombra, etc.), tono/color, y fecha de expiración.
    - Los productos de cuidado de la piel tendrán información sobre tipo de piel (seca, grasa, mixta), componentes principales y fecha de expiración.
    - Los perfumes y accesorios también tendrán características específicas (tipo de aroma, tamaño, material, etc.).
## 2.**Clientes**:
    - Cada cliente debe ser registrado con un identificador único, nombre completo, correo electrónico, dirección y número de teléfono.
## 3.**Ventas**:
    - Cada venta realizada debe ser registrada con un número único, la fecha de la venta, el cliente que realizó la compra, los productos adquiridos y la cantidad de cada uno.
    - Además, se debe registrar el empleado que atendió la venta.
## 4.**Empleados**:
    - Los empleados tendrán un identificador único, nombre completo, puesto de trabajo, fecha de contratación, y pueden estar asignados a diferentes áreas (venta, bodega, administración).
## 5.**Proveedores**:
    - Cada proveedor debe tener un identificador único, nombre de la empresa, nombre del contacto, teléfono y dirección.
    - Se debe llevar un registro de las órdenes de compra realizadas a los proveedores, con los productos solicitados, la fecha de la orden, y la cantidad de productos recibidos.

    
## Consultas 🎉:    


## 1.Listar todos los productos de cosméticos de un tipo específico (por ejemplo, "labial"):

SELECT P.nombre AS Nombre, P.descripcion, C.tipo, C.tono_color, C.fecha_expiracion

FROM Productos P

JOIN Cosmeticos C ON P.id_producto = C.id_producto

WHERE C.tipo = 'labial';


## 2.Obtener todos los productos en una categoría (cosméticos, cuidado de la piel, perfumes, accesorios) cuyo stock sea inferior a un valor dado --

SELECT P.nombre, P.descripcion, P.precio, P.stock_disponible

FROM Productos P

WHERE P.stock_disponible < 100;


## 3.Mostrar todas las ventas realizadas por un cliente específico en un rango de fechas --

SELECT V.id_venta, V.fecha_venta, C.nombre_completo, E.nombre_completo AS empleado

FROM Ventas V

JOIN Clientes C ON V.id_cliente = C.id_cliente

JOIN Empleados E ON V.id_empleado = E.id_empleado

WHERE C.nombre_completo = 'Ana Pérez'

AND V.fecha_venta BETWEEN '2024-01-01' AND '2024-12-31'; 


## 4.Calcular el total de ventas realizadas por un empleado en un mes dado --

SELECT E.nombre_completo, COUNT(V.id_venta) AS total_ventas

FROM Ventas V

JOIN Empleados E ON V.id_empleado = E.id_empleado

WHERE E.nombre_completo = 'Lucía Rodríguez'

AND MONTH(V.fecha_venta) = 10

AND YEAR(V.fecha_venta) = 2024

GROUP BY E.nombre_completo;

## 5.Listar los productos más vendidos en un período determinado --

SELECT P.nombre, SUM(DV.cantidad) AS total_vendido

FROM DetalleVentas DV

JOIN Productos P ON DV.id_producto = P.id_producto

JOIN Ventas V ON DV.id_venta = V.id_venta

WHERE V.fecha_venta BETWEEN '2024-01-01' AND '2024-12-31'

GROUP BY P.nombre

ORDER BY total_vendido DESC;


## 6.Consultar el stock disponible de un producto por su nombre o identificador --

SELECT nombre, stock_disponible

FROM Productos

WHERE nombre = 'Labial Rojo' 



## 7.Mostrar las órdenes de compra realizadas a un proveedor específico en el último año --

SELECT O.id_orden, O.fecha_orden, P.nombre_empresa

FROM OrdenesCompra O

JOIN Proveedores P ON O.id_proveedor = P.id_proveedor

WHERE P.nombre_empresa = 'Cosméticos Bella'

AND O.fecha_orden BETWEEN DATE_SUB(CURDATE(), INTERVAL 1 YEAR) AND CURDATE();


## 8.Listar los empleados que han trabajado más de un año en la tienda --

SELECT nombre_completo, puesto_trabajo, fecha_contratacion

FROM Empleados

WHERE fecha_contratacion < DATE_SUB(CURDATE(), INTERVAL 1 YEAR);


## 9.Obtener la cantidad total de productos vendidos en un día específico --

SELECT SUM(DV.cantidad) AS total_productos_vendidos

FROM DetalleVentas DV

JOIN Ventas V ON DV.id_venta = V.id_venta

WHERE V.fecha_venta = '2024-10-11';


## 10.Consultar las ventas de un producto específico (por nombre o ID) y cuántas unidades se vendieron --

SELECT P.nombre, SUM(DV.cantidad) AS total_vendido

FROM DetalleVentas DV

JOIN Productos P ON DV.id_producto = P.id_producto

WHERE P.nombre = 'Perfume Floral'

GROUP BY P.nombre;


## Autores👤:

-[Mariana Rueda](https://github.com/mariana34r)
-[Ronaldo Oviedo](https://github.com/RonaldoOviedo19)






















