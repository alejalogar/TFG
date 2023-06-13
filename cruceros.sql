-- Borrar la base de datos si existe
DROP DATABASE IF EXISTS TFG;

-- Crear base de datos
CREATE DATABASE TFG;

-- Usar base de datos
USE TFG;

CREATE TABLE user (
  id INT NOT NULL AUTO_INCREMENT,
  email VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  roles VARCHAR(20) NOT NULL,
  PRIMARY KEY (id),
  CHECK (roles IN ('admin', 'normal'))
);


-- Crear tabla TipoCrucero
CREATE TABLE TipoCrucero (
  id INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);

-- Crear tabla Crucero
CREATE TABLE Crucero (
  id INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(255) NOT NULL,
  destino VARCHAR(255) NOT NULL,
  descripcion TEXT NOT NULL,
  puerto_de_salida VARCHAR(255) NOT NULL,
  puerto_de_llegada VARCHAR(255) NOT NULL,
  fecha_de_salida DATE NOT NULL,
  fecha_de_llegada DATE NOT NULL,
  tipo_id INT NOT NULL,
  imagen VARCHAR(255), -- Columna para almacenar la ruta de la imagen
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
  FOREIGN KEY (crucero_id) REFERENCES Crucero(id)
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
  FOREIGN KEY (crucero_id) REFERENCES Crucero(id)
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
  FOREIGN KEY (crucero_id) REFERENCES Crucero(id),
  FOREIGN KEY (servicio_id) REFERENCES servicios(id)
);


-- Insertar datos en la tabla TipoCrucero
INSERT INTO TipoCrucero (nombre)
VALUES ('Parejas'), ('Familias'), ('Solteros'), ('LGTBI+'), ('Tercera Edad'), ('Adolescentes');

-- Insertar datos en la tabla Crucero
INSERT INTO Crucero (nombre, destino, descripcion, puerto_de_salida, puerto_de_llegada, fecha_de_salida, fecha_de_llegada, imagen, 
tipo_id)
SELECT 
  'Crucero Mediterráneo' AS nombre,
  'Mediterráneo' AS destino,
  'Embárcate en una aventura inolvidable y descubre la belleza del Mar Mediterráneo a bordo de un lujoso crucero.' AS descripcion,
  'Barcelona' AS puerto_de_salida,
  'Roma' AS puerto_de_llegada,
  '2023-06-01' AS fecha_de_salida,
  '2023-06-10' AS fecha_de_llegada,
   imagenes.imagen AS imagen,
  tipos.tipo_id
FROM
  (SELECT 1 AS tipo_id UNION ALL
   SELECT 2 AS tipo_id UNION ALL
   SELECT 3 AS tipo_id UNION ALL
   SELECT 4 AS tipo_id UNION ALL
   SELECT 5 AS tipo_id UNION ALL
   SELECT 6 AS tipo_id) tipos
JOIN
  (SELECT 1 AS tipo_id, '/ruta/de/imagen1' AS imagen UNION ALL
   SELECT 2 AS tipo_id, '/ruta/de/imagen2' AS imagen UNION ALL
   SELECT 3 AS tipo_id, '/ruta/de/imagen3' AS imagen UNION ALL
   SELECT 4 AS tipo_id, '/ruta/de/imagen4' AS imagen UNION ALL
   SELECT 5 AS tipo_id, '/ruta/de/imagen5' AS imagen UNION ALL
   SELECT 6 AS tipo_id, '/ruta/de/imagen6' AS imagen) imagenes
ON tipos.tipo_id = imagenes.tipo_id
ORDER BY RAND();
 

 








INSERT INTO Crucero (nombre, destino, descripcion, puerto_de_salida, puerto_de_llegada, fecha_de_salida, fecha_de_llegada, imagen, 
tipo_id)
SELECT 
  'Crucero Caribe' AS nombre,
  'Caribe' AS destino,
  'Disfruta de las playas caribeñas en este crucero. Explora las aguas cristalinas y las impresionantes playas de arena blanca mientras te relajas y disfrutas del sol caribeño. A bordo, podrás disfrutar de comidas deliciosas, actividades emocionantes y entretenimiento de primer nivel.' AS descripcion,
  'Miami' AS puerto_de_salida,
  'Cozumel' AS puerto_de_llegada,
  '2023-07-01' AS fecha_de_salida,
  '2023-07-10' AS fecha_de_llegada,
   imagenes.imagen AS imagen,
  tipos.tipo_id
FROM
  (SELECT 1 AS tipo_id UNION ALL
   SELECT 2 AS tipo_id UNION ALL
   SELECT 3 AS tipo_id UNION ALL
   SELECT 4 AS tipo_id UNION ALL
   SELECT 5 AS tipo_id UNION ALL
   SELECT 6 AS tipo_id) tipos
JOIN
  (SELECT 1 AS tipo_id, '/ruta/de/imagen1' AS imagen UNION ALL
   SELECT 2 AS tipo_id, '/ruta/de/imagen2' AS imagen UNION ALL
   SELECT 3 AS tipo_id, '/ruta/de/imagen3' AS imagen UNION ALL
   SELECT 4 AS tipo_id, '/ruta/de/imagen4' AS imagen UNION ALL
   SELECT 5 AS tipo_id, '/ruta/de/imagen5' AS imagen UNION ALL
   SELECT 6 AS tipo_id, '/ruta/de/imagen6' AS imagen) imagenes
ON tipos.tipo_id = imagenes.tipo_id
ORDER BY RAND();
 

 







