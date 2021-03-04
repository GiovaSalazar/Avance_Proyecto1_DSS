-- Base de datos: `registro`
Use master 
go

Create Database registro
on 
(Name= registro_dat,
filename= 'c:\Registro_BDD\registro.mdf',
size =5,
maxsize=20,
FileGrowth=5
)
LOG ON
(NAME = registro_log,
filename= 'c:\Registro_BDD\registro.ldf',
size =2,
maxsize=10,
FileGrowth=2
);
GO

use registro
go


-- Estructura de tabla para la tabla `usuario`

CREATE TABLE usuario(
  IdUsuario int NOT NULL primary key,
  Nombre varchar(50) NOT NULL,
  Correo varchar(30) NOT NULL,
  Contraseña varchar(20) NOT NULL,
  Edad int NOT NULL)
  go

-- Estructura de tabla para la tabla `pelicula`

CREATE TABLE pelicula (
  IdPelicula int NOT NULL primary key,
  Título varchar(50) NOT NULL,
  Descripción text NOT NULL,
  Imagen image NOT NULL,
  Stock int NOT NULL,
  PrecioAlquiler money NOT NULL,
  PrecioOferta money NOT NULL,
  Disponibilidad varchar(12) NOT NULL,
  MeGusta int NOT NULL)
  go

  -- Estructura de tabla para la tabla `megusta`

CREATE TABLE megusta (
  IdPelicula int NOT NULL,
  IdUsuario int NOT NULL,
  constraint FK_idpelicula
   foreign key (IdPelicula)  references pelicula (IdPelicula),
   constraint FK_idusuario 
   foreign key (IdUsuario) references usuario (IdUsuario)
)
go

-- Estructura de tabla para la tabla `alquileres`

CREATE TABLE alquileres (
  IdPelicula int NOT NULL,
  IdUsuario int NOT NULL,
  FechaAlquiler date NOT NULL,
  constraint FK_peliculaid
  foreign KEY (IdPelicula) references pelicula (IdPelicula),
  constraint FK_usuarioid
  foreign KEY (IdUsuario) references usuario (IdUsuario))
  go

  -- Estructura de tabla para la tabla `compras`

CREATE TABLE compras (
  IdPelicula int NOT NULL,
  IdUsuario int NOT NULL,
  FechaCompra date NOT NULL,
  constraint FK_pelicula
  foreign KEY (IdPelicula) references pelicula (IdPelicula),
  constraint Fk_usuario
  foreign KEY (IdUsuario) references usuario (IdUsuario))
  go

  -- Estructura de tabla para la tabla `log`

CREATE TABLE logg (
  Titulo varchar(50) NOT NULL,
  PrecioAlquiler money NOT NULL,
  PrecioCompra money NOT NULL,
  IdUsuario int NOT NULL,
  IdPelicula int NOT NULL,
  constraint FK_UserId
  foreign KEY (IdUsuario) references usuario (IdUsuario),
  constraint FK_movieid
  foreign KEY (IdPelicula) references pelicula (IdPelicula))
  go

  --insertando registros en las tablas

  --tabla usuario

INSERT INTO usuario VALUES
(1, 'Wilman Flores', 'gerardo@gmail.com', '123456', 24),
(2, 'Stanley Navidad', 'stanley@gmail.com', '54321', 25),
(3, 'Giovanni Salazar', 'gio@gmail.com', 'contra123', 28),
(4, 'Kevin Perez', 'kevin@gmail.com', 'hola123', 18),
(5, 'Maria Hernandez', 'mary@gmail.com', 'maria123', 30),
(6, 'Julio Navarro', 'julio@gmail.com', '123457', 35),
(7, 'Andrea Martinez', 'martinez@gmail.com', 'andrea123', 21),
(8, 'Miguel Gonzalez', 'miguel@gmail.com', 'gonza1234', 19),
(9, 'Silvia Carranza', 'silvia12@gmail.com', 'silvia1234', 27),
(10, 'Jorge Acevedo', 'jorge@gmail.com', 'password123', 40)
go

--tabla pelicula

