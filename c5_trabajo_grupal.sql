-- Parte 1: Crear entorno de trabajo
CREATE DATABASE telovendo_grupal_5_db;
/*
CREATE USER 'admintienda'@'localhost' IDENTIFIED BY '123456';
GRANT ALL PRIVILEGES ON telovendo_grupal_5_db.* TO 'admintienda'@'localhost' WITH GRANT OPTION;
*/
USE telovendo_grupal_5_db;



-- Parte 2: Crear dos tablas. --------------------------------------------------------------------
CREATE TABLE usuarios (
  id_usuario INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(50) NOT NULL,
  apellido VARCHAR(50) NOT NULL,
  contrasenia VARCHAR(255) NOT NULL,
  zona_horaria VARCHAR(6) DEFAULT 'UTC-3',
  genero VARCHAR(20) NOT NULL,
  telefono VARCHAR(20) NOT NULL
);

CREATE TABLE ingresos (
  id_ingreso INT PRIMARY KEY,
  id_usuario INT NOT NULL,
  fecha_hora_ingreso DATETIME DEFAULT NOW(),
  FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);



-- Parte 3: Modificación de la tabla --------------------------------------------------------------------
-- Modifique el UTC por defecto.Desde UTC-3 a UTC-2.
ALTER TABLE usuarios
modify zona_horaria VARCHAR(6) DEFAULT 'UTC-2';



-- Parte 4: Creación de registros. --------------------------------------------------------------------
-- Para cada tabla crea 8 registros.
INSERT INTO usuarios (nombre, apellido, contrasenia, genero, telefono) VALUES
('Lucia', 'Garcia', 'luciagarcia123', 'Femenino', '98765432'),
('Juan', 'Perez', 'juanperez456', 'Masculino', '12345678'),
('Maria', 'Rodriguez', 'mariarodriguez789', 'Femenino', '45678901'),
('Pedro', 'Gomez', 'pedrogomez012', 'Masculino', '23456789'),
('Laura', 'Lopez', 'lauralopez345', 'Femenino', '67890123'),
('Diego', 'Martinez', 'diegomartinez678', 'Masculino', '34567890'),
('Carla', 'Sanchez', 'carlasanchez901', 'Femenino', '89012345'),
('Jorge', 'Fernandez', 'jorgefernandez234', 'Masculino', '56789012');

INSERT INTO ingresos (id_ingreso, id_usuario, fecha_hora_ingreso) VALUES
(1, 1, '2023-04-17 09:00:00'),
(2, 2, '2023-04-17 09:30:00'),
(3, 3, '2023-04-17 10:00:00'),
(4, 4, '2023-04-17 10:30:00'),
(5, 5, '2023-04-17 11:00:00'),
(6, 6, '2023-04-17 11:30:00'),
(7, 7, '2023-04-17 12:00:00');

INSERT INTO ingresos (id_ingreso, id_usuario) VALUES
(8, 8);



-- Parte 5: Justifique cada tipo de dato utilizado. ¿Es el óptimo en cada caso? ----------------
-- INT para los campos númericos
-- VARCHAR para los campos tipo texto
--  NOT NULL para que los campos no almacenen datos nulos
-- DEFAULT para asignar un valor por defecto
-- PRIMARY KEY para indicar un número único de identificación
-- AUTO_INCREMENT para indicar un valor auto incremental
-- DATETIME para indicar un campo de tipo fecha y hora
-- FOREIGN KEY para indicar una llave de referencia a una llave primaria de otra tabla
-- REFERENCES para indicar a que tabla se está haciendo referencia




-- Parte 6: Creen una nueva tabla llamada Contactos 
-- (id_contacto, id_usuario, numero de telefono,correo electronico). --------------------------------------------------------------------
CREATE TABLE contactos (
  id_contacto INT PRIMARY KEY AUTO_INCREMENT,
  id_usuario INT NOT NULL,
  numero_telefono VARCHAR(20) NOT NULL,
  correo_electronico VARCHAR(50) NOT NULL,
  FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);



-- Parte 7: Modifique la columna teléfono de contacto, 
-- para crear un vínculo entre la tabla Usuarios y la tabla Contactos.
ALTER TABLE usuarios DROP COLUMN telefono;
-- el vinculo fue creado en la tabla contactos ya que un usuario tiene uno a muchos contactos de telefono.




-- consultas de prueba
select * from usuarios;
select * from ingresos;