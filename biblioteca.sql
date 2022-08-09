--resetear
DROP DATABASE biblioteca;

--crear base de datos
CREATE DATABASE biblioteca;

--acceder
\c biblioteca

--crear modelo conceptual: está en los documentos adjuntos

--crear modelo lógico:está en documentos adjuntos. Incluye normalización y creación de tablas intermedias (de ser necesario)

--crear modelo físico, está en documentos adjuntos.

--crear el modelo considerando las tablas definidas y sus atributos
CREATE TABLE autor(
    codigo_autor VARCHAR(100) NOT NULL,
    nombre_autor VARCHAR(100) NOT NULL,
    apellido_autor VARCHAR(100) NOT NULL,
    fecha_nacimiento_autor INT,
    fecha_muerte_autor INT,
    PRIMARY KEY (codigo_autor)
);
--visualizar
--SELECT * FROM autor
--eliminar si es necesario
--DROP TABLE autor

CREATE TABLE socio(
    rut VARCHAR(100) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    telefono INT,
    PRIMARY KEY (rut)
);
--visualizar
--SELECT * FROM socio
--eliminar si es necesario
--DROP TABLE socio

CREATE TABLE libro(
    ISBN VARCHAR(100) NOT NULL,
    titulo VARCHAR(100),
    numero_paginas INT,
    PRIMARY KEY (ISBN)
);
--visualizar
--SELECT * FROM libro
--eliminar si es necesario
--DROP TABLE libro

CREATE TABLE libro_autor(
    id_libro_autor Serial PRIMARY KEY,
    id_libro VARCHAR(100),
    id_autor VARCHAR(100),
    tipo_autor VARCHAR(20),
    FOREIGN KEY (id_libro) REFERENCES libro(ISBN),
    FOREIGN KEY (id_autor) REFERENCES autor(codigo_autor)
);

--esta tabla se creó para ser usada en caso de que exista autor y coautor, para evitar duplicidad en la tabla libros.
--visualizar
--SELECT * FROM libro_autor
--eliminar si es necesario
--DROP TABLE libro_autor


CREATE TABLE prestamo(
    fecha_inicio DATE,
    fecha_esperada_devolucion DATE,
    fecha_real_devolucion DATE,
    id_prestamo INT,
    libro_prestado VARCHAR(100) NOT NULL,
    socio_libro VARCHAR(100) NOT NULL,
    PRIMARY KEY (id_prestamo),
    FOREIGN KEY (libro_prestado) REFERENCES libro(ISBN),
    FOREIGN KEY (socio_libro) REFERENCES socio(rut)
);
--visualizar
--SELECT * FROM prestamo
--eliminar si es necesario
--DROP TABLE prestamo

--insertar los registros en las tablas correspondientes
--insertar en tabla autor

INSERT INTO autor(codigo_autor,nombre_autor, apellido_autor,  fecha_nacimiento_autor, fecha_muerte_autor)
VALUES(3, 'José', 'Salgado',1968, 2020);

INSERT INTO autor(codigo_autor,nombre_autor, apellido_autor,  fecha_nacimiento_autor, fecha_muerte_autor)
VALUES(4, 'Ana', 'Salgado',1972, 0);

INSERT INTO autor(codigo_autor,nombre_autor, apellido_autor,  fecha_nacimiento_autor, fecha_muerte_autor)
VALUES(1, 'Andrés', 'Ulloa',1982, 0);

INSERT INTO autor(codigo_autor,nombre_autor, apellido_autor,  fecha_nacimiento_autor, fecha_muerte_autor)
VALUES(2, 'Sergio', 'Mardones',1950, 2012);

INSERT INTO autor(codigo_autor,nombre_autor, apellido_autor,  fecha_nacimiento_autor, fecha_muerte_autor)
VALUES(5, 'Martín', 'Porta', 1976, 0);

--insertar en tabla socio
INSERT INTO socio(rut, nombre, apellido, direccion, telefono)
VALUES('1111111-1', 'Juan', 'Soto', 'Avenida 1, Santiago', 91111111);

INSERT INTO socio(rut, nombre, apellido, direccion, telefono)
VALUES('2222222-2', 'Ana', 'Pérez', 'Pasaje 2, Santiago', 92222222);

INSERT INTO socio(rut, nombre, apellido, direccion, telefono)
VALUES('3333333-3', 'Sandra', 'Aguilar', 'Avenida 2, Santiago', 933333333);

INSERT INTO socio(rut, nombre, apellido, direccion, telefono)
VALUES('4444444-4', 'Esteban', 'Jerez', 'Avenida 3, Santiago', 95555555);

