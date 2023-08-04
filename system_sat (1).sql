-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-08-2023 a las 07:24:45
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `system_sat`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `campo_estudio`
--

CREATE TABLE `campo_estudio` (
  `idCampo_Estudio` int(11) NOT NULL,
  `Area` varchar(45) DEFAULT NULL,
  `Descripcion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `campo_estudio`
--

INSERT INTO `campo_estudio` (`idCampo_Estudio`, `Area`, `Descripcion`) VALUES
(1, 'Computación', 'Área relacionada con la informática, computacion, sistemas y tecnologías de la información.'),
(2, 'Ciencias Sociales', 'Área relacionada con el estudio de la sociedad, sus instituciones y relaciones sociales.'),
(3, 'Ciencias de la Salud', 'Área relacionada con el estudio y práctica de la medicina y la salud.'),
(4, 'Empresas y negocios', 'Área destinada al mundo de los negocios e inversiones admisnistrativas'),
(5, 'Diseño y cosntrucción', 'Área realcionada con la arquitectura proyecto, edificaciones entre otros.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrera`
--

CREATE TABLE `carrera` (
  `idCarrera` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Universidad` varchar(45) NOT NULL,
  `Descripción` tinytext NOT NULL,
  `Nivel` varchar(45) NOT NULL,
  `Área` varchar(45) NOT NULL,
  `idCampo_Estudio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `carrera`
--

INSERT INTO `carrera` (`idCarrera`, `Nombre`, `Universidad`, `Descripción`, `Nivel`, `Área`, `idCampo_Estudio`) VALUES
(101, 'Computación', 'Universidad Técnica Particular de Loja', 'Carrera de Computación con enfoque en ciencias de la computación y desarrollo de software.', 'Pregrado', 'Área Técnica', 1),
(102, 'Ingeniería en Sistemas', 'Universidad Técnica Particular de Loja', 'Carrera de Ingeniería en Sistemas con énfasis en sistemas de información y tecnologías de la comunicación.', 'Pregrado', 'Área Técnica', 1),
(103, 'Ingeniería Civil', 'Universidad Técnica Particular de Loja', 'Carrera de Ingeniería Civil con enfoque en construcción, diseño y supervisión de obras civiles.', 'Pregrado', 'Área Técnica', 5),
(104, 'Tecnologías de la Información', 'Universidad Técnica Particular de Loja', 'Carrera de Tecnologías de la Información enfocada en el uso y desarrollo de tecnologías digitales.', 'Pregrado', 'Área Técnica', 1),
(105, 'Administración de Empresas', 'Universidad Técnica Particular de Loja', 'Carrera de Administración de Empresas con enfoque en la gestión y dirección de organizaciones.', 'Pregrado', 'Área Administrativa', 4),
(106, 'Medicina', 'Universidad Técnica Particular de Loja', 'Carrera de Medicina centrada en el estudio de la salud humana y el cuidado de pacientes.', 'Pregrado', 'Área Biológica y Biomédica', 3),
(107, 'Derecho', 'Universidad Técnica Particular de Loja', 'Carrera de Derecho con enfoque en la legislación y la resolución de conflictos legales.', 'Pregrado', 'Área Socio Humanística', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docente`
--

CREATE TABLE `docente` (
  `idDocente` varchar(12) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Apellido` varchar(100) NOT NULL,
  `Especialidad` varchar(50) DEFAULT NULL,
  `Correo` varchar(100) NOT NULL,
  `Dirección` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `docente`
--

INSERT INTO `docente` (`idDocente`, `Nombre`, `Apellido`, `Especialidad`, `Correo`, `Dirección`) VALUES
('1122334455', 'María José', 'González Suárez', 'Licenciado en Literatura', 'mjgonzalez@utpl.edu.ec', 'Quito'),
('1126294242', 'Pablo Pedro', 'Torres Calva', 'Ingeniero en Sistemas', 'pablpedr@utpl.edu.ec', 'Loja'),
('2211294242', 'Juan Andrés', 'Paredes Loaiza', 'Ingeniero en Sistemas', 'juanaparedes@utpl.edu.ec', 'Loja'),
('2233445566', 'Carlos Andrés', 'Suarez Cevallos', 'Ingeniero Industrial', 'casuarez@utpl.edu.ec', 'Loja'),
('3322334455', 'María Fernanda', 'Jaramillo Palacios', 'Ingeniero en Sistemas', 'mariapjaramillo@utpl.edu.ec', 'Loja'),
('4455667788', 'Luis Fernando', 'Mendoza Solis', 'Ingeniero Eléctrico', 'lfmendoza@utpl.edu.ec', 'Guayaquil'),
('4455678855', 'Andrés Felipe', 'Benitez Naranjo', 'Ingeniero en Sistemas', 'afbenitez@utpl.edu.ec', 'Machala'),
('4488776655', 'Pedro Luis', 'Torres Torres', 'Ingeniero en Sistemas', 'pltorres@utpl.edu.ec', 'Loja'),
('5506294242', 'María Fernanda', 'García López', 'Licenciada en Ciencias Sociales', 'mfgarcia@utpl.edu.ec', 'Quito'),
('5544334455', 'Carlos Andrés', 'Suarez Cevallos', 'Ingeniero Industrial', 'casuarez@utpl.edu.ec', 'Loja'),
('5566997711', 'Luisa María', 'Valencia Medina', 'Ingeniero en Sistemas', 'lmvalencia@utpl.edu.ec', 'Loja'),
('5599887711', 'Luisa María', 'Valencia Medina', 'Biología', 'lmvalencia@utpl.edu.ec', 'Loja'),
('6611223344', 'Carlos Andrés', 'Delgado Córdova', 'Ingeniero en Sistemas', 'cadelgado@utpl.edu.ec', 'Loja'),
('6688123344', 'Pedro Pablo', 'Torres Calva', 'Historiador', 'pablpedr@utpl.edu.ec', 'Guayaquil'),
('7788177700', 'Andrea Carolina', 'Chávez Pérez', 'Literatura', 'andreacchavez@utpl.edu.ec', 'Quito'),
('7788778855', 'Andrea Carolina', 'Chávez Pérez', 'Ingeniero en Sistemas', 'andreacchavez@utpl.edu.ec', 'Quito'),
('7799667700', 'Valeria Gabriela', 'Lozano Vera', 'Ingeniero en Sistemas', 'vglozano@utpl.edu.ec', 'Ambato'),
('8812278855', 'Andrés Felipe', 'Benitez Naranjo', 'Arquitectura', 'afbenitez@utpl.edu.ec', 'Machala'),
('8812337700', 'Valeria Gabriela', 'Lozano Vera', 'Medicina', 'vglozano@utpl.edu.ec', 'Ambato'),
('8812337701', 'Sofía Valentina', 'López Torres', 'Psicología', 'svlopez@utpl.edu.ec', 'Loja'),
('8812337711', 'Gabriel Alejandro', 'García Jaramillo', 'Comunicación', 'gagarcia@utpl.edu.ec', 'Cuenca'),
('8812378855', 'Diego Fernando', 'Carrillo González', 'Derecho', 'dfcarrillo@utpl.edu.ec', 'Quito'),
('8888777700', 'Jorge Alberto', 'Ramos Gutiérrez', 'Ingeniero en Sistemas', 'jorgeramos@utpl.edu.ec', 'Guayaquil'),
('9898123109', 'Carla Valentina', 'Paredes Lozano', 'Ingeniero en Sistemas', 'carlaparedes@utpl.edu.ec', 'Cuenca'),
('9988776655', 'Ana Lucía', 'Velez Espinosa', 'Biología', 'alvelez@utpl.edu.ec', 'Loja');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE `estudiante` (
  `idEstudiante` varchar(12) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Apellido` varchar(100) NOT NULL,
  `Dirección` varchar(255) DEFAULT NULL,
  `Correo` varchar(100) NOT NULL,
  `Teléfono` varchar(20) DEFAULT NULL,
  `idCarrera` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estudiante`
--

INSERT INTO `estudiante` (`idEstudiante`, `Nombre`, `Apellido`, `Dirección`, `Correo`, `Teléfono`, `idCarrera`) VALUES
('1992901929', 'Laura Fernanda', 'Pazmiño Soto', 'Av. Principal, Pueblo', 'laurigopasas@utpl.edu.com', '0929293923', 106),
('2023000001', 'María José', 'González Ramírez', 'Calle 123, Ciudad', 'mariajgonzalez@utpl.edu.ec', '9876543210', 102),
('2023000002', 'Juan Carlos', 'Ramírez Naranjo', 'Av. Principal, Pueblo', 'juanc.ramirez@utpl.edu.ec', '9876123450', 102),
('2023000003', 'Ana María', 'López Pazmiño', 'Calle 456, Ciudad', 'anam.lopez@utpl.edu.ec', '9876789012', 102),
('2023000004', 'Pedro Jose', 'Gómez Pazmiño', 'Av. Central, Pueblo', 'pedrogomez@utpl.edu.ec', '9876456789', 102),
('2023000005', 'Carolina Maria', 'Pazmiño Soto', 'Calle 789, Ciudad', 'caropazmino@utpl.edu.ec', '9876901234', 102),
('2023000006', 'Jorge Nikel', 'Vera Gómez', 'Av. Central, Ciudad', 'jorgevera@utpl.edu.ec', '9876123456', 102),
('2023000007', 'María Fernanda', 'Naranjo Naranjo', 'Calle 789, Pueblo', 'mfernandanaranjo@utpl.edu.ec', '9876789012', 102),
('2023000008', 'Luis Marlo', 'Guerra Perl', 'Av. Principal, Ciudad', 'luisguerra@utpl.edu.ec', '9876123409', 102),
('2023000009', 'Andrea Marilu', 'Soto Mendez', 'Calle 456, Pueblo', 'andreasoto@utpl.edu.ec', '9876456709', 102),
('2023000010', 'Manuel Antiel', 'Mendoza Oyola', 'Av. Principal, Ciudad', 'manuelmendoza@utpl.edu.ec', '9876457809', 102),
('2023000011', 'Laura Fernanda', 'Pérez Gómez', 'Calle 123, Ciudad', 'lauraperez@utpl.edu.ec', '9876543298', 101),
('2023000012', 'Carlos Alberto', 'Gómez Ramírez', 'Av. Principal, Pueblo', 'carlosagomez@utpl.edu.ec', '9876123456', 101),
('2023000013', 'Ana Sofía', 'Ramírez López', 'Calle 456, Ciudad', 'anasramirez@utpl.edu.ec', '9876789045', 101),
('2023000014', 'Diego Alejandro', 'López Gómez', 'Av. Central, Pueblo', 'diegoalopez@utpl.edu.ec', '9876456721', 101),
('2023000015', 'María Elena', 'Gómez Pazmiño', 'Calle 789, Ciudad', 'megomez@utpl.edu.ec', '9876901203', 101),
('2023000016', 'Fernando', 'Pazmiño Vera', 'Av. Central, Ciudad', 'fernandopaz@utpl.edu.ec', '9876123487', 101),
('2023000017', 'Isabel Cristina', 'Vera Naranjo', 'Calle 789, Pueblo', 'isabelvera@utpl.edu.ec', '9876789056', 101),
('2023000018', 'Sebastián Andrés', 'Naranjo Guerra', 'Av. Principal, Ciudad', 'sebastiananaranjo@utpl.edu.ec', '9876123421', 101),
('2023000019', 'Valentina Lupe', 'Guerra Soto', 'Calle 456, Pueblo', 'valentinaguerra@utpl.edu.ec', '9876456754', 101),
('2023000020', 'Santiago Nadiel', 'Soto Mendoza', 'Av. Principal, Ciudad', 'santiagosoto@utpl.edu.ec', '9876457890', 101),
('2023000021', 'Vanesa Nuria', 'Vazquez Gomez', 'Calle 456, Pueblo', 'vanesimasvas@utpl.edu.ec', '0919292992', 105);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habilidad`
--

CREATE TABLE `habilidad` (
  `idHabilidades` int(11) NOT NULL,
  `Nombre` varchar(150) NOT NULL,
  `Descripción` varchar(255) DEFAULT NULL,
  `Nivel` enum('Básico','Intermedio','Avanzado') DEFAULT NULL,
  `idCampo_Estudio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `habilidad`
--

INSERT INTO `habilidad` (`idHabilidades`, `Nombre`, `Descripción`, `Nivel`, `idCampo_Estudio`) VALUES
(65, 'Desarrollo web', 'Diseño y programación de sitios web', 'Intermedio', 1),
(66, 'Kotlin', 'Lenguaje de programación para Android', 'Intermedio', 1),
(67, 'Flutter', 'Framework para desarrollo de apps multiplataforma', 'Intermedio', 1),
(68, 'Android/iOS', 'Desarrollo de aplicaciones móviles para Android e iOS', 'Intermedio', 1),
(69, 'Desarrollo de aplicaciones móviles', 'Creación de apps para dispositivos móviles', 'Intermedio', 1),
(70, 'Java', 'Lenguaje de programación versátil y robusto', 'Intermedio', 1),
(71, 'Spring Boot', 'Framework para desarrollo de aplicaciones Java', 'Intermedio', 1),
(72, 'Programacion', 'Conocimientos en diversos lenguajes de programación', 'Intermedio', 1),
(73, 'Gestión de proyectos de TI', 'Planificación y ejecución de proyectos tecnológicos', 'Intermedio', 1),
(74, 'React.js', 'Librería JavaScript para construir interfaces de usuario', 'Intermedio', 1),
(75, 'Node.js', 'Entorno de ejecución para aplicaciones JavaScript', 'Intermedio', 1),
(76, 'Virtualización y contenedores', 'Tecnologías para optimizar recursos de servidores', 'Intermedio', 1),
(77, '(UI/UX)', 'Diseño de interfaces y experiencia de usuario', 'Intermedio', 1),
(78, 'Diseño de interfaces de usuario', 'Creación de interfaces interactivas y amigables', 'Intermedio', 1),
(79, 'Swift', 'Lenguaje de programación para desarrollo en iOS', 'Intermedio', 1),
(80, 'NoSQL', 'Bases de datos NoSQL para almacenamiento flexible', 'Intermedio', 1),
(81, 'Administración de bases de datos', 'Gestión y mantenimiento de bases de datos', 'Intermedio', 1),
(82, 'Selenium', 'Herramienta de automatización de pruebas web', 'Intermedio', 1),
(83, 'Cypress', 'Framework de pruebas end-to-end para aplicaciones web', 'Intermedio', 1),
(84, 'Automatización pruebas de software', 'Automatización de pruebas para asegurar calidad del software', 'Intermedio', 1),
(85, 'Unity', 'Motor de videojuegos para desarrollo multiplataforma', 'Intermedio', 1),
(86, 'Unreal Engine', 'Motor de videojuegos con amplias capacidades gráficas', 'Intermedio', 1),
(87, 'AWS', 'Servicios de computación en la nube de Amazon', 'Intermedio', 1),
(88, 'Azure', 'Plataforma de computación en la nube de Microsoft', 'Intermedio', 1),
(89, 'Seguridad en aplicaciones web', 'Protección y detección de vulnerabilidades en aplicaciones web', 'Intermedio', 1),
(90, 'Hadoop', 'Framework para procesamiento de grandes volúmenes de datos', 'Intermedio', 1),
(91, 'Spark', 'Motor de procesamiento de datos en clústeres', 'Intermedio', 1),
(92, 'Análisis de datos', 'Extracción y comprensión de datos para toma de decisiones', 'Intermedio', 1),
(93, 'Big data', 'Gestión y análisis de conjuntos de datos masivos', 'Intermedio', 1),
(94, 'Sistemas distribuidos', 'Diseño y mantenimiento de sistemas distribuidos', 'Intermedio', 1),
(95, 'Kubernetes', 'Plataforma para automatización y despliegue de contenedores', 'Intermedio', 1),
(96, 'Docker', 'Herramienta para empaquetar y distribuir aplicaciones en contenedores', 'Intermedio', 1),
(97, 'Arquitectura de software', 'Diseño y estructura de aplicaciones y sistemas', 'Intermedio', 1),
(98, 'UiPath', 'Plataforma de automatización robótica de procesos', 'Intermedio', 1),
(99, 'Automation Anywhere', 'Plataforma de automatización robótica de procesos', 'Intermedio', 1),
(100, 'OWASP', 'Organización para la seguridad de aplicaciones web', 'Intermedio', 1),
(101, 'Apache', 'Servidor web de código abierto', 'Intermedio', 1),
(102, 'Nginx', 'Servidor web y proxy inverso', 'Intermedio', 1),
(103, 'Administración de sistemas operativos', 'Gestión y mantenimiento de sistemas operativos', 'Intermedio', 1),
(104, 'Simulación cuántica', 'Modelado y análisis de sistemas cuánticos', 'Intermedio', 1),
(105, 'Algoritmos', 'Diseño y análisis de algoritmos', 'Intermedio', 1),
(106, 'Scrum', 'Metodología ágil para gestión de proyectos', 'Intermedio', 1),
(107, 'Kanban', 'Método visual para la gestión de tareas', 'Intermedio', 1),
(108, 'ROS', 'Sistema operativo para robots', 'Intermedio', 1),
(109, 'Arduino', 'Plataforma de prototipado electrónico', 'Intermedio', 1),
(110, 'Machine learning', 'Capacidad de programas para aprender de datos', 'Intermedio', 1),
(111, 'Deep learning', 'Subconjunto de machine learning basado en redes neuronales', 'Intermedio', 1),
(112, 'Inteligencia artificial', 'Simulación de procesos de inteligencia humana por computadoras', 'Intermedio', 1),
(113, 'Sistemas predictivos', 'Desarrollo de modelos predictivos usansdo herramientas de siseño y programación', 'Básico', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habilidades_estudiantes`
--

CREATE TABLE `habilidades_estudiantes` (
  `idEstudiante` varchar(12) NOT NULL,
  `idHabilidades` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habilidades_requeridas`
--

CREATE TABLE `habilidades_requeridas` (
  `idPlazas` int(11) NOT NULL,
  `idHabilidades` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `habilidades_requeridas`
--

INSERT INTO `habilidades_requeridas` (`idPlazas`, `idHabilidades`) VALUES
(1, 65),
(1, 67),
(1, 68),
(1, 69),
(2, 70),
(2, 71),
(2, 72),
(2, 73),
(3, 65),
(3, 69),
(3, 74),
(3, 75),
(3, 76),
(4, 65),
(4, 77),
(4, 78),
(5, 65),
(5, 66),
(5, 68),
(5, 69),
(5, 72),
(5, 79),
(6, 80),
(6, 81),
(7, 82),
(7, 83),
(7, 84),
(8, 85),
(8, 86),
(8, 87),
(9, 18),
(9, 88),
(9, 89),
(9, 90),
(10, 91),
(10, 92),
(10, 93),
(10, 94),
(11, 72),
(11, 95),
(11, 96),
(11, 97),
(11, 98),
(12, 65),
(12, 72),
(12, 99),
(12, 100),
(12, 101),
(13, 13),
(13, 89),
(14, 101),
(14, 102),
(14, 103),
(15, 92),
(15, 104),
(15, 105),
(15, 106),
(16, 73),
(16, 106),
(16, 107),
(17, 72),
(17, 108),
(17, 109),
(18, 13),
(18, 18),
(18, 65),
(18, 89),
(18, 95),
(18, 110),
(19, 65),
(19, 66),
(19, 72),
(19, 89),
(19, 92),
(19, 93),
(19, 110),
(19, 111),
(19, 112),
(20, 66),
(20, 67),
(20, 68),
(20, 70),
(21, 74),
(21, 75),
(21, 78),
(22, 85),
(22, 95),
(22, 96),
(23, 90),
(23, 91),
(23, 92),
(25, 65),
(25, 66),
(25, 67),
(25, 82),
(26, 77),
(26, 78),
(27, 70),
(27, 71),
(29, 65),
(29, 66),
(29, 67),
(29, 82),
(29, 83),
(30, 65),
(30, 66),
(32, 65),
(32, 70),
(32, 71),
(33, 65),
(33, 72),
(33, 74),
(33, 78),
(34, 66),
(34, 67),
(34, 68),
(35, 65),
(35, 74),
(35, 75),
(35, 81);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificacion`
--

CREATE TABLE `notificacion` (
  `idNotificacion` int(11) NOT NULL,
  `Descripción` varchar(200) DEFAULT NULL,
  `idEstudiante` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `notificacion`
--

INSERT INTO `notificacion` (`idNotificacion`, `Descripción`, `idEstudiante`) VALUES
(26, 'Ud ha postulado a la plaza \"Desarrollo de Aplicación web bajo tecnologias xyz\"', '2023000014'),
(27, 'Ud ha postulado a la plaza \"Diseño de Interfaz de Usuario para XYZ Design\"', '2023000014'),
(28, 'Ud ha postulado a la plaza \"Desarrollo de Plataforma Móvil de Entrega de Alimentos\"', '2023000014'),
(29, 'Ud ha postulado a la plaza \"Desarrollo de Aplicación web bajo tecnologias xyz\"', '2023000014');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plaza`
--

CREATE TABLE `plaza` (
  `idPlaza` int(11) NOT NULL,
  `Tema` varchar(100) NOT NULL,
  `Descripción` varchar(400) DEFAULT NULL,
  `Empresa` varchar(100) NOT NULL,
  `TipoEmpresa` enum('Pública','Privada') NOT NULL,
  `Convenio` enum('Vigente','Caducado','En proceso') NOT NULL,
  `Vacantes` int(11) DEFAULT NULL,
  `Tutor` varchar(45) NOT NULL,
  `País` varchar(45) NOT NULL,
  `Ciudad` varchar(45) NOT NULL,
  `Nivel inglés` enum('Básico','Intermedio','Avanzado') DEFAULT NULL,
  `Inicio` date DEFAULT NULL,
  `Fin` date DEFAULT NULL,
  `idCampo_Estudio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `plaza`
--

INSERT INTO `plaza` (`idPlaza`, `Tema`, `Descripción`, `Empresa`, `TipoEmpresa`, `Convenio`, `Vacantes`, `Tutor`, `País`, `Ciudad`, `Nivel inglés`, `Inicio`, `Fin`, `idCampo_Estudio`) VALUES
(1, 'Desarrollo de Aplicación web bajo tecnologias xyz', 'Pasantía para el desarrollo de una aplicación móvil en el equipo de InnovateTech. Se utilizarán tecnologías como Flutter para la creación de una app de entrega de alimentos.', 'InnovateTech', 'Pública', 'Vigente', 2, 'Juan Pérez', 'Ecuador', 'Loja', 'Intermedio', '2023-08-15', '2023-11-30', 1),
(2, 'Desarrollo de Sistema de Gestión para ABC Consulting', 'Pasantía para el desarrollo de un sistema de gestión en el equipo de ABC Consulting. Se utilizarán tecnologías como Java y Spring Boot.', 'CloudTech', 'Privada', 'Vigente', 1, 'Laura Gómez', 'Ecuador', 'Loja', 'Avanzado', '2023-09-01', '2023-12-15', 1),
(3, 'Desarrollo de Aplicación Web para Tech Solutions', 'Pasantía para el desarrollo de una aplicación web en el equipo de Tech Solutions. Se utilizarán tecnologías como React.js y Node.js.', 'Tech Solutions', 'Pública', 'Vigente', 3, 'Ana Rodríguez', 'Ecuador', 'Loja', 'Intermedio', '2023-08-20', '2023-11-30', 1),
(4, 'Diseño de Interfaz de Usuario para XYZ Design', 'Pasantía para el diseño de interfaces de usuario (UI/UX) en el equipo de XYZ Design. Se trabajará en proyectos de diseño para aplicaciones web y móviles.', 'XYZ Design', 'Privada', 'Vigente', 2, 'José González', 'Ecuador', 'Loja', 'Avanzado', '2023-09-15', '2023-12-31', 1),
(5, 'Desarrollo de Aplicación Móvil para MobileTech', 'Pasantía para el desarrollo de una aplicación móvil en el equipo de MobileTech. Se utilizarán tecnologías como Kotlin para Android y Swift para iOS.', 'InnovateTech', 'Pública', 'Vigente', 1, 'María Sánchez', 'Ecuador', 'Loja', 'Avanzado', '2023-08-30', '2023-12-31', 1),
(6, 'Administración de Bases de Datos para DataTech', 'Pasantía para la administración de bases de datos en el equipo de DataTech. Se trabajará con bases de datos relacionales y NoSQL.', 'DataTech', 'Privada', 'Vigente', 2, 'Andrea López', 'Ecuador', 'Loja', 'Intermedio', '2023-09-10', '2023-12-15', 1),
(7, 'Automatización de Pruebas para QA Services', 'Pasantía para la automatización de pruebas de software en el equipo de QA Services. Se utilizarán herramientas como Selenium y Cypress.', 'QA Services', 'Privada', 'Vigente', 1, 'Carlos García', 'Ecuador', 'Quito', 'Avanzado', '2023-08-25', '2023-12-31', 1),
(8, 'Desarrollo de Videojuegos para GameTech', 'Pasantía para el desarrollo de videojuegos en el equipo de GameTech. Se utilizarán motores de juego como Unity y Unreal Engine.', 'GameTech', 'Privada', 'Vigente', 2, 'Eduardo Ramírez', 'Ecuador', 'Loja', 'Intermedio', '2023-09-05', '2023-12-31', 1),
(9, 'Cloud Computing para CloudTech', 'Pasantía para el desarrollo e implementación de soluciones de cloud computing en el equipo de CloudTech. Se trabajará con tecnologías como AWS y Azure.', 'CloudTech', 'Privada', 'Vigente', 3, 'Patricia Mora', 'Ecuador', 'Loja', 'Avanzado', '2023-08-20', '2023-11-30', 1),
(10, 'Big Data y Análisis de Datos para DataAnalytics', 'Pasantía para el análisis de grandes volúmenes de datos y aplicaciones de big data en el equipo de DataAnalytics. Se utilizarán herramientas como Hadoop y Spark.', 'DataAnalytics', 'Privada', 'Vigente', 2, 'Roberto Torres', 'Ecuador', 'Zamora', 'Intermedio', '2023-09-10', '2023-12-15', 1),
(11, 'Desarrollo de Sistemas Distribuidos para TechHub', 'Pasantía para el desarrollo de sistemas distribuidos en el equipo de TechHub. Se trabajará con tecnologías como Kubernetes y Docker.', 'TechSales', 'Privada', 'Vigente', 2, 'Marcelo Sánchez', 'Ecuador', 'Loja', 'Avanzado', '2023-09-15', '2023-12-31', 1),
(12, 'Automatización de Procesos para ProcessTech', 'Pasantía para la automatización de procesos en el equipo de ProcessTech. Se utilizarán herramientas como UiPath y Automation Anywhere.', 'InnovateTech', 'Pública', 'Vigente', 1, 'Sandra Gutiérrez', 'Ecuador', 'Loja', 'Intermedio', '2023-08-30', '2023-12-31', 1),
(13, 'Seguridad en Aplicaciones Web para WebSecure', 'Pasantía para la implementación de medidas de seguridad en aplicaciones web en el equipo de WebSecure. Se trabajará con tecnologías como OWASP Top 10.', 'WebTech', 'Pública', 'Vigente', 2, 'Diego Valverde', 'Ecuador', 'Loja', 'Avanzado', '2023-09-10', '2023-12-15', 1),
(14, 'Administración de Servidores Web para WebTech', 'Pasantía para la administración de servidores web en el equipo de WebTech. Se trabajará con tecnologías como Apache y Nginx.', 'WebTech', 'Pública', 'Vigente', 1, 'Andrés Jaramillo', 'Ecuador', 'Loja', 'Intermedio', '2023-08-25', '2023-12-31', 1),
(15, 'Computación Cuántica para QuantumTech', 'Pasantía para la investigación en computación cuántica en el equipo de QuantumTech. Se explorarán Algoritmos cuánticos y simulación cuántica.', 'QuantumTech', 'Privada', 'Vigente', 2, 'Luis Mendoza', 'Ecuador', 'Loja', 'Avanzado', '2023-09-01', '2023-12-15', 1),
(16, 'Gestión de Proyectos de TI para LearnIT', 'Pasantía para la gestión de proyectos de TI en el equipo de IT Solutions. Se aplicarán metodologías ágiles como Scrum y Kanban.', 'LearnIT', 'Privada', 'Vigente', 3, 'Fernando Benítez', 'Ecuador', 'Loja', 'Intermedio', '2023-08-20', '2023-11-30', 1),
(17, 'Robótica y Automatización Industrial para RoboticsTech', 'Pasantía para el desarrollo y programación de robots en el equipo de RoboticsTech. Se utilizarán plataformas como ROS y Arduino.', 'AI Solutions', 'Privada', 'Vigente', 1, 'Lucía Valencia', 'Ecuador', 'Loja', 'Avanzado', '2023-08-30', '2023-12-31', 1),
(18, 'Desarrollo de Aplicaciones en la Nube para CloudApps', 'Pasantía para el desarrollo de aplicaciones cloud-native en el equipo de CloudApps. Se utilizarán tecnologías como Kubernetes y serverless.', 'AI Solutions', 'Privada', 'Vigente', 2, 'Carlos Delgado', 'Ecuador', 'Loja', 'Intermedio', '2023-09-05', '2023-12-31', 1),
(19, 'Inteligencia Artificial para AI Solutions', 'Pasantía para el desarrollo de soluciones basadas en inteligencia artificial en el equipo de AI Solutions. Se aplicarán técnicas de machine learning y deep learning.', 'AI Solutions', 'Privada', 'Vigente', 2, 'Luis García', 'Ecuador', 'Cuenca', 'Avanzado', '2023-09-10', '2023-12-15', 1),
(20, 'Desarrollo de Plataforma Móvil de Entrega de Alimentos', 'Pasantía para el desarrollo de una plataforma móvil de entrega de alimentos en InnovateTechX. Se requiere conocimientos en Kotlin para el backend, Flutter para la interfaz, además de Android/iOS y Java para asegurar una integración perfecta.', 'InnovateTech', 'Pública', 'Vigente', 2, 'María López', 'Ecuador', 'Loja', 'Intermedio', '2023-08-15', '2023-11-30', 1),
(21, 'Desarrollo de Aplicación Web para E-Commerce', 'Pasantía en TechEcommerce para el desarrollo de una plataforma web de comercio electrónico. Se requiere conocimientos en React.js y Node.js para la implementación del frontend y backend, así como habilidades en diseño de interfaces de usuario (UI/UX).', 'TechEcommerce', 'Privada', 'Vigente', 3, 'Ana Gutiérrez', 'Ecuador', 'Loja', 'Intermedio', '2023-09-01', '2023-12-15', 1),
(22, 'Desarrollo de Juego en Unity', 'Pasantía en GameDevMaster para el desarrollo de un videojuego en Unity. Se requiere experiencia en Unity para el desarrollo de juegos, así como conocimientos en diseño de niveles y animación.', 'GameDevMaster', 'Privada', 'Vigente', 2, 'Carlos Ramírez', 'Ecuador', 'Cuenca', 'Intermedio', '2023-08-20', '2023-12-31', 1),
(23, 'Análisis de Datos en Proyecto de Big Data', 'Pasantía en DataAnalytica para el análisis de datos en proyectos de Big Data. Se requiere experiencia en Hadoop y Spark para el procesamiento de grandes volúmenes de información y conocimientos en análisis de datos para la toma de decisiones.', 'DataAnalytica', 'Privada', 'Vigente', 1, 'Laura Pérez', 'Ecuador', 'Quito', 'Avanzado', '2023-09-15', '2023-12-31', 1),
(25, 'Desarrollo de Aplicación Móvil para InnovApp', 'Pasantía en InnovApp para el desarrollo de una aplicación móvil utilizando Kotlin, Flutter y realizando pruebas con Selenium.', 'InnovApp', 'Privada', 'Vigente', 3, 'Laura Gómez', 'Ecuador', 'Quito', 'Intermedio', '2023-08-15', '2023-11-30', 1),
(26, 'Diseño de Interfaz de Usuario para UXDesign', 'Pasantía en UXDesign para el diseño de interfaces de usuario (UI/UX) utilizando herramientas como Figma y Adobe XD.', 'UXDesign', 'Privada', 'Vigente', 2, 'Ana Rodríguez', 'Ecuador', 'Guayaquil', 'Intermedio', '2023-09-01', '2023-12-15', 1),
(27, 'Desarrollo de Plataforma E-commerce para TechSales', 'Pasantía en TechSales para el desarrollo de una plataforma de E-commerce utilizando Java y Spring Boot.', 'TechSales', 'Privada', 'Vigente', 2, 'Juan Pérez', 'Ecuador', 'Cuenca', 'Intermedio', '2023-08-20', '2023-11-30', 1),
(28, 'Desarrollo de Plataforma Educativa para LearnIT', 'Pasantía en LearnIT para el desarrollo de una plataforma educativa utilizando PHP y MySQL.', 'LearnIT', 'Privada', 'Vigente', 1, 'María López', 'Ecuador', 'Ambato', 'Básico', '2023-09-15', '2023-12-31', 1),
(29, 'Desarrollo de Aplicación Móvil para TechSolutions', 'Pasantía en TechSolutions para el desarrollo de una aplicación móvil utilizando Kotlin, Flutter y realizando pruebas con Cypress y Selenium.', 'TechSolutions', 'Pública', 'Vigente', 2, 'Pedro Ramírez', 'Ecuador', 'Loja', 'Intermedio', '2023-08-15', '2023-11-30', 1),
(30, 'Implementación de sitema web para captar flujo datos', 'Se requiere de una aplicacion web que permita ejecutar modelos de captación usando Desarrollo web Y Kotlin ', 'InnovateTech', 'Pública', 'Vigente', 1, 'Juan Pérez', 'Ecuador', 'Loja', 'Básico', '2023-08-15', '2023-11-30', 1),
(32, 'Desarrollo de Tienda Virtual en InnovateTech', 'Pasantía para el desarrollo de una tienda virtual en InnovateTech. Se requiere experiencia en Desarrollo web, además de conocimientos en Java y Spring Boot.', 'InnovateTech', 'Pública', 'Vigente', 2, 'Laura Gómez', 'Ecuador', 'Loja', 'Avanzado', '2023-09-01', '2023-12-15', 1),
(33, 'Desarrollo de Aplicación Web Interactiva en InnovateTech', 'Pasantía para el desarrollo de una aplicación web interactiva en InnovateTech. Se busca experiencia en Desarrollo web y habilidades en JavaScript, React.js y Diseño de interfaces de usuario.', 'InnovateTech', 'Pública', 'Vigente', 2, 'Ana Rodríguez', 'Ecuador', 'Loja', 'Intermedio', '2023-08-20', '2023-11-30', 1),
(34, 'Desarrollo de Aplicación Móvil en InnovateTech', 'Pasantía para el desarrollo de una aplicación móvil en InnovateTech. Se requerirá experiencia en Kotlin y Flutter, además de conocimientos en Android/iOS.', 'InnovateTech', 'Pública', 'Vigente', 2, 'María López', 'Ecuador', 'Loja', 'Intermedio', '2023-08-15', '2023-11-30', 1),
(35, 'Desarrollo de Plataforma Web Avanzada en InnovateTech', 'Pasantía para el desarrollo de una plataforma web avanzada en InnovateTech. Se requerirá experiencia en Desarrollo web, además de habilidades en React.js, Node.js, y Administración de bases de datos.', 'InnovateTech', 'Pública', 'Vigente', 2, 'Juan Pérez', 'Ecuador', 'Loja', 'Intermedio', '2023-08-15', '2023-12-15', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plazapropuesta`
--

CREATE TABLE `plazapropuesta` (
  `idPlazaPropuesta` int(11) NOT NULL,
  `Tutor` varchar(70) NOT NULL,
  `Empresa` varchar(150) NOT NULL,
  `TituloPlaza` varchar(15) NOT NULL,
  `Descripcion` varchar(300) DEFAULT NULL,
  `idEstudiante` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `postulación`
--

CREATE TABLE `postulación` (
  `Estado` enum('Asignado','Rechazado') DEFAULT NULL,
  `idPlaza` int(11) NOT NULL,
  `idEstudiante` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `postulación`
--

INSERT INTO `postulación` (`Estado`, `idPlaza`, `idEstudiante`) VALUES
(NULL, 1, '2023000003'),
(NULL, 1, '2023000014'),
(NULL, 1, '2023000019'),
(NULL, 2, '2023000002'),
(NULL, 2, '2023000008'),
(NULL, 2, '2023000009'),
(NULL, 2, '2023000013'),
(NULL, 3, '2023000002'),
(NULL, 3, '2023000005'),
(NULL, 3, '2023000013'),
(NULL, 4, '2023000010'),
(NULL, 4, '2023000017'),
(NULL, 5, '2023000002'),
(NULL, 7, '2023000008'),
(NULL, 10, '2023000011'),
(NULL, 12, '2023000016'),
(NULL, 13, '2023000006'),
(NULL, 13, '2023000011'),
(NULL, 13, '2023000017'),
(NULL, 14, '2023000003'),
(NULL, 14, '2023000004'),
(NULL, 14, '2023000008'),
(NULL, 15, '2023000004'),
(NULL, 15, '2023000012'),
(NULL, 16, '2023000005'),
(NULL, 18, '2023000015'),
(NULL, 19, '2023000003'),
(NULL, 19, '2023000012'),
(NULL, 19, '2023000016'),
(NULL, 20, '2023000014');

--
-- Disparadores `postulación`
--
DELIMITER $$
CREATE TRIGGER `tr_postulacion_after_insert` AFTER INSERT ON `postulación` FOR EACH ROW BEGIN
    DECLARE plaza_nombre VARCHAR(100);
    
    -- Obtener el nombre de la plaza asociada con la postulación
    SELECT Tema INTO plaza_nombre
    FROM plaza
    WHERE idPlaza = NEW.idPlaza;
    
    -- Insertar el registro de notificación en la tabla notificacion
    INSERT INTO notificacion (Descripción, idEstudiante)
    VALUES (CONCAT('Ud ha postulado a la plaza "', plaza_nombre, '"'),
            NEW.idEstudiante);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `practicums`
--

CREATE TABLE `practicums` (
  `idPracticum` int(11) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Inicio` varchar(45) NOT NULL,
  `Fin` varchar(45) NOT NULL,
  `Descripción` varchar(45) NOT NULL,
  `idDocente` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `practicums`
--

INSERT INTO `practicums` (`idPracticum`, `Nombre`, `Inicio`, `Fin`, `Descripción`, `idDocente`) VALUES
(2, 'Gestión Productiva 2.3', '2023-07-23', '2023-12-31', 'Descripción del Practicum 1', '1122334455'),
(3, 'Gestión Productiva 3.1', '2023-07-23', '2023-12-31', 'Descripción del Practicum 2', '1126294242'),
(4, 'Gestión Productiva 3.2', '2023-07-23', '2023-12-31', 'Descripción del Practicum 3', '2211294242'),
(5, 'Prácticum 2.3', '2023-07-23', '2023-12-31', 'Descripción del Practicum 4', '2211294242'),
(6, 'Prácticum 3.1', '2023-07-23', '2023-12-31', 'Descripción del Practicum 5', '3322334455'),
(7, 'Prácticum 3.2', '2023-07-23', '2023-12-31', 'Descripción del Practicum 6', '4455667788');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `practicums_estudiante`
--

CREATE TABLE `practicums_estudiante` (
  `idPracticum` int(11) NOT NULL,
  `idEstudiante` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `practicums_estudiante`
--

INSERT INTO `practicums_estudiante` (`idPracticum`, `idEstudiante`) VALUES
(4, '2023000011'),
(4, '2023000012'),
(4, '2023000013'),
(4, '2023000014'),
(4, '2023000015'),
(4, '2023000016'),
(4, '2023000017'),
(4, '2023000018'),
(4, '2023000019'),
(4, '2023000020'),
(5, '2023000001'),
(5, '2023000002'),
(5, '2023000003'),
(5, '2023000004'),
(5, '2023000005'),
(5, '2023000006'),
(5, '2023000007'),
(5, '2023000008'),
(5, '2023000009'),
(5, '2023000010');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proponer_plaza`
--

CREATE TABLE `proponer_plaza` (
  `id_proponer_plaza` int(11) NOT NULL,
  `id_usuario_propone` varchar(12) DEFAULT NULL,
  `dirigido` varchar(100) DEFAULT NULL,
  `empresa` varchar(100) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `titulo_plaza` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proponer_plaza`
--

INSERT INTO `proponer_plaza` (`id_proponer_plaza`, `id_usuario_propone`, `dirigido`, `empresa`, `descripcion`, `titulo_plaza`) VALUES
(26, '', '', '', '', ''),
(27, '', '', '', '', ''),
(28, '2023000014', 'Pedro Lopez', 'NONEXYZ', 'plaza', 'Desarrollo de interfaces php ');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `campo_estudio`
--
ALTER TABLE `campo_estudio`
  ADD PRIMARY KEY (`idCampo_Estudio`);

--
-- Indices de la tabla `carrera`
--
ALTER TABLE `carrera`
  ADD PRIMARY KEY (`idCarrera`),
  ADD KEY `fk_carrera_campo_estudio1_idx` (`idCampo_Estudio`);

--
-- Indices de la tabla `docente`
--
ALTER TABLE `docente`
  ADD PRIMARY KEY (`idDocente`);

--
-- Indices de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD PRIMARY KEY (`idEstudiante`),
  ADD KEY `fk_Estudiante_Carrera1_idx` (`idCarrera`);

--
-- Indices de la tabla `habilidad`
--
ALTER TABLE `habilidad`
  ADD PRIMARY KEY (`idHabilidades`),
  ADD KEY `fk_habilidades_campo_estudio1_idx` (`idCampo_Estudio`);

--
-- Indices de la tabla `habilidades_estudiantes`
--
ALTER TABLE `habilidades_estudiantes`
  ADD PRIMARY KEY (`idEstudiante`,`idHabilidades`),
  ADD KEY `fk_habilidades_estudiantes_estudiante1_idx` (`idEstudiante`),
  ADD KEY `fk_habilidades_estudiantes_Habilidades1_idx` (`idHabilidades`);

--
-- Indices de la tabla `habilidades_requeridas`
--
ALTER TABLE `habilidades_requeridas`
  ADD PRIMARY KEY (`idPlazas`,`idHabilidades`),
  ADD KEY `fk_AptitudesRequeridas_Plazas1_idx` (`idPlazas`),
  ADD KEY `fk_Habilidades_requeridas_Habilidades1_idx` (`idHabilidades`);

--
-- Indices de la tabla `notificacion`
--
ALTER TABLE `notificacion`
  ADD PRIMARY KEY (`idNotificacion`,`idEstudiante`),
  ADD KEY `fk_notificacion_estudiante1_idx` (`idEstudiante`);

--
-- Indices de la tabla `plaza`
--
ALTER TABLE `plaza`
  ADD PRIMARY KEY (`idPlaza`),
  ADD KEY `fk_plaza_campo_estudio1_idx` (`idCampo_Estudio`);

--
-- Indices de la tabla `plazapropuesta`
--
ALTER TABLE `plazapropuesta`
  ADD PRIMARY KEY (`idPlazaPropuesta`),
  ADD KEY `fk_PlazaPropuesta_estudiante1_idx` (`idEstudiante`);

--
-- Indices de la tabla `postulación`
--
ALTER TABLE `postulación`
  ADD PRIMARY KEY (`idPlaza`,`idEstudiante`),
  ADD KEY `fk_Postulación_Plazas1_idx` (`idPlaza`),
  ADD KEY `fk_postulación_estudiante1_idx` (`idEstudiante`);

--
-- Indices de la tabla `practicums`
--
ALTER TABLE `practicums`
  ADD PRIMARY KEY (`idPracticum`),
  ADD KEY `fk_practicums_docente1_idx` (`idDocente`);

--
-- Indices de la tabla `practicums_estudiante`
--
ALTER TABLE `practicums_estudiante`
  ADD PRIMARY KEY (`idPracticum`,`idEstudiante`),
  ADD KEY `fk_Practicums_Estudiante_Practicums1_idx` (`idPracticum`),
  ADD KEY `fk_practicums_estudiante_estudiante1_idx` (`idEstudiante`);

--
-- Indices de la tabla `proponer_plaza`
--
ALTER TABLE `proponer_plaza`
  ADD PRIMARY KEY (`id_proponer_plaza`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `campo_estudio`
--
ALTER TABLE `campo_estudio`
  MODIFY `idCampo_Estudio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `carrera`
--
ALTER TABLE `carrera`
  MODIFY `idCarrera` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT de la tabla `habilidad`
--
ALTER TABLE `habilidad`
  MODIFY `idHabilidades` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT de la tabla `notificacion`
--
ALTER TABLE `notificacion`
  MODIFY `idNotificacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `plaza`
--
ALTER TABLE `plaza`
  MODIFY `idPlaza` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `practicums`
--
ALTER TABLE `practicums`
  MODIFY `idPracticum` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `proponer_plaza`
--
ALTER TABLE `proponer_plaza`
  MODIFY `id_proponer_plaza` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carrera`
--
ALTER TABLE `carrera`
  ADD CONSTRAINT `fk_carrera_campo_estudio1` FOREIGN KEY (`idCampo_Estudio`) REFERENCES `campo_estudio` (`idCampo_Estudio`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD CONSTRAINT `fk_Estudiante_Carrera1` FOREIGN KEY (`idCarrera`) REFERENCES `carrera` (`idCarrera`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `habilidad`
--
ALTER TABLE `habilidad`
  ADD CONSTRAINT `fk_habilidades_campo_estudio1` FOREIGN KEY (`idCampo_Estudio`) REFERENCES `campo_estudio` (`idCampo_Estudio`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `habilidades_estudiantes`
--
ALTER TABLE `habilidades_estudiantes`
  ADD CONSTRAINT `fk_habilidades_estudiantes_Habilidades1` FOREIGN KEY (`idHabilidades`) REFERENCES `habilidad` (`idHabilidades`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_habilidades_estudiantes_estudiante1` FOREIGN KEY (`idEstudiante`) REFERENCES `estudiante` (`idEstudiante`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `habilidades_requeridas`
--
ALTER TABLE `habilidades_requeridas`
  ADD CONSTRAINT `fk_AptitudesRequeridas_Plazas1` FOREIGN KEY (`idPlazas`) REFERENCES `plaza` (`idPlaza`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Habilidades_requeridas_Habilidades1` FOREIGN KEY (`idHabilidades`) REFERENCES `habilidad` (`idHabilidades`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `notificacion`
--
ALTER TABLE `notificacion`
  ADD CONSTRAINT `fk_notificacion_estudiante1` FOREIGN KEY (`idEstudiante`) REFERENCES `estudiante` (`idEstudiante`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `plaza`
--
ALTER TABLE `plaza`
  ADD CONSTRAINT `fk_plaza_campo_estudio1` FOREIGN KEY (`idCampo_Estudio`) REFERENCES `campo_estudio` (`idCampo_Estudio`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `plazapropuesta`
--
ALTER TABLE `plazapropuesta`
  ADD CONSTRAINT `fk_PlazaPropuesta_estudiante1` FOREIGN KEY (`idEstudiante`) REFERENCES `estudiante` (`idEstudiante`);

--
-- Filtros para la tabla `postulación`
--
ALTER TABLE `postulación`
  ADD CONSTRAINT `fk_Postulación_Plazas1` FOREIGN KEY (`idPlaza`) REFERENCES `plaza` (`idPlaza`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_postulación_estudiante1` FOREIGN KEY (`idEstudiante`) REFERENCES `estudiante` (`idEstudiante`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `practicums`
--
ALTER TABLE `practicums`
  ADD CONSTRAINT `fk_practicums_docente1` FOREIGN KEY (`idDocente`) REFERENCES `docente` (`idDocente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `practicums_estudiante`
--
ALTER TABLE `practicums_estudiante`
  ADD CONSTRAINT `fk_Practicums_Estudiante_Practicums1` FOREIGN KEY (`idPracticum`) REFERENCES `practicums` (`idPracticum`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_practicums_estudiante_estudiante1` FOREIGN KEY (`idEstudiante`) REFERENCES `estudiante` (`idEstudiante`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
