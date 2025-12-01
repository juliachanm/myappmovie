-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-11-2025 a las 18:35:01
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `movies_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movies`
--

CREATE TABLE `movies` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `director` varchar(255) DEFAULT NULL,
  `synopsis` text DEFAULT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `trailer_url` varchar(255) DEFAULT NULL,
  `year` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `movies`
--

INSERT INTO `movies` (`id`, `title`, `director`, `synopsis`, `cover`, `trailer_url`, `year`) VALUES
(1, 'Inception', 'Christopher Nolan', 'gira en torno a Dom Cobb, un ladrón experto que se infiltra en los sueños de las personas para robar sus secretos más valiosos. Se le ofrece una última oportunidad para borrar sus antecedentes penales y regresar a su familia, pero a cambio debe realizar la tarea opuesta: implantar una idea en la mente de un objetivo, una misión llamada \"incepción\" que es mucho más peligrosa y complicada.', 'uploads/1762496582_inception.jpg', 'https://www.youtube.com/watch?v=OCEkhKvm-hU', 2010),
(2, 'The Matrix', 'Lana & Lilly Wachowski', 'El programador informático Thomas Anderson, más conocido en el mundo de los \"hacker\" como Neo, está en el punto de mira del temible agente Smith. Otros dos piratas informáticos, Trinity y Morfeo, se ponen en contacto con Neo para ayudarlo a escapar. Matrix te posee. Sigue al conejo blanco.', 'uploads/1762499062_matrix.jpeg', 'https://www.youtube.com/watch?v=OM0tSTEQCQA', 1999),
(3, 'Interstellar', 'Christopher Nolan', 'Un grupo de científicos y exploradores, encabezados por Cooper, se embarcan en un viaje espacial para encontrar un lugar con las condiciones necesarias para reemplazar a la Tierra y comenzar una nueva vida allí. La Tierra está llegando a su fin y este grupo necesita encontrar un planeta más allá de nuestra galaxia que garantice el futuro de la raza humana.', 'uploads/1762501315_interestelar.jpeg', 'https://www.youtube.com/watch?v=zSWdZVtXT7E', 2014),
(4, 'Dune', 'Denis Villeneuve', 'Dune gira en torno a Paul Atreides, el joven heredero de la Casa Atreides, cuando su familia asume el control del planeta desértico Arrakis, el único lugar del universo que produce la valiosa especia \"melange\". Tras una traición que lleva a la caída de su casa, Paul debe sobrevivir en Arrakis y liderar una rebelión contra sus enemigos, los Harkonnen, mientras descubre un destino más grande para sí mismo.', 'uploads/1762501371_dune.jpeg', 'https://www.youtube.com/watch?v=qLSCkir1x60', 2021),
(7, 'Coco', 'Lee Unkrich', 'Es una película de animación y aventura sobre un niño llamado Miguel, que sueña con ser músico a pesar de la prohibición de la música en su familia. Tras ser transportado accidentalmente a la Tierra de los Muertos durante el Día de Muertos, busca a su tatarabuelo para volver con los vivos y descubrir los misterios de su familia.', 'uploads/1762501410_coco.jpeg', 'https://www.youtube.com/watch?v=9JZ1nVH-dzg', 2017),
(9, 'Animales Fantásticos: Los Secretos de Dumbledore', 'David Yates', 'El profesor Albus Dumbledore debe detener los planes del poderoso mago oscuro Gellert Grindelwald para tomar el control del mundo mágico. Incapaz de hacerlo solo, recluta a Newt Scamander para liderar un equipo de magos, brujas y un panadero muggle en una misión peligrosa que incluye encontrar y proteger a nuevas e increíbles criaturas y enfrentarse a los crecientes seguidores de Grindelwald.', 'uploads/1762754444_animfant.jpeg', 'https://www.youtube.com/watch?v=QfYgcLuxS5Y', 2022);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `movies`
--
ALTER TABLE `movies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