INSERT INTO Crucero (nombre, destino, descripcion, puerto_de_salida, puerto_de_llegada, fecha_de_salida, fecha_de_llegada, imagen, 
tipo_id)
SELECT 
  'Crucero Norte de Europa' AS nombre,
  'Norte de Europa' AS destino,
  'Embárcate en un fascinante crucero por el Norte de Europa y descubre la belleza de sus paisajes y ciudades. Este viaje te llevará a través de impresionantes fiordos, majestuosas montañas y vibrantes ciudades costeras. Disfruta de la rica cultura, la historia antigua y la hospitalidad de los países escandinavos y bálticos. A bordo del crucero, podrás disfrutar de comodidades de lujo, deliciosa gastronomía y una amplia gama de actividades y entretenimiento.' AS descripcion,
  'Copenhague' AS puerto_de_salida,
  'Estocolmo' AS puerto_de_llegada,
  '2023-08-01' AS fecha_de_salida,
  '2023-08-10' AS fecha_de_llegada,
   imagenes.imagen AS imagen,
  tipos.tipo_id
FROM
  (SELECT 1 AS tipo_id UNION ALL
   SELECT 2 AS tipo_id UNION ALL
   SELECT 3 AS tipo_id UNION ALL
   SELECT 4 AS tipo_id UNION ALL
   SELECT 5 AS tipo_id UNION ALL
   SELECT 6 AS tipo_id) tipos
JOIN
  (SELECT 1 AS tipo_id, '/ruta/de/imagen1' AS imagen UNION ALL
   SELECT 2 AS tipo_id, '/ruta/de/imagen2' AS imagen UNION ALL
   SELECT 3 AS tipo_id, '/ruta/de/imagen3' AS imagen UNION ALL
   SELECT 4 AS tipo_id, '/ruta/de/imagen4' AS imagen UNION ALL
   SELECT 5 AS tipo_id, '/ruta/de/imagen5' AS imagen UNION ALL
   SELECT 6 AS tipo_id, '/ruta/de/imagen6' AS imagen) imagenes
ON tipos.tipo_id = imagenes.tipo_id
ORDER BY RAND();
 

 







INSERT INTO Crucero (nombre, destino, descripcion, puerto_de_salida, puerto_de_llegada, fecha_de_salida, fecha_de_llegada, imagen, 
tipo_id)
SELECT 
  'Crucero Alaska' AS nombre,
  'Alaska' AS destino,
  'Embárcate en un emocionante crucero por Alaska y descubre la belleza natural y salvaje de este fascinante destino. Explora los impresionantes fiordos, glaciares majestuosos y la abundante vida silvestre que ofrece Alaska. Disfruta de experiencias únicas como avistar ballenas, practicar senderismo en paisajes espectaculares y descubrir la rica cultura de las comunidades nativas. A bordo del crucero, podrás disfrutar de comodidades de lujo, una deliciosa gastronomía y entretenimiento de primer nivel mientras te maravillas con los increíbles paisajes de Alaska.' AS descripcion,
  'Seattle' AS puerto_de_salida,
  'Anchorage' AS puerto_de_llegada,
  '2023-09-01' AS fecha_de_salida,
  '2023-09-10' AS fecha_de_llegada,
   imagenes.imagen AS imagen,
  tipos.tipo_id
FROM
  (SELECT 1 AS tipo_id UNION ALL
   SELECT 2 AS tipo_id UNION ALL
   SELECT 3 AS tipo_id UNION ALL
   SELECT 4 AS tipo_id UNION ALL
   SELECT 5 AS tipo_id UNION ALL
   SELECT 6 AS tipo_id) tipos
JOIN
  (SELECT 1 AS tipo_id, '/ruta/de/imagen1' AS imagen UNION ALL
   SELECT 2 AS tipo_id, '/ruta/de/imagen2' AS imagen UNION ALL
   SELECT 3 AS tipo_id, '/ruta/de/imagen3' AS imagen UNION ALL
   SELECT 4 AS tipo_id, '/ruta/de/imagen4' AS imagen UNION ALL
   SELECT 5 AS tipo_id, '/ruta/de/imagen5' AS imagen UNION ALL
   SELECT 6 AS tipo_id, '/ruta/de/imagen6' AS imagen) imagenes
ON tipos.tipo_id = imagenes.tipo_id
ORDER BY RAND();
 

 







INSERT INTO Crucero (nombre, destino, descripcion, puerto_de_salida, puerto_de_llegada, fecha_de_salida, fecha_de_llegada, imagen, 
tipo_id)
SELECT 
  'Crucero Dubai' AS nombre,
  'Dubai' AS destino,
  'Embárcate en un lujoso crucero por Dubai y descubre la opulencia y el encanto de esta ciudad de los Emiratos Árabes Unidos. Disfruta de las vistas impresionantes del horizonte de rascacielos, las playas doradas y los lujosos complejos turísticos. Explora las maravillas modernas como el Burj Khalifa, el Burj Al Arab y el Palm Jumeirah. A bordo del crucero, te deleitarás con una deliciosa gastronomía, relajantes spas y una amplia variedad de entretenimiento y actividades.' AS descripcion,
  'Dubai' AS puerto_de_salida,
  'Dubai' AS puerto_de_llegada,
  '2023-10-01' AS fecha_de_salida,
  '2023-10-10' AS fecha_de_llegada,
   imagenes.imagen AS imagen,
  tipos.tipo_id
FROM
  (SELECT 1 AS tipo_id UNION ALL
   SELECT 2 AS tipo_id UNION ALL
   SELECT 3 AS tipo_id UNION ALL
   SELECT 4 AS tipo_id UNION ALL
   SELECT 5 AS tipo_id UNION ALL
   SELECT 6 AS tipo_id) tipos
JOIN
  (SELECT 1 AS tipo_id, '/ruta/de/imagen1' AS imagen UNION ALL
   SELECT 2 AS tipo_id, '/ruta/de/imagen2' AS imagen UNION ALL
   SELECT 3 AS tipo_id, '/ruta/de/imagen3' AS imagen UNION ALL
   SELECT 4 AS tipo_id, '/ruta/de/imagen4' AS imagen UNION ALL
   SELECT 5 AS tipo_id, '/ruta/de/imagen5' AS imagen UNION ALL
   SELECT 6 AS tipo_id, '/ruta/de/imagen6' AS imagen) imagenes