--me equivoque en el valor anterior, asi que lo actualizo.
UPDATE socio SET telefono= 94444444 WHERE nombre= 'Esteban';

INSERT INTO socio(rut, nombre, apellido, direccion, telefono)
VALUES('5555555-5', 'Silvana', 'Muñoz', 'Pasaje 3, Santiago', 95555555);

--insertar datos en tabla libro
INSERT INTO libro(ISBN, titulo, numero_paginas)
VALUES('111-111-1111-111', 'Cuentos de terror',344);

INSERT INTO libro(ISBN, titulo, numero_paginas)
VALUES('222-222-2222-222', 'Poesías contemporáneas', 167);

INSERT INTO libro(ISBN, titulo, numero_paginas)
VALUES('333-333-3333-333', 'Historia de Asia', 511);

INSERT INTO libro(ISBN, titulo, numero_paginas)
VALUES('444-444-4444-444', 'Manual de mecánica', 298);

INSERT INTO libro_autor(id_libro, id_autor, tipo_autor)
VALUES ('111-111-1111-111', 3, 'PRINCIPAL');

INSERT INTO libro_autor(id_libro, id_autor, tipo_autor)
VALUES ('111-111-1111-111', 4, 'COAUTOR');

--insertar en tabla préstamo. Fechas (formato AAAA-MM-DD)
INSERT INTO prestamo(fecha_inicio, fecha_esperada_devolucion, fecha_real_devolucion, id_prestamo, libro_prestado,socio_libro)
VALUES('2020-01-20', '2020-01-25', '2020-01-27', '123123', '111-111-1111-111', '1111111-1');

INSERT INTO prestamo(fecha_inicio, fecha_esperada_devolucion, fecha_real_devolucion, id_prestamo, libro_prestado,socio_libro)
VALUES('2020-01-20', '2020-01-25', '2020-01-30', '345345', '222-222-2222-222','5555555-5' );

INSERT INTO prestamo(fecha_inicio, fecha_esperada_devolucion, fecha_real_devolucion, id_prestamo, libro_prestado,socio_libro)
VALUES('2020-01-30', '2020-02-07', '2020-02-12', '124124', '444-444-4444-444', '1111111-1');

INSERT INTO prestamo(fecha_inicio, fecha_esperada_devolucion, fecha_real_devolucion, id_prestamo, libro_prestado,socio_libro)
VALUES('2020-01-22', '2020-01-28', '2020-01-30', '353535', '333-333-3333-333','3333333-3' );

INSERT INTO prestamo(fecha_inicio, fecha_esperada_devolucion, fecha_real_devolucion, id_prestamo, libro_prestado,socio_libro)
VALUES('2020-01-23', '2020-01-28', '2020-01-30', '789789','444-444-4444-444', '4444444-4');

INSERT INTO prestamo(fecha_inicio, fecha_esperada_devolucion, fecha_real_devolucion, id_prestamo, libro_prestado,socio_libro)
VALUES('2020-01-23', '2020-01-28', '2020-02-04', '654654', '111-111-1111-111', '2222222-2');

INSERT INTO prestamo(fecha_inicio, fecha_esperada_devolucion, fecha_real_devolucion, id_prestamo, libro_prestado,socio_libro)
VALUES('2020-01-30', '2020-02-06', '2020-02-12', '363636', '222-222-2222-222','3333333-3' );

--parte 2: a) mostrar todos los libros que posean menos de 300 paginas

SELECT titulo FROM libro WHERE numero_paginas <300
ORDER BY titulo;

--mostrar todos los autores que hayan nacido despues del 01-01-1970

SELECT nombre_autor, apellido_autor FROM autor WHERE fecha_nacimiento_autor > 1970;

-- los mas solicitados
SELECT libro.titulo, COUNT (libro.titulo)
as libros_mas_pedidos
FROM prestamo INNER JOIN libro ON prestamo.libro_prestado=libro.ISBN
GROUP BY libro.titulo
ORDER BY libros_mas_pedidos;

--si se cobrara una multa de 100 pesos por cada dia de atraso, mostrar cuanto deberia pagar cada usuario que entregue el prestamo despues de 7 dias.

SELECT socio.nombre, socio.apellido, socio.rut, SUM (fecha_real_devolucion-fecha_esperada_devolucion)*100 AS deuda 
FROM prestamo 
INNER JOIN socio 
ON socio.rut=prestamo.socio_libro
GROUP BY socio.rut
ORDER BY deuda;