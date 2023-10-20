-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-10-2023 a las 00:04:45
-- Versión del servidor: 10.1.37-MariaDB
-- Versión de PHP: 7.0.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `my_project`
--
CREATE DATABASE IF NOT EXISTS `my_project` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `my_project`;

DELIMITER $$
--
-- Procedimientos
--
DROP PROCEDURE IF EXISTS `sp_select_module_all`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_module_all` ()  BEGIN
SELECT * FROM module;
END$$

DROP PROCEDURE IF EXISTS `sp_select_role_all`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_role_all` ()  BEGIN
SELECT * FROM role;
END$$

DROP PROCEDURE IF EXISTS `sp_select_user_all`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_user_all` ()  BEGIN
SELECT us.user_id,US.user_user,US.user_password, R.role_name, UST.user_status_name FROM user US INNER JOIN user_status UST ON US.user_status_id = UST.user_status_id INNER JOIN role R ON US.role_id = R.role_id;
END$$

DROP PROCEDURE IF EXISTS `sp_select_user_id`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_user_id` (IN `userId` INT)  BEGIN
SELECT * FROM user WHERE user_id=userId;
END$$

DROP PROCEDURE IF EXISTS `sp_select_user_status_all`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_user_status_all` ()  BEGIN
SELECT * FROM user_status;
END$$

DROP PROCEDURE IF EXISTS `sp_select_user_user`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_user_user` (IN `userUser` VARCHAR(50))  BEGIN
SELECT * FROM user WHERE user_user=userUser;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `module`
--

DROP TABLE IF EXISTS `module`;
CREATE TABLE IF NOT EXISTS `module` (
  `module_id` int(11) NOT NULL AUTO_INCREMENT,
  `module_name` varchar(20) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `create_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`module_id`),
  UNIQUE KEY `module_name` (`module_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Truncar tablas antes de insertar `module`
--

TRUNCATE TABLE `module`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(20) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `create_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `role_name` (`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Truncar tablas antes de insertar `role`
--

TRUNCATE TABLE `role`;
--
-- Volcado de datos para la tabla `role`
--

INSERT INTO `role` (`role_id`, `role_name`, `updated_at`, `create_at`) VALUES
(1, 'admin', NULL, '2023-10-20 14:43:37'),
(2, 'client', NULL, '2023-10-20 14:43:37');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role_module`
--

DROP TABLE IF EXISTS `role_module`;
CREATE TABLE IF NOT EXISTS `role_module` (
  `role_module_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  PRIMARY KEY (`role_module_id`),
  KEY `role_module_role_fk` (`role_id`),
  KEY `role_module_module_fk` (`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncar tablas antes de insertar `role_module`
--

TRUNCATE TABLE `role_module`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_user` varchar(30) NOT NULL,
  `user_password` varchar(256) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `create_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `role_id` int(11) NOT NULL,
  `user_status_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_user` (`user_user`),
  KEY `User_Role_FK` (`role_id`),
  KEY `User_User_Status_FK` (`user_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Truncar tablas antes de insertar `user`
--

TRUNCATE TABLE `user`;
--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`user_id`, `user_user`, `user_password`, `updated_at`, `create_at`, `role_id`, `user_status_id`) VALUES
(1, 'higuera@gmail.com', '$2y$10$Vc81tU0O6OM7.Xkcndrp0OcM6k9PZYOGWDA9DZSQnEgXwRiWs6Q5a', NULL, '2023-10-20 14:49:40', 1, 1),
(2, 'asdfsad@gasd', '$2y$10$lD7XjdL2M1oVXIosc0f.Tu8vNI/kmPUrixwtGlaBFVFxydzWqqi9S', NULL, '2023-10-20 16:52:57', 1, 1),
(4, 'asdfsad@gasdasdf', '$2y$10$IBWd04H16i/SCLfmGfOEd.RJiTo556sKKUo4b8mh2ztCYiPRFWTg.', NULL, '2023-10-20 16:57:51', 1, 1),
(6, 'asdfasdfasdfasdf@sadfasdfasd', '$2y$10$o8cbj4KCu7L.GafNYZuDKedqy1escHZdgIu95QJnlRmi0G4zU6OZS', NULL, '2023-10-20 17:01:46', 1, 1),
(8, 'asdfasdfasdfasdf@sadfasdfasdfa', '$2y$10$DN68JsGQqx5SOKd/BnxtgODdJfoK4WdjDEnxbrWKT02V8baeZzR/6', NULL, '2023-10-20 17:02:17', 1, 1),
(10, 'sisoyyosebastian@gmail.com', '$2y$10$At./i5yRqJNrvVRRWhMGVemKLPnFNU599Kqew8f.9SirX2dq385LS', NULL, '2023-10-20 17:03:35', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_status`
--

DROP TABLE IF EXISTS `user_status`;
CREATE TABLE IF NOT EXISTS `user_status` (
  `user_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_status_name` varchar(20) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `create_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_status_id`),
  UNIQUE KEY `user_status_name` (`user_status_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Truncar tablas antes de insertar `user_status`
--

TRUNCATE TABLE `user_status`;
--
-- Volcado de datos para la tabla `user_status`
--

INSERT INTO `user_status` (`user_status_id`, `user_status_name`, `updated_at`, `create_at`) VALUES
(1, 'active', NULL, '2023-10-20 14:47:50'),
(2, 'inactive', NULL, '2023-10-20 14:47:50');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `role_module`
--
ALTER TABLE `role_module`
  ADD CONSTRAINT `role_module_module_fk` FOREIGN KEY (`module_id`) REFERENCES `module` (`module_id`),
  ADD CONSTRAINT `role_module_role_fk` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`);

--
-- Filtros para la tabla `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `User_Role_FK` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`),
  ADD CONSTRAINT `User_User_Status_FK` FOREIGN KEY (`user_status_id`) REFERENCES `user_status` (`user_status_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
