-- Borrar la base de datos si existe
DROP DATABASE IF EXISTS TFG;

-- Crear base de datos
CREATE DATABASE TFG;

-- Usar base de datos
USE TFG;

-- Crear tabla user
CREATE TABLE user (
  id INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  roles ENUM('admin', 'normal') DEFAULT 'normal',
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
  FOREIGN KEY (usuario_id) REFERENCES user(id),
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
  FOREIGN KEY (usuario_id) REFERENCES user(id),
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
VALUES ('Parejas'), ('Familias'), ('Solteros'), ('LGTBI+'), ('Tercera Edad'), ('Adolescentes');

-- Insertar datos en la tabla Cruceros
INSERT INTO Cruceros (nombre, destino, descripcion, puerto_de_salida, puerto_de_llegada, fecha_de_salida, fecha_de_llegada, tipo_id)
SELECT 
  'Crucero Mediterráneo' AS nombre,
  'Mediterráneo' AS destino,
  'Embárcate en una aventura inolvidable y descubre la belleza del Mar Mediterráneo a bordo de un lujoso crucero.' AS descripcion,
  'Barcelona' AS puerto_de_salida,
  'Roma' AS puerto_de_llegada,
  '2023-06-01' AS fecha_de_salida,
  '2023-06-10' AS fecha_de_llegada,
  tipo_id
FROM
  (SELECT 1 AS tipo_id UNION ALL
   SELECT 2 AS tipo_id UNION ALL
   SELECT 3 AS tipo_id UNION ALL
   SELECT 4 AS tipo_id UNION ALL
   SELECT 5 AS tipo_id UNION ALL
   SELECT 6 AS tipo_id) t;

INSERT INTO Cruceros (nombre, destino, descripcion, puerto_de_salida, puerto_de_llegada, fecha_de_salida, fecha_de_llegada, tipo_id)
SELECT 
  'Crucero Caribe' AS nombre,
  'Caribe' AS destino,
  'Disfruta de las playas caribeñas en este crucero. Explora las aguas cristalinas y las impresionantes playas de arena blanca mientras te relajas y disfrutas del sol caribeño. A bordo, podrás disfrutar de comidas deliciosas, actividades emocionantes y entretenimiento de primer nivel.' AS descripcion,
  'Miami' AS puerto_de_salida,
  'Cozumel' AS puerto_de_llegada,
  '2023-07-01' AS fecha_de_salida,
  '2023-07-10' AS fecha_de_llegada,
  tipo_id
FROM
  (SELECT 1 AS tipo_id UNION ALL
   SELECT 2 AS tipo_id UNION ALL
   SELECT 3 AS tipo_id UNION ALL
   SELECT 4 AS tipo_id UNION ALL
   SELECT 5 AS tipo_id UNION ALL
   SELECT 6 AS tipo_id) t;

INSERT INTO Cruceros (nombre, destino, descripcion, puerto_de_salida, puerto_de_llegada, fecha_de_salida, fecha_de_llegada, tipo_id)
SELECT 
  'Crucero Norte de Europa' AS nombre,
  'Norte de Europa' AS destino,
  'Embárcate en un fascinante crucero por el Norte de Europa y descubre la belleza de sus paisajes y ciudades. Este viaje te llevará a través de impresionantes fiordos, majestuosas montañas y vibrantes ciudades costeras. Disfruta de la rica cultura, la historia antigua y la hospitalidad de los países escandinavos y bálticos. A bordo del crucero, podrás disfrutar de comodidades de lujo, deliciosa gastronomía y una amplia gama de actividades y entretenimiento.' AS descripcion,
  'Copenhague' AS puerto_de_salida,
  'Estocolmo' AS puerto_de_llegada,
  '2023-08-01' AS fecha_de_salida,
  '2023-08-10' AS fecha_de_llegada,
  tipo_id
FROM
  (SELECT 1 AS tipo_id UNION ALL
   SELECT 2 AS tipo_id UNION ALL
   SELECT 3 AS tipo_id UNION ALL
   SELECT 4 AS tipo_id UNION ALL
   SELECT 5 AS tipo_id UNION ALL
   SELECT 6 AS tipo_id) t;

INSERT INTO Cruceros (nombre, destino, descripcion, puerto_de_salida, puerto_de_llegada, fecha_de_salida, fecha_de_llegada, tipo_id)
SELECT 
  'Crucero Alaska' AS nombre,
  'Alaska' AS destino,
  'Embárcate en un emocionante crucero por Alaska y descubre la belleza natural y salvaje de este fascinante destino. Explora los impresionantes fiordos, glaciares majestuosos y la abundante vida silvestre que ofrece Alaska. Disfruta de experiencias únicas como avistar ballenas, practicar senderismo en paisajes espectaculares y descubrir la rica cultura de las comunidades nativas. A bordo del crucero, podrás disfrutar de comodidades de lujo, una deliciosa gastronomía y entretenimiento de primer nivel mientras te maravillas con los increíbles paisajes de Alaska.' AS descripcion,
  'Seattle' AS puerto_de_salida,
  'Anchorage' AS puerto_de_llegada,
  '2023-09-01' AS fecha_de_salida,
  '2023-09-10' AS fecha_de_llegada,
  tipo_id
FROM
  (SELECT 1 AS tipo_id UNION ALL
   SELECT 2 AS tipo_id UNION ALL
   SELECT 3 AS tipo_id UNION ALL
   SELECT 4 AS tipo_id UNION ALL
   SELECT 5 AS tipo_id UNION ALL
   SELECT 6 AS tipo_id) t;

INSERT INTO Cruceros (nombre, destino, descripcion, puerto_de_salida, puerto_de_llegada, fecha_de_salida, fecha_de_llegada, tipo_id)
SELECT 
  'Crucero Dubai' AS nombre,
  'Dubai' AS destino,
  'Embárcate en un lujoso crucero por Dubai y descubre la opulencia y el encanto de esta ciudad de los Emiratos Árabes Unidos. Disfruta de las vistas impresionantes del horizonte de rascacielos, las playas doradas y los lujosos complejos turísticos. Explora las maravillas modernas como el Burj Khalifa, el Burj Al Arab y el Palm Jumeirah. A bordo del crucero, te deleitarás con una deliciosa gastronomía, relajantes spas y una amplia variedad de entretenimiento y actividades.' AS descripcion,
  'Dubai' AS puerto_de_salida,
  'Dubai' AS puerto_de_llegada,
  '2023-10-01' AS fecha_de_salida,
  '2023-10-10' AS fecha_de_llegada,
  tipo_id
FROM
  (SELECT 1 AS tipo_id UNION ALL
   SELECT 2 AS tipo_id UNION ALL
   SELECT 3 AS tipo_id UNION ALL
   SELECT 4 AS tipo_id UNION ALL
   SELECT 5 AS tipo_id UNION ALL
   SELECT 6 AS tipo_id) t;

INSERT INTO Cruceros (nombre, destino, descripcion, puerto_de_salida, puerto_de_llegada, fecha_de_salida, fecha_de_llegada, tipo_id)
SELECT 
  'Crucero Egipto' AS nombre,
  'Egipto' AS destino,
  'Embárcate en un fascinante crucero por Egipto y descubre los tesoros antiguos de esta tierra llena de historia y misterio. Explora los impresionantes templos de Luxor y Karnak, navega por el majestuoso río Nilo y maravíllate con las pirámides de Giza y la Esfinge. Sumérgete en la rica cultura egipcia mientras visitas los mercados locales y disfrutas de la gastronomía tradicional. A bordo del crucero, disfrutarás de comodidades de lujo, entretenimiento en vivo y una experiencia inolvidable en una de las civilizaciones más antiguas del mundo.' AS descripcion,
  'Luxor' AS puerto_de_salida,
  'Asuán' AS puerto_de_llegada,
  '2023-11-01' AS fecha_de_salida,
  '2023-11-10' AS fecha_de_llegada,
  tipo_id
FROM
  (SELECT 1 AS tipo_id UNION ALL
   SELECT 2 AS tipo_id UNION ALL
   SELECT 3 AS tipo_id UNION ALL
   SELECT 4 AS tipo_id UNION ALL
   SELECT 5 AS tipo_id UNION ALL
   SELECT 6 AS tipo_id) t;

INSERT INTO Cruceros (nombre, destino, descripcion, puerto_de_salida, puerto_de_llegada, fecha_de_salida, fecha_de_llegada, tipo_id)
SELECT 
  'Crucero Sudáfrica' AS nombre,
  'Sudáfrica' AS destino,
  'Embárcate en un emocionante crucero por Sudáfrica y descubre la belleza de este país fascinante. Explora la vida silvestre en los famosos parques nacionales, como el Parque Nacional Kruger, admira los paisajes impresionantes de la Ruta Jardín y sumérgete en la cultura vibrante de ciudades como Ciudad del Cabo y Johannesburgo. Disfruta de experiencias únicas como avistar animales en su hábitat natural y degustar la deliciosa gastronomía local. A bordo del crucero, relájate y disfruta de todas las comodidades mientras navegas por la costa sudafricana.' AS descripcion,
  'Ciudad del Cabo' AS puerto_de_salida,
  'Durban' AS puerto_de_llegada,
  '2023-12-01' AS fecha_de_salida,
  '2023-12-10' AS fecha_de_llegada,
  tipo_id
FROM
  (SELECT 1 AS tipo_id UNION ALL
   SELECT 2 AS tipo_id UNION ALL
   SELECT 3 AS tipo_id UNION ALL
   SELECT 4 AS tipo_id UNION ALL
   SELECT 5 AS tipo_id UNION ALL
   SELECT 6 AS tipo_id) t;

INSERT INTO Cruceros (nombre, destino, descripcion, puerto_de_salida, puerto_de_llegada, fecha_de_salida, fecha_de_llegada, tipo_id)
SELECT 
  'Crucero Asia' AS nombre,
  'Asia' AS destino,
  'Embárcate en un inolvidable crucero por Asia y explora la riqueza cultural y los impresionantes paisajes de esta región diversa. Descubre las antiguas maravillas de China, la exótica belleza de Tailandia, la modernidad de Singapur y mucho más. Visita templos sagrados, saborea la deliciosa comida local y disfruta de la hospitalidad asiática. A bordo del crucero, podrás disfrutar de lujosas instalaciones, entretenimiento en vivo y vistas panorámicas mientras navegas por los mares asiáticos.' AS descripcion,
  'Hong Kong' AS puerto_de_salida,
  'Tokio' AS puerto_de_llegada,
  '2024-01-01' AS fecha_de_salida,
  '2024-01-10' AS fecha_de_llegada,
  tipo_id
FROM
  (SELECT 1 AS tipo_id UNION ALL
   SELECT 2 AS tipo_id UNION ALL
   SELECT 3 AS tipo_id UNION ALL
   SELECT 4 AS tipo_id UNION ALL
   SELECT 5 AS tipo_id UNION ALL
   SELECT 6 AS tipo_id) t;

INSERT INTO Cruceros (nombre, destino, descripcion, puerto_de_salida, puerto_de_llegada, fecha_de_salida, fecha_de_llegada, tipo_id)
SELECT 
  'Crucero Sudamérica' AS nombre,
  'Sudamérica' AS destino,
  'Embárcate en un increíble crucero por Sudamérica y descubre la diversidad y la belleza de este continente fascinante. Explora la selva amazónica en Brasil, visita las famosas playas de Copacabana en Río de Janeiro, maravíllate con las majestuosas cataratas del Iguazú en Argentina y explora la encantadora ciudad de Valparaíso en Chile. Disfruta de la exquisita gastronomía, la música y el baile de diferentes culturas mientras navegas por los mares de Sudamérica. A bordo del crucero, relájate y disfruta de todas las comodidades y entretenimiento que ofrece.' AS descripcion,
  'Buenos Aires' AS puerto_de_salida,
  'Santiago de Chile' AS puerto_de_llegada,
  '2024-02-01' AS fecha_de_salida,
  '2024-02-10' AS fecha_de_llegada,
  tipo_id
FROM
  (SELECT 1 AS tipo_id UNION ALL
   SELECT 2 AS tipo_id UNION ALL
   SELECT 3 AS tipo_id UNION ALL
   SELECT 4 AS tipo_id UNION ALL
   SELECT 5 AS tipo_id UNION ALL
   SELECT 6 AS tipo_id) t;



-- Insertar datos en la tabla Camarotes
INSERT INTO camarotes (nombre, descripcion, tipo_de_cama, precio, cantidad_disponible, crucero_id)
SELECT
  'Camarote Deluxe' AS nombre,
  'Camarote amplio con vista al mar' AS descripcion,
  'Cama Queen' AS tipo_de_cama,
  500.00 AS precio,
  10 AS cantidad_disponible,
  id AS crucero_id
FROM
  cruceros;

INSERT INTO camarotes (nombre, descripcion, tipo_de_cama, precio, cantidad_disponible, crucero_id)
SELECT
  'Camarote Interior' AS nombre,
  'Camarote económico sin vista al mar' AS descripcion,
  'Cama Individual' AS tipo_de_cama,
  300.00 AS precio,
  20 AS cantidad_disponible,
  id AS crucero_id
FROM
  cruceros;

INSERT INTO camarotes (nombre, descripcion, tipo_de_cama, precio, cantidad_disponible, crucero_id)
SELECT
  'Camarote Balcón' AS nombre,
  'Camarote con balcón privado' AS descripcion,
  'Cama King' AS tipo_de_cama,
  700.00 AS precio,
  5 AS cantidad_disponible,
  id AS crucero_id
FROM
  cruceros;


-- Insertar datos en la tabla Servicios
INSERT INTO servicios (nombre, descripcion, precio)
VALUES
  ('Paquete Todo Incluido', 'Disfruta de comidas y bebidas ilimitadas a bordo', 200.00),
  ('Masaje Spa', 'Relájate con un masaje en nuestro spa de lujo', 100.00),
  ('Excursión en Tierra', 'Explora destinos emocionantes en nuestras excursiones en tierra', 50.00);

-- Insertar datos en la tabla ServiciosCrucero
INSERT INTO ServiciosCrucero (crucero_id, servicio_id)
SELECT c.id, s.id
FROM cruceros c, servicios s;


-- Usuario admin
INSERT INTO user (nombre, email, password, roles)
VALUES ('admin', 'admin@example.com', SHA2('123456789', 256), 'admin');