ON tipos.tipo_id = imagenes.tipo_id
ORDER BY RAND();
 

 







INSERT INTO Crucero (nombre, destino, descripcion, puerto_de_salida, puerto_de_llegada, fecha_de_salida, fecha_de_llegada, imagen, 
tipo_id)
SELECT 
  'Crucero Egipto' AS nombre,
  'Egipto' AS destino,
  'Embárcate en un fascinante crucero por Egipto y descubre los tesoros antiguos de esta tierra llena de historia y misterio. Explora los impresionantes templos de Luxor y Karnak, navega por el majestuoso río Nilo y maravíllate con las pirámides de Giza y la Esfinge. Sumérgete en la rica cultura egipcia mientras visitas los mercados locales y disfrutas de la gastronomía tradicional. A bordo del crucero, disfrutarás de comodidades de lujo, entretenimiento en vivo y una experiencia inolvidable en una de las civilizaciones más antiguas del mundo.' AS descripcion,
  'Luxor' AS puerto_de_salida,
  'Asuán' AS puerto_de_llegada,
  '2023-11-01' AS fecha_de_salida,
  '2023-11-10' AS fecha_de_llegada,
   imagenes.imagen AS imagen,
  tipos.tipo_id
FROM
  (SELECT 1 AS tipo_id UNION ALL
   SELECT 2 AS tipo_id UNION ALL
   SELECT 3 AS tipo_id UNION ALL
   SELECT 4 AS tipo_id UNION ALL
   SELECT 5 AS tipo_id UNION ALL
   SELECT 6 AS tipo_id) tipos
JOIN
  (SELECT 1 AS tipo_id, '/ruta/de/imagen1' AS imagen UNION ALL
   SELECT 2 AS tipo_id, '/ruta/de/imagen2' AS imagen UNION ALL
   SELECT 3 AS tipo_id, '/ruta/de/imagen3' AS imagen UNION ALL
   SELECT 4 AS tipo_id, '/ruta/de/imagen4' AS imagen UNION ALL
   SELECT 5 AS tipo_id, '/ruta/de/imagen5' AS imagen UNION ALL
   SELECT 6 AS tipo_id, '/ruta/de/imagen6' AS imagen) imagenes
ON tipos.tipo_id = imagenes.tipo_id
ORDER BY RAND();
 

 







INSERT INTO Crucero (nombre, destino, descripcion, puerto_de_salida, puerto_de_llegada, fecha_de_salida, fecha_de_llegada, imagen, 
tipo_id)
SELECT 
  'Crucero Sudáfrica' AS nombre,
  'Sudáfrica' AS destino,
  'Embárcate en un emocionante crucero por Sudáfrica y descubre la belleza de este país fascinante. Explora la vida silvestre en los famosos parques nacionales, como el Parque Nacional Kruger, admira los paisajes impresionantes de la Ruta Jardín y sumérgete en la cultura vibrante de ciudades como Ciudad del Cabo y Johannesburgo. Disfruta de experiencias únicas como avistar animales en su hábitat natural y degustar la deliciosa gastronomía local. A bordo del crucero, relájate y disfruta de todas las comodidades mientras navegas por la costa sudafricana.' AS descripcion,
  'Ciudad del Cabo' AS puerto_de_salida,
  'Durban' AS puerto_de_llegada,
  '2023-12-01' AS fecha_de_salida,
  '2023-12-10' AS fecha_de_llegada,
   imagenes.imagen AS imagen,
  tipos.tipo_id
FROM
  (SELECT 1 AS tipo_id UNION ALL
   SELECT 2 AS tipo_id UNION ALL
   SELECT 3 AS tipo_id UNION ALL
   SELECT 4 AS tipo_id UNION ALL
   SELECT 5 AS tipo_id UNION ALL
   SELECT 6 AS tipo_id) tipos
JOIN
  (SELECT 1 AS tipo_id, '/ruta/de/imagen1' AS imagen UNION ALL
   SELECT 2 AS tipo_id, '/ruta/de/imagen2' AS imagen UNION ALL
   SELECT 3 AS tipo_id, '/ruta/de/imagen3' AS imagen UNION ALL
   SELECT 4 AS tipo_id, '/ruta/de/imagen4' AS imagen UNION ALL
   SELECT 5 AS tipo_id, '/ruta/de/imagen5' AS imagen UNION ALL
   SELECT 6 AS tipo_id, '/ruta/de/imagen6' AS imagen) imagenes
ON tipos.tipo_id = imagenes.tipo_id
ORDER BY RAND();
 

 







INSERT INTO Crucero (nombre, destino, descripcion, puerto_de_salida, puerto_de_llegada, fecha_de_salida, fecha_de_llegada, imagen, 
tipo_id)
SELECT 
  'Crucero Asia' AS nombre,
  'Asia' AS destino,
  'Embárcate en un inolvidable crucero por Asia y explora la riqueza cultural y los impresionantes paisajes de esta región diversa. Descubre las antiguas maravillas de China, la exótica belleza de Tailandia, la modernidad de Singapur y mucho más. Visita templos sagrados, saborea la deliciosa comida local y disfruta de la hospitalidad asiática. A bordo del crucero, podrás disfrutar de lujosas instalaciones, entretenimiento en vivo y vistas panorámicas mientras navegas por los mares asiáticos.' AS descripcion,
  'Hong Kong' AS puerto_de_salida,
  'Tokio' AS puerto_de_llegada,
  '2024-01-01' AS fecha_de_salida,
  '2024-01-10' AS fecha_de_llegada,
   imagenes.imagen AS imagen,
  tipos.tipo_id
FROM
  (SELECT 1 AS tipo_id UNION ALL
   SELECT 2 AS tipo_id UNION ALL
   SELECT 3 AS tipo_id UNION ALL
   SELECT 4 AS tipo_id UNION ALL
   SELECT 5 AS tipo_id UNION ALL
   SELECT 6 AS tipo_id) tipos
