SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


CREATE TABLE `alumno` (
  `id` int(11) NOT NULL,
  `n_expediente` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `apellidos` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `sexo` tinyint(1) NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `telefono` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `grado_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `alumnos_asignaturas` (
  `asignatura_id` int(11) NOT NULL,
  `alumno_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `app_users` (
  `id` int(11) NOT NULL,
  `username` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `asignatura` (
  `id` int(11) NOT NULL,
  `codigo` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nombre_ingles` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `credects` int(11) DEFAULT NULL,
  `grado_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `bloque` (
  `id` int(11) NOT NULL,
  `idencuesta` int(11) DEFAULT NULL,
  `descripcion` varchar(254) DEFAULT NULL,
  `orden` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `concepto` (
  `id` bigint(20) NOT NULL,
  `idencuesta` int(11) NOT NULL,
  `codigo` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(254) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `encuesta` (
  `id` int(11) NOT NULL,
  `idasignatura` varchar(10) NOT NULL,
  `descripcion` varchar(128) DEFAULT NULL,
  `curso_academico` smallint(6) DEFAULT NULL,
  `fecha_ini` varchar(12) DEFAULT NULL,
  `fecha_fin` varchar(12) DEFAULT NULL,
  `fecha_cierre` varchar(12) DEFAULT NULL,
  `gestor` varchar(15) DEFAULT NULL,
  `estado` smallint(6) DEFAULT NULL,
  `modificable` tinyint(1) DEFAULT NULL,
  `anonima` tinyint(1) DEFAULT NULL,
  `multiconcepto` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `estado` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `grado` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `nota` (
  `id` int(11) NOT NULL,
  `alumno_id` int(11) DEFAULT NULL,
  `asignatura_id` int(11) DEFAULT NULL,
  `n_convocatoria` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `nota` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `pregunta` (
  `id` int(11) NOT NULL,
  `idencuesta` int(11) DEFAULT NULL,
  `idbloque` int(11) DEFAULT NULL,
  `idtipo` int(11) DEFAULT NULL,
  `orden` smallint(6) NOT NULL,
  `descripcion` varchar(254) DEFAULT NULL,
  `pie` varchar(254) DEFAULT NULL,
  `salida` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `respuesta` (
  `id` int(11) NOT NULL,
  `idpregunta` int(11) DEFAULT NULL,
  `orden` smallint(6) NOT NULL,
  `descripcion` varchar(254) NOT NULL,
  `valor` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `resultado` (
  `id` int(11) NOT NULL,
  `idencuesta` int(11) DEFAULT NULL,
  `idconcepto` varchar(255) NOT NULL,
  `idpregunta` int(11) DEFAULT NULL,
  `idrespuesta` int(11) DEFAULT NULL,
  `dni` varchar(15) DEFAULT NULL,
  `valor` text,
  `fecha_auto` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tipo_pregunta` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `username` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `confirmation_token` varchar(180) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


ALTER TABLE `alumno`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_1435D52D67E69CFE` (`n_expediente`),
  ADD UNIQUE KEY `UNIQ_1435D52DE7927C74` (`email`),
  ADD UNIQUE KEY `UNIQ_1435D52DC1E70A7F` (`telefono`),
  ADD KEY `IDX_1435D52D91A441CC` (`grado_id`);

ALTER TABLE `alumnos_asignaturas`
  ADD PRIMARY KEY (`asignatura_id`,`alumno_id`),
  ADD KEY `IDX_D57EE88C5C70C5B` (`asignatura_id`),
  ADD KEY `IDX_D57EE88FC28E5EE` (`alumno_id`);

ALTER TABLE `app_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_C2502824F85E0677` (`username`),
  ADD UNIQUE KEY `UNIQ_C2502824E7927C74` (`email`);

ALTER TABLE `asignatura`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_9243D6CE20332D99` (`codigo`),
  ADD KEY `IDX_9243D6CE91A441CC` (`grado_id`);

ALTER TABLE `bloque`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `idencuesta` (`idencuesta`);

ALTER TABLE `concepto`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

ALTER TABLE `encuesta`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

ALTER TABLE `estado`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

ALTER TABLE `grado`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_B98F472A3A909126` (`nombre`);

ALTER TABLE `nota`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_C8D03E0DFC28E5EE` (`alumno_id`),
  ADD KEY `IDX_C8D03E0DC5C70C5B` (`asignatura_id`);

ALTER TABLE `pregunta`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `idencuesta` (`idencuesta`),
  ADD KEY `idbloque` (`idbloque`),
  ADD KEY `idtipo` (`idtipo`);

ALTER TABLE `respuesta`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `idpregunta` (`idpregunta`);

ALTER TABLE `resultado`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `idencuesta` (`idencuesta`),
  ADD KEY `idpregunta` (`idpregunta`),
  ADD KEY `idrespuesta` (`idrespuesta`);

ALTER TABLE `tipo_pregunta`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_2265B05D92FC23A8` (`username_canonical`),
  ADD UNIQUE KEY `UNIQ_2265B05DA0D96FBF` (`email_canonical`),
  ADD UNIQUE KEY `UNIQ_2265B05DC05FB297` (`confirmation_token`);


ALTER TABLE `alumno`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `app_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `asignatura`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

ALTER TABLE `bloque`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `concepto`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

ALTER TABLE `encuesta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `estado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `grado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `nota`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `pregunta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `respuesta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

ALTER TABLE `resultado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tipo_pregunta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `alumno`
  ADD CONSTRAINT `FK_1435D52D91A441CC` FOREIGN KEY (`grado_id`) REFERENCES `grado` (`id`);

ALTER TABLE `alumnos_asignaturas`
  ADD CONSTRAINT `FK_D57EE88C5C70C5B` FOREIGN KEY (`asignatura_id`) REFERENCES `asignatura` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_D57EE88FC28E5EE` FOREIGN KEY (`alumno_id`) REFERENCES `alumno` (`id`) ON DELETE CASCADE;

ALTER TABLE `asignatura`
  ADD CONSTRAINT `FK_9243D6CE91A441CC` FOREIGN KEY (`grado_id`) REFERENCES `grado` (`id`);

ALTER TABLE `bloque`
  ADD CONSTRAINT `FK_F1DA68E8188E204C` FOREIGN KEY (`idencuesta`) REFERENCES `encuesta` (`id`);

ALTER TABLE `nota`
  ADD CONSTRAINT `FK_C8D03E0DC5C70C5B` FOREIGN KEY (`asignatura_id`) REFERENCES `asignatura` (`id`),
  ADD CONSTRAINT `FK_C8D03E0DFC28E5EE` FOREIGN KEY (`alumno_id`) REFERENCES `alumno` (`id`);

ALTER TABLE `pregunta`
  ADD CONSTRAINT `pregunta_ibfk_1` FOREIGN KEY (`idencuesta`) REFERENCES `encuesta` (`id`),
  ADD CONSTRAINT `pregunta_ibfk_2` FOREIGN KEY (`idbloque`) REFERENCES `bloque` (`id`),
  ADD CONSTRAINT `pregunta_ibfk_3` FOREIGN KEY (`idtipo`) REFERENCES `tipo_pregunta` (`id`);

ALTER TABLE `respuesta`
  ADD CONSTRAINT `respuesta_ibfk_1` FOREIGN KEY (`idpregunta`) REFERENCES `pregunta` (`id`);

ALTER TABLE `resultado`
  ADD CONSTRAINT `resultado_ibfk_1` FOREIGN KEY (`idencuesta`) REFERENCES `encuesta` (`id`),
  ADD CONSTRAINT `resultado_ibfk_2` FOREIGN KEY (`idpregunta`) REFERENCES `pregunta` (`id`),
  ADD CONSTRAINT `resultado_ibfk_3` FOREIGN KEY (`idrespuesta`) REFERENCES `respuesta` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