INSERT INTO pelicula VALUES
(1, 'Rápidos y furiosos 8', 'Cuando todos se han retirado del juego y el resto del equipo busca de una vida común y corriente; una misteriosa mujer intentará seducir a Dom para convencerlo de regresar a la vida criminal', '', 5, 7.99, 5.99, 'Disponible', 5),
(2, 'Venom', 'El periodista Eddie Brock está investigando a Carlton Drake, el célebre fundador de Life Foundation. Brock establece una simbiosis con un ente alienígena que le ofrece superpoderes, pero el ser se apodera de su personalidad y lo vuelve perverso', '', 6, 6.5, 4.99, 'Disponible', 3),
(3, 'Geo tormenta', 'Cuando la red de satélites diseñada para controlar el clima global empieza a fallar, un obstinado ingeniero de comunicaciones se ve obligado a trabajar junto a su hermano', '', 4, 6.75, 3.99, 'Disponible', 4),
(4, 'Joker', 'Arthur Fleck adora hacer reír a la gente, pero su carrera como comediante es un fracaso. El repudio social, la marginación y una serie de trágicos acontecimientos lo conducen por el sendero de la locura y, finalmente, cae en el mundo del crimen', '', 8, 8.99, 6.75, 'Disponible', 8),
(5, 'Jurassic World', 'Una nueva especie de dinosaurio, creada por los científicos de forma artificial y claramente más inteligente y peligrosa que los animales conocidos, ataca a los turistas que visitan el parque temático \"Jurassic World\", situado en una isla frente a Costa Rica', '', 7, 6.99, 5.5, 'Disponible', 3),
(6, 'Sonic la película', 'Sonic intenta atravesar las complejidades de la vida en la Tierra con su nuevo mejor amigo, un humano llamado Tom Wachowski. Deberán unir sus fuerzas para evitar que el malvado Dr. Robotnik capture a Sonic y use sus poderes para dominar el mundo', '', 6, 7, 4.75, 'Disponible', 6),
(7, 'Spider-Man: lejos de casa', 'Peter Parker decide pasar unas merecidas vacaciones en Europa junto a MJ, Ned y el resto de sus amigos. Sin embargo, Peter debe volver a ponerse el traje de Spider-Man cuando Nick Fury le encomienda una nueva misión: frenar el ataque de unas criaturas que están causando el caos en el continente', '', 5, 7.89, 6.8, 'Disponible', 7),
(8, 'Bob Esponja: al rescate', 'Bob Esponja y Patricio se embarcan en una aventura épica. Durante una misión heroica e hilarante para salvar a la mascota de Bob, el caracol Gary, descubren que nada es más fuerte que el poder de la amistad', '', 10, 8.95, 7.8, 'Disponible', 8),
(9, 'Minions', 'Los minions buscan un verdadero villano al que servir. A lo largo de una evolución de millones de años, los minions se han puesto al servicio de los amos más despreciables. Kevin, acompañado por el rebelde Stuart y el adorable Bob, emprende un emocionante viaje para conseguir una jefa a quien servir, la terrible Scarlet Overkill', '', 4, 6.8, 3.75, 'Disponible', 3),
(10, 'Eso', 'Varios niños de una pequeña ciudad del estado de Maine se alían para combatir a una entidad diabólica que adopta la forma de un payaso y desde hace mucho tiempo emerge cada 27 años para saciarse de sangre infantil', '', 7, 7.9, 4.75, 'Disponible', 9)
go


--tabla megusta

INSERT INTO megusta VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10)
go

--tabla alquileres

INSERT INTO alquileres VALUES
(5, 1, '2020-11-25'),
(6, 8, '2021-01-25'),
(1, 10, '2021-02-01'),
(8, 3, '2020-05-13'),
(10, 2, '2021-03-01'),
(7, 9, '2021-01-19'),
(3, 4, '2021-02-14'),
(2, 5, '2020-01-25'),
(9, 6, '2021-01-20'),
(10, 7, '2020-06-11')
go

-- tabla compras

INSERT INTO compras VALUES
(1, 4, '2021-01-19'),
(5, 3, '2021-01-19'),
(10, 1, '2021-02-01'),
(2, 10, '2020-01-19'),
(7, 2, '2020-12-01'),
(10, 10, '2021-02-27'),
(9, 2, '2021-01-30'),
(5, 9, '2020-08-02'),
(7, 1, '2020-07-15'),
(8, 8, '2021-03-02')
go

--tabla logg

INSERT INTO logg VALUES
('Rápidos y furiosos 8', 5.99, 3.99, 3, 1),
('Venom', 5.75, 3.99, 1, 2),
('Geo tormenta', 6, 2.99, 10, 3),
('Joker', 7.99, 5.5, 6, 4),
('Jurassic Word', 5, 3.5, 5, 5),
('Sonic la pelicula', 6.99, 3.99, 4, 6),
('Spider-Man lejos de casa', 7.5, 3.75, 8, 7),
('Bod Esponja al rescate', 7.5, 4.99, 2, 8),
('Minions', 6, 2, 9, 9),
('Eso', 6.75, 3.99, 7, 10)
go

--ALTER TABLE `alquileres`
  --ADD CONSTRAINT `alquileres_ibfk_1` FOREIGN KEY (`IdUsuario`) REFERENCES `usuario` (`IdUsuario`) ON UPDATE CASCADE,
  --ADD CONSTRAINT `alquileres_ibfk_2` FOREIGN KEY (`IdPelicula`) REFERENCES `pelicula` (`IdPelicula`) ON UPDATE CASCADE;
--
--ALTER TABLE `compras`
  --ADD CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`IdUsuario`) REFERENCES `usuario` (`IdUsuario`) ON UPDATE CASCADE,
  --ADD CONSTRAINT `compras_ibfk_2` FOREIGN KEY (`IdPelicula`) REFERENCES `pelicula` (`IdPelicula`) ON UPDATE CASCADE;

--
--ALTER TABLE `logg`
--  ADD CONSTRAINT `log_ibfk_1` FOREIGN KEY (`IdPelicula`) REFERENCES `pelicula` (`IdPelicula`) ON UPDATE CASCADE,
  --ADD CONSTRAINT `log_ibfk_2` FOREIGN KEY (`IdUsuario`) REFERENCES `usuario` (`IdUsuario`) ON UPDATE CASCADE;

--ALTER TABLE `megusta`
  --ADD CONSTRAINT `megusta_ibfk_1` FOREIGN KEY (`IdUsuario`) REFERENCES `usuario` (`IdUsuario`) ON UPDATE CASCADE,
  --ADD CONSTRAINT `megusta_ibfk_2` FOREIGN KEY (`IdPelicula`) REFERENCES `pelicula` (`IdPelicula`) ON UPDATE CASCADE;
--COMMIT;

--consulta de los registros de las tablas

select * from usuario;
select * from pelicula;
select * from megusta;
select * from alquileres;
select * from compras;
select * from logg;