JOIN
  (SELECT 1 AS tipo_id, '/ruta/de/imagen1' AS imagen UNION ALL
   SELECT 2 AS tipo_id, '/ruta/de/imagen2' AS imagen UNION ALL
   SELECT 3 AS tipo_id, '/ruta/de/imagen3' AS imagen UNION ALL
   SELECT 4 AS tipo_id, '/ruta/de/imagen4' AS imagen UNION ALL
   SELECT 5 AS tipo_id, '/ruta/de/imagen5' AS imagen UNION ALL
   SELECT 6 AS tipo_id, '/ruta/de/imagen6' AS imagen) imagenes
ON tipos.tipo_id = imagenes.tipo_id
ORDER BY RAND();
 

 







INSERT INTO Crucero (nombre, destino, descripcion, puerto_de_salida, puerto_de_llegada, fecha_de_salida, fecha_de_llegada, imagen, 
tipo_id)
SELECT 
  'Crucero Sudamérica' AS nombre,
  'Sudamérica' AS destino,
  'Embárcate en un increíble crucero por Sudamérica y descubre la diversidad y la belleza de este continente fascinante. Explora la selva amazónica en Brasil, visita las famosas playas de Copacabana en Río de Janeiro, maravíllate con las majestuosas cataratas del Iguazú en Argentina y explora la encantadora ciudad de Valparaíso en Chile. Disfruta de la exquisita gastronomía, la música y el baile de diferentes culturas mientras navegas por los mares de Sudamérica. A bordo del crucero, relájate y disfruta de todas las comodidades y entretenimiento que ofrece.' AS descripcion,
  'Buenos Aires' AS puerto_de_salida,
  'Santiago de Chile' AS puerto_de_llegada,
  '2024-02-01' AS fecha_de_salida,
  '2024-02-10' AS fecha_de_llegada,
   imagenes.imagen AS imagen,
  tipos.tipo_id
FROM
  (SELECT 1 AS tipo_id UNION ALL
   SELECT 2 AS tipo_id UNION ALL
   SELECT 3 AS tipo_id UNION ALL
   SELECT 4 AS tipo_id UNION ALL
   SELECT 5 AS tipo_id UNION ALL
   SELECT 6 AS tipo_id) tipos
JOIN
  (SELECT 1 AS tipo_id, '/ruta/de/imagen1' AS imagen UNION ALL
   SELECT 2 AS tipo_id, '/ruta/de/imagen2' AS imagen UNION ALL
   SELECT 3 AS tipo_id, '/ruta/de/imagen3' AS imagen UNION ALL
   SELECT 4 AS tipo_id, '/ruta/de/imagen4' AS imagen UNION ALL
   SELECT 5 AS tipo_id, '/ruta/de/imagen5' AS imagen UNION ALL
   SELECT 6 AS tipo_id, '/ruta/de/imagen6' AS imagen) imagenes
ON tipos.tipo_id = imagenes.tipo_id
ORDER BY RAND();
 

 









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
  Crucero;

INSERT INTO camarotes (nombre, descripcion, tipo_de_cama, precio, cantidad_disponible, crucero_id)
SELECT
  'Camarote Interior' AS nombre,
  'Camarote económico sin vista al mar' AS descripcion,
  'Cama Individual' AS tipo_de_cama,
  300.00 AS precio,
  20 AS cantidad_disponible,
  id AS crucero_id
FROM
  Crucero;

INSERT INTO camarotes (nombre, descripcion, tipo_de_cama, precio, cantidad_disponible, crucero_id)
SELECT
  'Camarote Balcón' AS nombre,
  'Camarote con balcón privado' AS descripcion,
  'Cama King' AS tipo_de_cama,
  700.00 AS precio,
  5 AS cantidad_disponible,
  id AS crucero_id
FROM
  Crucero;


-- Insertar datos en la tabla Servicios
INSERT INTO servicios (nombre, descripcion, precio)
VALUES
  ('Paquete Todo Incluido', 'Disfruta de comidas y bebidas ilimitadas a bordo', 200.00),
  ('Masaje Spa', 'Relájate con un masaje en nuestro spa de lujo', 100.00),
  ('Excursión en Tierra', 'Explora destinos emocionantes en nuestras excursiones en tierra', 50.00);

-- Insertar datos en la tabla ServiciosCrucero
INSERT INTO ServiciosCrucero (crucero_id, servicio_id)
SELECT c.id, s.id
FROM Crucero c, servicios s;


-- Usuario admin
INSERT INTO user (email, password, roles)
VALUES ('admin@example.com', SHA2('123456789', 256), 'admin');



--
-- Volcado de datos para la tabla `crucero`
--

