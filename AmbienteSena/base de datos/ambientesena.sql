-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 16-02-2026 a las 14:34:07
-- Versión del servidor: 8.0.42
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ambientesena`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizarambiente` (IN `p_id` INT, IN `p_nombre` VARCHAR(100), IN `p_tipo` VARCHAR(100), IN `p_observacion` VARCHAR(255))   BEGIN

UPDATE ambientes SET NombreAmbiente = p_nombre, TipoAmbiente = p_tipo, Observaciones = p_Observacion WHERE id=p_id;


END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_consultarambiente` (IN `p_id` INT)   BEGIN 

SELECT * FROM ambientes WHERE id = p_id;




END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminarambiente` (IN `p_id` INT)   BEGIN

DELETE FROM ambientes WHERE id = p_id;


END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertarambiente` (IN `p_nombre` VARCHAR(100), IN `p_tipo` VARCHAR(100), IN `p_observacion` VARCHAR(255))   BEGIN

INSERT INTO ambientes (NombreAmbiente, TipoAmbiente, Observaciones)
VALUES(p_nombre, p_tipo, p_observacion);



END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_listarambientes` ()   BEGIN
    SELECT *
    FROM ambientes ORDER BY id DESC;
    END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ambientes`
--

CREATE TABLE `ambientes` (
  `id` bigint NOT NULL,
  `NombreAmbiente` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `TipoAmbiente` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `Observaciones` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

--
-- Volcado de datos para la tabla `ambientes`
--

INSERT INTO `ambientes` (`id`, `NombreAmbiente`, `TipoAmbiente`, `Observaciones`) VALUES
(1, 'Ambiente 415', 'Mixto', 'AC Nuevo'),
(2, 'Ambiente 422', 'Bilinguismo', 'AC Nuevo'),
(3, 'Ambiente 315', 'Gamer', 'ND'),
(4, 'Ambiente 215', 'Tecnologico', 'ND');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int NOT NULL,
  `name` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int NOT NULL,
  `password` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentadante`
--

