CREATE DATABASE `mini_homebroke_dev` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE mini_homebroke_dev;

CREATE TABLE `ativos` (
  `codigo` varchar(255) NOT NULL,
  `preco` decimal(10,2) DEFAULT NULL,
  `inserted_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `ativos` VALUES("BBAS3",31.82,"2022-01-26 20:52:08","2022-01-26 20:52:08");
INSERT INTO `ativos` VALUES("EMBR3",19.21,"2022-01-26 20:51:04","2022-01-26 20:51:04");
INSERT INTO `ativos` VALUES("ITUB4",29.81,"2022-01-26 20:51:43","2022-01-26 20:51:43");
INSERT INTO `ativos` VALUES("VALE3",114.62,"2022-01-26 20:52:21","2022-01-26 20:52:21");

CREATE TABLE `ordens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `codigo_ativo` varchar(255) DEFAULT NULL,
  `tipo` int DEFAULT NULL,
  `quantidade` int DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  `inserted_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ordens_codigo_ativo_fkey` (`codigo_ativo`),
  CONSTRAINT `ordens_codigo_ativo_fkey` FOREIGN KEY (`codigo_ativo`) REFERENCES `ativos` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


ALTER TABLE `ordens`
ADD CONSTRAINT chkTipo CHECK (`tipo` in (1,2));