INSERT INTO `crucero` (`id`, `nombre`, `destino`, `descripcion`, `puerto_de_salida`, `puerto_de_llegada`, `fecha_de_salida`, `fecha_de_llegada`, `tipo_id`, `imagen`) VALUES
(1, 'Crucero Mediterráneo', 'Mediterráneo', 'Nuestro crucero especialmente diseñado para jóvenes ofrece una experiencia inolvidable en el hermoso mar Mediterráneo. Únete a nosotros y disfruta de una combinación perfecta de diversión, entretenimiento y exploración.', 'Barcelona', 'Roma', '2023-06-01', '2023-06-10', 6, '../images/cruceros/mediterraneo-jovenes.jpg'),
(2, 'Crucero Mediterráneo', 'Mediterráneo', 'Nuestro crucero tiene la combinación perfecta de diversión, romance y descubrimiento. Te invitamos a unirte a nosotros en un viaje lleno de emociones con otros solteros que comparten tus mismos intereses y pasiones.', 'Barcelona', 'Roma', '2023-06-01', '2023-06-10', 3, '../images/cruceros/mediterraneo-solteros.jpg'),
(3, 'Crucero Mediterráneo', 'Mediterráneo', 'Embárcate en una experiencia inolvidable junto a tu ser amado mientras navegamos por las aguas cristalinas del Mediterráneo. Disfruta de momentos de intimidad y conexión en un entorno idílico y romántico.', 'Barcelona', 'Roma', '2023-06-01', '2023-06-10', 1, '../images/cruceros/mediterraneo-pareja.jpg'),
(4, 'Crucero Mediterráneo', 'Mediterráneo', 'Experiencia tranquila y relajante, perfecta para aquellos que desean explorar esta región icónica con comodidad y en un ambiente acogedor. Disfrutaras de la paz y la belleza de destinos fascinantes.', 'Barcelona', 'Roma', '2023-06-01', '2023-06-10', 5, '../images/cruceros/mediterraneo-tercera.jpg'),
(5, 'Crucero Mediterráneo', 'Mediterráneo', 'Nuestro crucero en el Mediterráneo celebra la igualdad, la diversidad y el amor en todas sus formas. Te invitamos a embarcarte en un viaje único en el que podrás disfrutar de destinos increíbles mientras te rodeas de una comunidad inclusiva y vibrante.', 'Barcelona', 'Roma', '2023-06-01', '2023-06-10', 4, '../images/cruceros/mediterraneo-lgtbi.jpg'),
(6, 'Crucero Mediterráneo', 'Mediterráneo', 'Nuestro crucero en el Mediterráneo ofrece una experiencia divertida y emocionante para toda la familia. Te invitamos a embarcarte en un viaje lleno de aventuras, entretenimiento y momentos compartidos que crearán recuerdos inolvidables.', 'Barcelona', 'Roma', '2023-06-01', '2023-06-10', 2, '../images/cruceros/mediterraneo-familia.jpg'),
(8, 'Crucero Caribe', 'Caribe', 'Nuestro crucero en el Caribe te brindará la oportunidad de relajarte y disfrutar de la belleza tropical de la región en un ambiente tranquilo y acogedor. Te invitamos a unirte a nosotros en un viaje diseñado para satisfacer las necesidades.', 'Miami', 'Cozumel', '2023-07-01', '2023-07-10', 5, '../images/cruceros/caribe-tercera.jpg'),
(9, 'Crucero Caribe', 'Caribe', 'Nuestro crucero en el Caribe celebra la diversidad, la igualdad y el amor en todas sus formas. Te invitamos a unirte a nosotros en un viaje lleno de alegría, diversión y conexión con la comunidad LGTBI+ en uno de los destinos más hermosos del mundo.', 'Miami', 'Cozumel', '2023-07-01', '2023-07-10', 4, '../images/cruceros/caribe-lgtbi.jpg'),
(10, 'Crucero Caribe', 'Caribe', 'Nuestro crucero en el Caribe para solteros te ofrece la oportunidad de conocer a personas interesantes, disfrutar de increíbles destinos tropicales y vivir momentos inolvidables en un ambiente lleno de diversión y compañerismo.', 'Miami', 'Cozumel', '2023-07-01', '2023-07-10', 3, '../images/cruceros/caribe-solteros.jpg'),
(11, 'Crucero Caribe', 'Caribe', 'Nuestro crucero en el Caribe ofrece una experiencia perfecta para parejas que buscan relajarse, disfrutar del romance y crear recuerdos inolvidables juntos. Te invitamos a sumergirte en la belleza tropical del Caribe mientras disfrutas de un ambiente íntimo y romántico.', 'Miami', 'Cozumel', '2023-07-01', '2023-07-10', 1, '../images/cruceros/caribe-pareja.jpg'),
(12, 'Crucero Caribe', 'Caribe', 'Nuestro crucero en el Caribe para adolescentes ofrece una experiencia emocionante y llena de actividades para jóvenes que buscan divertirse y hacer nuevos amigos. Te invitamos a embarcarte en una aventura tropical llena de diversión, entretenimiento y emocionantes experiencias.', 'Miami', 'Cozumel', '2023-07-01', '2023-07-10', 6, '../images/cruceros/caribe-jovenes.jpg'),
(13, 'Crucero Caribe', 'Caribe', 'Nuestro crucero en el Caribe ofrece una experiencia divertida y emocionante para toda la familia. Te invitamos a disfrutar de un viaje lleno de diversión, entretenimiento y momentos compartidos que crearán recuerdos inolvidables.', 'Miami', 'Cozumel', '2023-07-01', '2023-07-10', 2, '../images/cruceros/caribe-familia.jpg'),
(15, 'Crucero Norte de Europa', 'Norte de Europa', 'Nuestro crucero en el Norte de Europa para solteros te ofrece la oportunidad de explorar algunos de los destinos más fascinantes de la región mientras conoces a nuevas personas y disfrutas de experiencias inolvidables.', 'Copenhague', 'Estocolmo', '2023-08-01', '2023-08-10', 3, '../images/cruceros/norte-solteros.jpg'),
(16, 'Crucero Norte de Europa', 'Norte de Europa', 'Nuestro crucero en el Norte de Europa ofrece una experiencia única y divertida para toda la familia. Te invitamos a descubrir la belleza natural, la historia y la cultura de esta fascinante región mientras disfrutas de momentos inolvidables en compañía de tus seres queridos.', 'Copenhague', 'Estocolmo', '2023-08-01', '2023-08-10', 2, '../images/cruceros/norte-familia.jpg'),
(17, 'Crucero Norte de Europa', 'Norte de Europa', 'Nuestro crucero en el Norte de Europa ofrece una experiencia inolvidable para parejas que desean explorar la belleza natural, la historia y la cultura de esta fascinante región mientras disfrutan de momentos románticos juntos.', 'Copenhague', 'Estocolmo', '2023-08-01', '2023-08-10', 1, '../images/cruceros/norte-pareja.jpg'),
(18, 'Crucero Norte de Europa', 'Norte de Europa', 'Nuestro crucero en el Norte de Europa LGTBI+ te invita a explorar esta hermosa región mientras celebras la diversidad, la igualdad y el amor en todas sus formas. Te ofrecemos un ambiente seguro, acogedor y libre de prejuicios donde podrás ser tú mismo/a y disfrutar de una experiencia única junto a otros miembros de la comunidad LGTBI+.', 'Copenhague', 'Estocolmo', '2023-08-01', '2023-08-10', 4, '../images/cruceros/norte-lgtbi.jpg'),
(19, 'Crucero Norte de Europa', 'Norte de Europa', 'Nuestro crucero en el Norte de Europa para la tercera edad te ofrece la oportunidad de descubrir la belleza y la historia de esta fascinante región en un ambiente tranquilo y en compañía de personas de ideas afines.', 'Copenhague', 'Estocolmo', '2023-08-01', '2023-08-10', 5, '../images/cruceros/norte-tercera.jpg'),
(20, 'Crucero Norte de Europa', 'Norte de Europa', 'Nuestro crucero en el Norte de Europa para adolescentes te ofrece la oportunidad de explorar destinos fascinantes, sumergirte en la cultura y la historia de la región y disfrutar de experiencias inolvidables junto a otros jóvenes de tu edad.', 'Copenhague', 'Estocolmo', '2023-08-01', '0000-00-00', 6, '../images/cruceros/norte-jovenes.jpg'),
(22, 'Crucero Alaska', 'Alaska', 'Alaska es conocida por su impresionante belleza natural, sus paisajes majestuosos y su rica vida salvaje. Además, este destino acoge a viajeros de todas las orientaciones sexuales e identidades de género, ofreciendo un ambiente seguro y acogedor para la comunidad LGTBI+.', 'Seattle', 'Anchorage', '2023-09-01', '2023-09-10', 4, '../images/cruceros/alaska-lgtbi.jpg'),
(23, 'Crucero Alaska', 'Alaska', 'Alaska ofrece paisajes impresionantes y románticos, desde majestuosos glaciares hasta puestas de sol sobre montañas nevadas. Puedes disfrutar de excursiones en kayak por fiordos, avistamiento de ballenas y cenas románticas a bordo de cruceros con vista al mar.', 'Seattle', 'Anchorage', '2023-09-01', '2023-09-10', 1, '../images/cruceros/alaska-pareja.jpg'),
(24, 'Crucero Alaska', 'Alaska', 'Alaska es un paraíso natural lleno de aventuras. Pueden explorar parques nacionales, caminar por senderos escénicos, avistar osos y águilas calvas, y participar en actividades como paseos en trineo de perros y pesca en alta mar.', 'Seattle', 'Anchorage', '2023-09-01', '2023-09-10', 2, '../images/cruceros/alaska-familia.jpg'),
(25, 'Crucero Alaska', 'Alaska', 'Alaska brinda la oportunidad de disfrutar de un ritmo más relajado y contemplar la belleza natural de la región. Pueden realizar excursiones panorámicas en autobús, visitar museos y centros culturales, y deleitarse con la tranquilidad de los paisajes impresionantes.', 'Seattle', 'Anchorage', '2023-09-01', '2023-09-10', 5, '../images/cruceros/alaska-tercera.jpg'),
(26, 'Crucero Alaska', 'Alaska', 'Alaska ofrece emocionantes experiencias al aire libre, como caminatas por glaciares, kayak en aguas tranquilas y avistamiento de vida silvestre. También pueden disfrutar de actividades divertidas a bordo del crucero, como juegos, fiestas en la cubierta y talleres interactivos.', 'Seattle', 'Anchorage', '2023-09-01', '2023-09-10', 6, '../images/cruceros/alaska-jovenes.jpg'),
(27, 'Crucero Alaska', 'Alaska', 'Alaska ofrece una gran variedad de experiencias emocionantes y oportunidades de conocer gente nueva para los viajeros solteros. Durante tu crucero por Alaska, tendrás la oportunidad de disfrutar de la belleza natural de la región mientras socializas y te diviertes con otros viajeros solteros.', 'Seattle', 'Anchorage', '2023-09-01', '2023-09-10', 3, '../images/cruceros/alaska-solteros.jpg'),
(29, 'Crucero Dubai', 'Dubai', 'Dubai es un destino ideal para familias, repleto de emocionantes atracciones y actividades que garantizan diversión para todas las edades. Aquí encontrarás una combinación perfecta entre modernidad y tradición, creando un entorno único para disfrutar de unas vacaciones en familia.', 'Dubai', 'Dubai', '2023-10-01', '2023-10-10', 2, '../images/cruceros/dubai-familia.jpg'),
(30, 'Crucero Dubai', 'Dubai', 'Dubai es un destino vibrante y emocionante que ofrece numerosas oportunidades para socializar, divertirse y conocer gente nueva. Con su arquitectura impresionante, playas de arena blanca y una vida nocturna animada, Dubai es el lugar perfecto para la comunidad LGTBI+.', 'Dubai', 'Dubai', '2023-10-01', '2023-10-10', 4, '../images/cruceros/dubai-lgtbi.jpg'),
(31, 'Crucero Dubai', 'Dubai', 'Dubai es un destino perfecto para parejas que buscan una escapada inolvidable llena de lujo, sofisticación y aventura. Aquí encontrarás una combinación única de paisajes deslumbrantes, arquitectura impresionante y una amplia gama de experiencias exclusivas para disfrutar juntos.', 'Dubai', 'Dubai', '2023-10-01', '2023-10-10', 1, '../images/cruceros/dubai-pareja.jpg'),
(32, 'Crucero Dubai', 'Dubai', 'Dubai ofrece una amplia variedad de actividades y atracciones emocionantes para jóvenes viajeros. Desde deportes extremos y actividades al aire libre hasta vibrantes lugares de entretenimiento y compras, hay algo para cada gusto y estilo en esta increíble ciudad.', 'Dubai', 'Dubai', '2023-10-01', '2023-10-10', 6, '../images/cruceros/dubai-jovenes.jpg'),
(33, 'Crucero Dubai', 'Dubai', 'Dubai ofrece una gran cantidad de actividades y experiencias que son adecuadas y agradables para adultos mayores. Desde recorridos panorámicos en autobús y paseos por la playa hasta visitas a museos y centros culturales, hay algo para todos los intereses y niveles de energía.', 'Dubai', 'Dubai', '2023-10-01', '2023-10-10', 5, '../images/cruceros/dubai-tercera.jpg'),
(34, 'Crucero Dubai', 'Dubai', 'Dubai es un destino vibrante y emocionante que ofrece numerosas oportunidades para socializar, divertirse y conocer gente nueva. Con su arquitectura impresionante, playas de arena blanca y una vida nocturna animada, Dubai es el lugar perfecto para solteros que buscan vivir experiencias únicas y emocionantes.', 'Dubai', 'Dubai', '2023-10-01', '2023-10-10', 3, '../images/cruceros/dubai-solteros.jpg'),
(36, 'Crucero Egipto', 'Egipto', 'Egipto es un destino educativo y emocionante. Los niños pueden aprender sobre la antigua civilización egipcia visitando el Museo Egipcio de El Cairo y explorando las tumbas del Valle de los Reyes en Luxor. Además, pueden disfrutar de actividades al aire libre como montar en camello y realizar un safari en el desierto.', 'Luxor', 'Asuán', '2023-11-01', '2023-11-10', 2, '../images/cruceros/egipto-familia.jpg'),
(37, 'Crucero Egipto', 'Egipto', 'Egipto es un país con una rica historia y una cultura fascinante que acoge a viajeros de todas las orientaciones sexuales e identidades de género. Si eres parte de la comunidad LGTBI+, encontrarás que Egipto ofrece una experiencia única y acogedora.', 'Luxor', 'Asuán', '2023-11-01', '2023-11-10', 4, '../images/cruceros/egipto-lgtbi.jpg'),
(38, 'Crucero Egipto', 'Egipto', 'Egipto ofrece una mezcla única de cultura, historia y diversión. Pueden explorar los zocos de El Cairo, visitar los coloridos mercados de especias y disfrutar de la animada vida nocturna de la ciudad.', 'Luxor', 'Asuán', '2023-11-01', '2023-11-10', 3, '../images/cruceros/egipto-solteros.jpg'),
(39, 'Crucero Egipto', 'Egipto', 'Egipto ofrece un ambiente romántico y místico. Pueden disfrutar de un crucero por el Nilo, explorar los templos antiguos de Luxor y Karnak, y maravillarse con las pirámides de Giza al atardecer.', 'Luxor', 'Asuán', '2023-11-01', '2023-11-10', 1, '../images/cruceros/egipto-pareja.jpg'),
(40, 'Crucero Egipto', 'Egipto', 'Egipto es un destino perfecto para los viajeros de la tercera edad que desean sumergirse en la rica historia y cultura de esta antigua tierra. Aquí encontrarás una combinación única de fascinantes monumentos, paisajes impresionantes y una hospitalidad cálida que te hará sentir bienvenido.', 'Luxor', 'Asuán', '2023-11-01', '2023-11-10', 5, '../images/cruceros/egipto-tercera.jpg'),
(41, 'Crucero Egipto', 'Egipto', 'Egipto ofrece una gran variedad de experiencias emocionantes y atracciones fascinantes para los viajeros jóvenes. Desde explorar los antiguos templos y pirámides hasta navegar por el Nilo y sumergirse en la rica cultura egipcia, hay algo para todos los gustos y estilos de viaje.', 'Luxor', 'Asuán', '2023-11-01', '2023-11-10', 6, '../images/cruceros/egipto-jovenes.jpg'),
(43, 'Crucero Sudáfrica', 'Sudáfrica', 'Sudáfrica ofrece una amplia gama de experiencias emocionantes. Podrás disfrutar de safaris fotográficos en los parques nacionales, practicar surf en las playas de la costa sur y explorar la rica historia y cultura de Sudáfrica en lugares como Soweto y Robben Island.', 'Ciudad del Cabo', 'Durban', '2023-12-01', '2023-12-10', 6, '../images/cruceros/sudafrica-jovenes.jpg'),
(44, 'Crucero Sudáfrica', 'Sudáfrica', 'Sudáfrica ofrece románticos paisajes naturales, como el impresionante Cabo de Buena Esperanza y la hermosa Ruta Jardín. Podrás disfrutar de paseos en la playa al atardecer, degustar vinos en las bodegas del Cabo y explorar la vibrante ciudad de Ciudad del Cabo.', 'Ciudad del Cabo', 'Durban', '2023-12-01', '2023-12-10', 1, '../images/cruceros/sudafrica-pareja.jpg'),
(45, 'Crucero Sudáfrica', 'Sudáfrica', 'Sudáfrica tiene una vida nocturna vibrante y emocionante en ciudades como Johannesburgo y Ciudad del Cabo, donde puedes disfrutar de bares, restaurantes y clubes nocturnos de clase mundial. Además, puedes participar en actividades al aire libre como el surf, el senderismo y el paracaidismo.', 'Ciudad del Cabo', 'Durban', '2023-12-01', '2023-12-10', 3, '../images/cruceros/sudafrica-solteros.jpg'),
(46, 'Crucero Sudáfrica', 'Sudáfrica', ' Sudáfrica ofrece emocionantes safaris en los parques nacionales, donde podrás ver de cerca a los \"cinco grandes\" (leones, elefantes, rinocerontes, búfalos y leopardos) y aprender sobre la fauna y flora local.', 'Ciudad del Cabo', 'Durban', '2023-12-01', '2023-12-10', 2, '../images/cruceros/sudafrica-familia.jpg'),
(47, 'Crucero Sudáfrica', 'Sudáfrica', 'Sudáfrica ofrece una gran cantidad de actividades y experiencias relajantes y culturales que son perfectas para los viajeros de la tercera edad. Desde impresionantes paisajes naturales hasta rica historia y cultura, Sudáfrica tiene mucho que ofrecer.', 'Ciudad del Cabo', 'Durban', '2023-12-01', '2023-12-10', 5, '../images/cruceros/sudafrica-tercera.jpg'),
(48, 'Crucero Sudáfrica', 'Sudáfrica', 'Sudáfrica es conocida por ser uno de los países más progresistas de África en términos de derechos LGBTI+. La Constitución de Sudáfrica garantiza la igualdad y la no discriminación, lo que hace que el país sea un destino acogedor para viajeros de la comunidad LGBTI+.\r\n\r\n', 'Ciudad del Cabo', 'Durban', '2023-12-01', '2023-12-10', 4, '../images/cruceros/sudafrica-lgtbi.jpg'),
(50, 'Crucero Asia', 'Asia', 'Ofrecemos aventuras emocionantes, playas de arena blanca y una vibrante escena de fiesta. Puedes disfrutar de deportes acuáticos, explorar templos antiguos y sumergirte en la cultura local.', 'Hong Kong', 'Tokio', '2024-01-01', '2024-01-10', 6, '../images/cruceros/asia-jovenes.jpg'),
(51, 'Crucero Asia', 'Asia', 'Paisajes impresionantes, playas paradisíacas y una atmósfera romántica que te permitirá disfrutar de momentos inolvidables juntos.', 'Hong Kong', 'Tokio', '2024-01-01', '2024-01-10', 1, '../images/cruceros/asia-pareja.jpg'),
(52, 'Crucero Asia', 'Asia', 'Hong Kong ofrece una gran variedad de actividades y atracciones para todas las edades. Puedes explorar parques temáticos, visitar zoológicos y acuarios, y disfrutar de la deliciosa cocina asiática.', 'Hong Kong', 'Tokio', '2024-01-01', '2024-01-10', 2, '../images/cruceros/asia-familia.jpg'),
(53, 'Crucero Asia', 'Asia', 'Asia es un destino acogedor para viajeros de la comunidad LGBTI+, con destinos y ciudades que ofrecen una vibrante escena LGBTI+ y una actitud de tolerancia y respeto hacia la diversidad.', 'Hong Kong', 'Tokio', '2024-01-01', '2024-01-10', 4, '../images/cruceros/asia-lgtbi.jpg'),
(54, 'Crucero Asia', 'Asia', 'Asia ofrece una gran cantidad de destinos y actividades adaptadas a los viajeros de la tercera edad que desean explorar y disfrutar de la cultura, la historia y la belleza natural de la región.', 'Hong Kong', 'Tokio', '2024-01-01', '2024-01-10', 5, '../images/cruceros/asia-tercera.jpg'),
(55, 'Crucero Asia', 'Asia', 'Vida nocturna vibrante, restaurantes de moda y una amplia gama de opciones de entretenimiento. También puedes participar en actividades emocionantes como el buceo, el senderismo y el ciclismo.', 'Hong Kong', 'Tokio', '2024-01-01', '2024-01-10', 3, '../images/cruceros/asia-solteros.jpg'),
(57, 'Crucero Sudamérica', 'Sudamérica', 'Sudamérica es un destino cada vez más abierto y amigable para la comunidad LGBTI+. Varios países de la región han promulgado leyes que protegen los derechos de las personas LGBTI+ y cuentan con una vibrante escena LGBTI+ en muchas de sus ciudades.', 'Buenos Aires', 'Santiago de Chile', '2024-02-01', '2024-02-10', 4, '../images/cruceros/sudamerica-lgtbi.jpg'),
(58, 'Crucero Sudamérica', 'Sudamérica', 'Sudamérica ofrece una gran variedad de destinos y actividades adaptadas a los viajeros de la tercera edad que desean explorar y disfrutar de la cultura, la historia y la belleza natural de la región.', 'Buenos Aires', 'Santiago de Chile', '2024-02-01', '2024-02-10', 5, '../images/cruceros/sudamerica-tercera.jpg'),
(59, 'Crucero Sudamérica', 'Sudamérica', 'Vida nocturna vibrante, una escena de fiesta emocionante y una amplia gama de opciones de entretenimiento. También puedes participar en actividades al aire libre como el trekking en la Patagonia o el surf en las playas de Ecuador.', 'Buenos Aires', 'Santiago de Chile', '2024-02-01', '2024-02-10', 3, '../images/cruceros/sudamerica-solteros.jpg'),
(60, 'Crucero Sudamérica', 'Sudamérica', 'Combinación de encanto histórico, playas espectaculares y una vibrante vida nocturna que te permitirá disfrutar de momentos inolvidables juntos.', 'Buenos Aires', 'Santiago de Chile', '2024-02-01', '2024-02-10', 1, '../images/cruceros/sudamerica-pareja.jpg'),
(61, 'Crucero Sudamérica', 'Sudamérica', 'Combinación de historia, cultura y vida urbana vibrante. Podrás explorar museos, probar deliciosa comida local y sumergirte en la vida nocturna de estas ciudades.', 'Buenos Aires', 'Santiago de Chile', '2024-02-01', '2024-02-10', 6, '../images/cruceros/sudamerica-jovenes.jpg'),
(62, 'Crucero Sudamérica', 'Sudamérica', 'Gran variedad de actividades y atracciones para todas las edades. Podrás explorar antiguas ruinas, disfrutar de paisajes impresionantes y sumergirte en la cultura local.', 'Buenos Aires', 'Santiago de Chile', '2024-02-01', '2024-02-10', 2, '../images/cruceros/sudamerica-familia.jpg');

