CREATE DATABASE retail_project;




-- Tabla CLIENTES
CREATE TABLE clientes (
    id_cliente SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    edad INT CHECK (edad >= 18)
);

-- Tabla PRODUCTOS
CREATE TABLE productos (
    id_producto SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    precio DECIMAL(10,2) NOT NULL CHECK (precio > 0),
    stock INT NOT NULL CHECK (stock >= 0)
);

-- Tabla VENTAS
CREATE TABLE ventas (
    id_venta SERIAL PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL CHECK (cantidad > 0),
    fecha_venta DATE NOT NULL DEFAULT CURRENT_DATE,

    CONSTRAINT fk_venta_cliente
        FOREIGN KEY (id_cliente)
        REFERENCES clientes(id_cliente),

    CONSTRAINT fk_venta_producto
        FOREIGN KEY (id_producto)
        REFERENCES productos(id_producto)
);


-- CARGA INICIAL DE DATOS


BEGIN;


-- CLIENTES -- --------------------------------------------


INSERT INTO clientes (nombre, email, edad)
VALUES
    ('Juan Perez', 'juan.perez@email.com', 30),
    ('Maria Gonzalez', 'maria.gonzalez@email.com', 25),
    ('Carlos Rodriguez', 'carlos.rodriguez@email.com', 42),
    ('Laura Fernandez', 'laura.fernandez@email.com', 35),
    ('Sofia Martinez', 'sofia.martinez@email.com', 28);


-- PRODUCTOS ---------------


INSERT INTO productos (nombre, categoria, precio, stock)
VALUES
    ('Notebook Lenovo', 'Tecnologia', 850000.00, 10),
    ('Mouse Logitech', 'Tecnologia', 25000.00, 50),
    ('Teclado Redragon', 'Tecnologia', 55000.00, 30),
    ('Monitor Samsung 24', 'Tecnologia', 280000.00, 15),
    ('Silla de escritorio', 'Muebles', 180000.00, 20);


-- VENTAS


INSERT INTO ventas (id_cliente, id_producto, cantidad, fecha_venta)
VALUES
    (1, 1, 1, '2026-08-01'),
    (2, 2, 2, '2026-08-02'),
    (3, 3, 1, '2026-08-03'),
    (4, 4, 1, '2026-08-04'),
    (5, 5, 2, '2026-08-05');

COMMIT;


-- ACTUALIZACION DE PRECIOS


UPDATE productos
SET precio = precio * 1.10
WHERE categoria = 'Tecnologia';


-- DELETE DE REGISTRO DE PRUEBA


DELETE FROM ventas
WHERE id_venta = 5;


-- CONSULTAS DE VERIFICACION


SELECT * FROM clientes;

SELECT * FROM productos;

SELECT * FROM ventas;