CREATE TABLE `cuentadante` (
  `id` bigint NOT NULL,
  `observaciones` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `fechaasignacion` date NOT NULL,
  `elemento_id` bigint NOT NULL,
  `instructor_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

--
-- Volcado de datos para la tabla `cuentadante`
--

INSERT INTO `cuentadante` (`id`, `observaciones`, `fechaasignacion`, `elemento_id`, `instructor_id`) VALUES
(1, 'nuevo', '2025-09-05', 5, 1),
(2, 'nuevo', '2025-09-05', 1, 2),
(3, 'Nuevo', '2025-09-10', 4, 1),
(4, 'Nuevo', '2025-09-05', 4, 3),
(5, 'nuevo', '2025-09-09', 3, 4),
(8, 'dawda', '2025-09-12', 3, 1),
(9, 'dwadwad', '2025-09-12', 3, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci,
  `object_repr` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int NOT NULL,
  `app_label` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL,
  `app` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'AmbienteSena', '0001_initial', '2025-08-27 16:43:58.232863'),
(2, 'AmbienteSena', '0002_alter_instructor_cedula', '2025-08-27 16:43:58.238781'),
(3, 'contenttypes', '0001_initial', '2025-08-27 16:43:58.272716'),
(4, 'auth', '0001_initial', '2025-08-27 16:43:58.819498'),
(5, 'admin', '0001_initial', '2025-08-27 16:43:58.953068'),
(6, 'admin', '0002_logentry_remove_auto_add', '2025-08-27 16:43:58.959742'),
(7, 'admin', '0003_logentry_add_action_flag_choices', '2025-08-27 16:43:58.965606'),
(8, 'contenttypes', '0002_remove_content_type_name', '2025-08-27 16:43:59.066762'),
(9, 'auth', '0002_alter_permission_name_max_length', '2025-08-27 16:43:59.131642'),
(10, 'auth', '0003_alter_user_email_max_length', '2025-08-27 16:43:59.194589'),
(11, 'auth', '0004_alter_user_username_opts', '2025-08-27 16:43:59.201234'),
(12, 'auth', '0005_alter_user_last_login_null', '2025-08-27 16:43:59.266129'),
(13, 'auth', '0006_require_contenttypes_0002', '2025-08-27 16:43:59.269105'),
(14, 'auth', '0007_alter_validators_add_error_messages', '2025-08-27 16:43:59.276471'),
(15, 'auth', '0008_alter_user_username_max_length', '2025-08-27 16:43:59.338004'),
(16, 'auth', '0009_alter_user_last_name_max_length', '2025-08-27 16:43:59.394615'),
(17, 'auth', '0010_alter_group_name_max_length', '2025-08-27 16:43:59.455600'),
(18, 'auth', '0011_update_proxy_permissions', '2025-08-27 16:43:59.463983'),
(19, 'auth', '0012_alter_user_first_name_max_length', '2025-08-27 16:43:59.530035'),
(20, 'sessions', '0001_initial', '2025-08-27 16:43:59.563279'),
(21, 'AmbienteSena', '0003_ingreso', '2025-09-11 15:24:19.596390');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `elemento`
--

CREATE TABLE `elemento` (
  `id` bigint NOT NULL,
  `Nombre` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `Tipo` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `Observaciones` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `Foto` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `ambiente_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

--
-- Volcado de datos para la tabla `elemento`
--

INSERT INTO `elemento` (`id`, `Nombre`, `Tipo`, `Observaciones`, `Foto`, `ambiente_id`) VALUES
(1, 'Consola xbox', 'Gamer', 'Nuevo', 'c5c0300f-eede-4a1d-92e4-bb5c0615c1d0.jpg', 3),
(2, 'Televisor', 'Audiovisual', 'ND', 'c03484ae-3605-4483-ba09-eb074ba895e8.jpg', 2),
(3, 'Escritorio', 'Mueble', 'ND', '2706dd2e-1c24-4470-9a2b-d73ab2f9c011.jpg', 1),
(4, 'Silla', 'Mueble', 'ND', 'a03b2e57-f7df-4841-b9af-02ed86b0b31c.jpg', 4),
(5, 'Proyector', 'Audiovisual', 'Nuevo', '9225d159-ef40-4613-a85d-f6976f2805ec.jpg', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingreso`
--

CREATE TABLE `ingreso` (
  `id` bigint NOT NULL,
  `observacion` varchar(255) DEFAULT NULL,
  `fecha_hora_entrada` datetime(6) NOT NULL,
  `fecha_hora_salida` datetime(6) DEFAULT NULL,
  `ambiente_id` bigint NOT NULL,
  `instructor_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `ingreso`
--

INSERT INTO `ingreso` (`id`, `observacion`, `fecha_hora_entrada`, `fecha_hora_salida`, `ambiente_id`, `instructor_id`) VALUES
(1, '', '2025-09-11 16:25:10.295584', '2025-09-12 13:43:14.061152', 4, 1),
(2, '', '2025-09-11 16:31:18.713647', '2025-09-12 13:51:32.614138', 3, 4),
(3, '', '2025-09-12 11:14:48.635434', '2025-09-12 13:52:04.453124', 4, 1),
(4, '', '2025-09-12 11:19:24.611266', '2025-09-12 13:53:15.087017', 3, 4),
(5, '', '2025-09-12 11:26:07.263799', '2025-09-12 14:07:13.677079', 3, 3),
(6, '', '2025-09-12 12:07:33.605319', NULL, 1, 3),
(7, '', '2025-09-12 12:08:51.251042', NULL, 3, 4),
(8, '', '2025-09-12 12:14:11.939022', NULL, 3, 4),
(9, '', '2025-09-12 12:20:08.561936', NULL, 3, 4),
(10, '', '2025-09-12 12:45:38.994854', NULL, 3, 1),
(11, '', '2025-09-12 12:47:04.745455', NULL, 3, 3),
(12, '', '2025-09-12 13:29:50.036261', NULL, 3, 4),
(13, '', '2025-09-12 13:34:25.830085', NULL, 3, 4),
(14, '', '2025-09-12 13:35:26.207674', NULL, 3, 1),
(15, '', '2025-09-12 13:37:45.612326', NULL, 3, 4),
(16, '', '2025-09-12 13:42:25.177539', NULL, 3, 4),
(17, '', '2025-09-12 14:06:47.643434', NULL, 3, 4),
(18, '', '2025-09-12 14:18:00.568250', '2025-09-12 14:18:12.751317', 1, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `instructor`
--

CREATE TABLE `instructor` (
  `id` bigint NOT NULL,
  `NombreCompleto` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `Area` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `Celular` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `Cedula` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

--
-- Volcado de datos para la tabla `instructor`
--

INSERT INTO `instructor` (`id`, `NombreCompleto`, `Area`, `Celular`, `Cedula`) VALUES
(1, 'David Rojas', 'software', '8854444', 8745511),
(2, 'Tommy Queen', 'sistemas', '4544424', 528848),
(3, 'Niña Rivera', 'zoologia', '8854444', 528848),
(4, 'Luna Moralez', 'veterinaria', '6582254', 8745511);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ambientes`
--
ALTER TABLE `ambientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `cuentadante`
--
ALTER TABLE `cuentadante`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cuentadante_instructor_id_elemento_id_a3b821dc_uniq` (`instructor_id`,`elemento_id`),
  ADD KEY `cuentadante_elemento_id_179def79_fk_elemento_id` (`elemento_id`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indices de la tabla `elemento`
--
ALTER TABLE `elemento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `elemento_ambiente_id_e82812f7_fk_ambientes_id` (`ambiente_id`);

--
-- Indices de la tabla `ingreso`
--
ALTER TABLE `ingreso`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ingreso_ambiente_id_2ba45b9e_fk_ambientes_id` (`ambiente_id`),
  ADD KEY `ingreso_instructor_id_c01b21b1_fk_instructor_id` (`instructor_id`);

--
-- Indices de la tabla `instructor`
--
ALTER TABLE `instructor`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ambientes`
--
ALTER TABLE `ambientes`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cuentadante`
--
ALTER TABLE `cuentadante`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `elemento`
--
ALTER TABLE `elemento`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `ingreso`
--
ALTER TABLE `ingreso`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `instructor`
--
ALTER TABLE `instructor`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `cuentadante`
--
ALTER TABLE `cuentadante`
  ADD CONSTRAINT `cuentadante_elemento_id_179def79_fk_elemento_id` FOREIGN KEY (`elemento_id`) REFERENCES `elemento` (`id`),
  ADD CONSTRAINT `cuentadante_instructor_id_d9a5893a_fk_instructor_id` FOREIGN KEY (`instructor_id`) REFERENCES `instructor` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `elemento`
--
ALTER TABLE `elemento`
  ADD CONSTRAINT `elemento_ambiente_id_e82812f7_fk_ambientes_id` FOREIGN KEY (`ambiente_id`) REFERENCES `ambientes` (`id`);

--
-- Filtros para la tabla `ingreso`
--
ALTER TABLE `ingreso`
  ADD CONSTRAINT `ingreso_ambiente_id_2ba45b9e_fk_ambientes_id` FOREIGN KEY (`ambiente_id`) REFERENCES `ambientes` (`id`),
  ADD CONSTRAINT `ingreso_instructor_id_c01b21b1_fk_instructor_id` FOREIGN KEY (`instructor_id`) REFERENCES `instructor` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
