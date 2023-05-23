-- Borrar la base de datos si existe
DROP DATABASE IF EXISTS TFG;

-- Crear base de datos
CREATE DATABASE TFG;

-- Usar base de datos
USE TFG;

-- Crear tabla Usuarios
CREATE TABLE usuarios (
  id INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(255) NOT NULL,
  correo_electronico VARCHAR(255) NOT NULL,
  contraseña VARCHAR(255) NOT NULL,
  tipo ENUM('admin', 'normal') DEFAULT 'normal',
  PRIMARY KEY (id)
);

-- Crear tabla TipoCrucero
CREATE TABLE TipoCrucero (
  id INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);

-- Crear tabla Cruceros
CREATE TABLE Cruceros (
  id INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(255) NOT NULL,
  destino VARCHAR(255) NOT NULL,
  descripcion TEXT NOT NULL,
  puerto_de_salida VARCHAR(255) NOT NULL,
  puerto_de_llegada VARCHAR(255) NOT NULL,
  fecha_de_salida DATE NOT NULL,
  fecha_de_llegada DATE NOT NULL,
  tipo_id INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (tipo_id) REFERENCES TipoCrucero(id)
);

-- Crear tabla Camarotes
CREATE TABLE camarotes (
  id INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(255) NOT NULL,
  descripcion TEXT NOT NULL,
  tipo_de_cama VARCHAR(255) NOT NULL,
  precio DECIMAL(10,2) NOT NULL,
  cantidad_disponible INT NOT NULL,
  crucero_id INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (crucero_id) REFERENCES Cruceros(id)
);

-- Crear tabla Reservas
CREATE TABLE reservas (
  id INT NOT NULL AUTO_INCREMENT,
  usuario_id INT NOT NULL,
  camarote_id INT NOT NULL,
  fecha_de_reserva DATETIME NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
  FOREIGN KEY (camarote_id) REFERENCES camarotes(id)
);

-- Crear tabla Comentarios
CREATE TABLE comentarios (
  id INT NOT NULL AUTO_INCREMENT,
  usuario_id INT NOT NULL,
  crucero_id INT NOT NULL,
  comentario TEXT NOT NULL,
  fecha_de_comentario DATETIME NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
  FOREIGN KEY (crucero_id) REFERENCES Cruceros(id)
);

-- Crear tabla Servicios
CREATE TABLE servicios (
  id INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(255) NOT NULL,
  descripcion TEXT NOT NULL,
  precio DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (id)
);

-- Crear tabla Abordo
CREATE TABLE abordo (
  id INT NOT NULL AUTO_INCREMENT,
  camarote_id INT NOT NULL,
  servicio_id INT NOT NULL,
  fecha_de_solicitud DATETIME NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (camarote_id) REFERENCES camarotes(id),
  FOREIGN KEY (servicio_id) REFERENCES servicios(id)
);

-- Crear tabla ServiciosCrucero
CREATE TABLE ServiciosCrucero (
  id INT NOT NULL AUTO_INCREMENT,
  crucero_id INT NOT NULL,
  servicio_id INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (crucero_id) REFERENCES Cruceros(id),
  FOREIGN KEY (servicio_id) REFERENCES servicios(id)
);

-- Insertar datos en la tabla TipoCrucero
INSERT INTO TipoCrucero (nombre)
VALUES ('Parejas'), ('Familias'), ('Solteros'), ('LGTBI+'), ('Tercera Edad');

-- Insertar datos en la tabla Cruceros
INSERT INTO Cruceros (nombre, destino, descripcion, puerto_de_salida, puerto_de_llegada, fecha_de_salida, fecha_de_llegada, tipo_id)
VALUES ('Crucero Mediterráneo', 'Mediterráneo', 'Crucero por el mar Mediterráneo', 'Barcelona', 'Roma', '2023-06-01', '2023-06-10', 1),
('Crucero Caribe', 'Caribe', 'Disfruta de las playas caribeñas en este crucero', 'Miami', 'Cozumel', '2023-07-01', '2023-07-10', 2);

-- Insertar datos en la tabla Camarotes
INSERT INTO camarotes (nombre, descripcion, tipo_de_cama, precio, cantidad_disponible, crucero_id)
VALUES ('Camarote Deluxe', 'Camarote amplio con vista al mar', 'Cama Queen', 500.00, 10, 1),
('Camarote Interior', 'Camarote económico sin vista al mar', 'Cama Individual', 300.00, 20, 1),
('Camarote Balcón', 'Camarote con balcón privado', 'Cama King', 700.00, 5, 2);

-- Insertar datos en la tabla Servicios
INSERT INTO servicios (nombre, descripcion, precio)
VALUES ('Paquete Todo Incluido', 'Disfruta de comidas y bebidas ilimitadas a bordo', 200.00),
('Masaje Spa', 'Relájate con un masaje en nuestro spa de lujo', 100.00),
('Excursión en Tierra', 'Explora destinos emocionantes en nuestras excursiones en tierra', 50.00);

-- Insertar datos en la tabla ServiciosCrucero
INSERT INTO ServiciosCrucero (crucero_id, servicio_id)
VALUES (1, 1), (1, 2), (2, 3);



