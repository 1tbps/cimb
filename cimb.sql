-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 21/11/2024 às 13:05
-- Versão do servidor: 9.1.0
-- Versão do PHP: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `cimb`
--
DROP DATABASE IF EXISTS `cimb`;
CREATE DATABASE IF NOT EXISTS `cimb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `cimb`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `coordenadorias`
--

DROP TABLE IF EXISTS `coordenadorias`;
CREATE TABLE IF NOT EXISTS `coordenadorias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sigla_coord` varchar(6) NOT NULL COMMENT 'Sigla da coordenadoria',
  `nome_coord` varchar(100) NOT NULL COMMENT 'Nome da Coordenadoria',
  PRIMARY KEY (`id`),
  UNIQUE KEY `nome_UNIQUE` (`nome_coord`) USING BTREE,
  UNIQUE KEY `sigla_UNIQUE` (`sigla_coord`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `coordenadorias`
--

INSERT INTO `coordenadorias` (`id`, `sigla_coord`, `nome_coord`) VALUES
(1, 'GAB', 'GABINETE'),
(2, 'CAF', 'COORDENADORIA DE ADMINISTRAÇÃO E FINANÇAS'),
(3, 'CODDEC', 'COORDENADORIA DISTRITAL DE DEFESA CIVIL'),
(4, 'CPDU', 'COORDENADORIA DE PLANEJAMENTO E DESENVOLVIMENTO URBANO'),
(5, 'CGL', 'COORDENADORIA DE GOVERNO LOCAL'),
(6, 'CPO', 'COORDENADORIA DE PROJETOS E OBRAS');

-- --------------------------------------------------------

--
-- Estrutura para tabela `cpus`
--

DROP TABLE IF EXISTS `cpus`;
CREATE TABLE IF NOT EXISTS `cpus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome_cpu` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Nome da CPU',
  `coord_id` int NOT NULL,
  `setor_id` int NOT NULL,
  `ult_usuario` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Último Usuário',
  `patrimonio_cpu` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Patrimônio',
  `servicetag_cpu` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Service Tag',
  `office_email` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'e-Mail do Office',
  `office_senha` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Senha do Office',
  `office_serial` varchar(29) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Serial do Office',
  `marca_id` int NOT NULL,
  `modelo_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cpus_UNIQUE` (`nome_cpu`),
  UNIQUE KEY `servicetag_UNIQUE` (`servicetag_cpu`),
  UNIQUE KEY `patrimonio_UNIQUE` (`patrimonio_cpu`),
  KEY `cpus_COORD` (`coord_id`) USING BTREE,
  KEY `cpus_SETOR` (`setor_id`) USING BTREE,
  KEY `cpus_MARCA` (`marca_id`) USING BTREE,
  KEY `cpus_MODELO` (`modelo_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `cpus`
--

INSERT INTO `cpus` (`id`, `nome_cpu`, `coord_id`, `setor_id`, `ult_usuario`, `patrimonio_cpu`, `servicetag_cpu`, `office_email`, `office_senha`, `office_serial`, `marca_id`, `modelo_id`) VALUES
(1, 'SMSPMPC000', 1, 43, 'FERNANDO', '001.052161184-8', NULL, NULL, NULL, NULL, 2, 1),
(2, 'SUBMPC001', 1, 4, 'VANESSA', '001.052234223-9', 'BJM1R23', 'bjm1r23@outlook.com', 'mpinfo@2021', 'QFJHN-7JXCX-DTHKG-4HX4R-W8HHX', 3, 2),
(3, 'SUBMPC002', 1, 28, 'MARISA', '001.052234247-6', 'BBYVQ23', 'bbyvq23@outlook.com', 'mpinfo2019', 'KJKVP-JNRJK-BMBKW-P3WM2-D7B39', 3, 2),
(4, 'SUBMPC003', 4, 64, 'JOÃO BATISTA', '001.052234238-7', 'BD53R23', 'bd53r23@outlook.com', 'mpinfo2019', NULL, 3, 2),
(5, 'SUBMPC004', 2, 29, 'SERGIO', '001.052234216-6', 'BC63R23', 'bc63r23@outlook.com', 'mpinfo@2022', 'JFWNP-K7RTB-7JWGT-JGRXT-P7K7X', 3, 2),
(6, 'SUBMPC005', 2, 63, 'DANIELA', '001.052234192-5', 'BKH2R23', 'bkh2r23@outlook.com', 'mpinfo2019', 'NPT7T-PWCR8-X4FF6-RTYFC-MP3VX', 3, 2),
(7, 'SUBMPC006', 1, 98, 'CADU', '001.052234256-5', 'BHXWQ23', 'bhxwq23@outlook.com', 'mpinfo@2019', NULL, 3, 2),
(8, 'SUBMPC009', 2, 63, 'LETÍCIA', '001.052234195-0', 'BBNWQ23', 'bbnwq23@outlook.com', NULL, 'XPQFB-N78WP-FKQ68-F9X24-K4VHX', 3, 2),
(9, 'SUBMPC010', 2, 13, 'VALMIR', '001.052234191-7', 'BH90R23', 'bh90r23@outlook.com', 'mpinfo@2022', NULL, 3, 2),
(10, 'SUBMPC040', 2, 63, 'GAUCHO', '001.052236669-3', 'BGJZQ23', 'bgjzq23@outlook.com', 'Q!Akloi9', 'VQ2N4-4FFVM-4YQ62-MTF2F-37B39', 3, 2),
(11, 'SUBMPC008', 2, 35, 'JONHANSON', '001.052234200-0', 'BHR2R23', 'bhr2r23@outlook.com', 'mpinfo2019', 'JRKNC-TXHHK-KYWGX-TVWGV-QPGMK', 3, 2),
(12, 'SUBMPC011', 4, 64, 'SANDRA', '001.052234209-3', 'BKQQZ23', 'bjm1r23@outlook.com', 'mpinfo@2021', '', 3, 2);

--
-- Acionadores `cpus`
--
DROP TRIGGER IF EXISTS `nome_cpu`;
DELIMITER $$
CREATE TRIGGER `nome_cpu` BEFORE INSERT ON `cpus` FOR EACH ROW BEGIN
    SET NEW
        .nome_cpu = UPPER(NEW.nome_cpu);
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `office_email`;
DELIMITER $$
CREATE TRIGGER `office_email` BEFORE INSERT ON `cpus` FOR EACH ROW BEGIN
    SET NEW
        .office_email = LOWER(NEW.office_email);
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `office_serial`;
DELIMITER $$
CREATE TRIGGER `office_serial` BEFORE INSERT ON `cpus` FOR EACH ROW BEGIN
    SET NEW
        .office_serial = UPPER(NEW.office_serial);
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `servicetag_cpu`;
DELIMITER $$
CREATE TRIGGER `servicetag_cpu` BEFORE INSERT ON `cpus` FOR EACH ROW BEGIN
    SET NEW
        .servicetag_cpu = UPPER(NEW.servicetag_cpu);
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `ult_usuario`;
DELIMITER $$
CREATE TRIGGER `ult_usuario` BEFORE INSERT ON `cpus` FOR EACH ROW BEGIN
    SET NEW
        .ult_usuario = UPPER(NEW.ult_usuario);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `dispositivos`
-- (Veja abaixo para a visão atual)
--
DROP VIEW IF EXISTS `dispositivos`;
CREATE TABLE IF NOT EXISTS `dispositivos` (
`id` int
,`marca` varchar(10)
,`modelo` varchar(25)
,`nome_coord` varchar(100)
,`nome_cpu` varchar(10)
,`nome_setor` varchar(70)
,`office_email` varchar(30)
,`office_senha` varchar(12)
,`office_serial` varchar(29)
,`patrimonio_cpu` varchar(15)
,`servicetag_cpu` varchar(7)
,`sigla_coord` varchar(6)
,`sigla_setor` varchar(6)
,`ult_usuario` varchar(15)
);

-- --------------------------------------------------------

--
-- Estrutura para tabela `marcas`
--

DROP TABLE IF EXISTS `marcas`;
CREATE TABLE IF NOT EXISTS `marcas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `marca` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `marca` (`marca`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `marcas`
--

INSERT INTO `marcas` (`id`, `marca`) VALUES
(3, 'DELL'),
(2, 'HP'),
(4, 'ITAUTEC'),
(1, 'POSITIVO');

-- --------------------------------------------------------

--
-- Estrutura para tabela `modelos`
--

DROP TABLE IF EXISTS `modelos`;
CREATE TABLE IF NOT EXISTS `modelos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `modelo` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `marca_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Modelo` (`modelo`),
  KEY `marca_id` (`marca_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `modelos`
--

INSERT INTO `modelos` (`id`, `modelo`, `marca_id`) VALUES
(1, 'ELITEDESK 800 G4 DM', 2),
(2, 'OPTIPLEX 3070', 3);

-- --------------------------------------------------------

--
-- Estrutura para tabela `monitores`
--

DROP TABLE IF EXISTS `monitores`;
CREATE TABLE IF NOT EXISTS `monitores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `coord_id` int NOT NULL,
  `setor_id` int NOT NULL,
  `cpu_id` int DEFAULT NULL,
  `patrimonio_monitor` varchar(15) DEFAULT NULL,
  `servicetag_monitor` varchar(7) DEFAULT NULL,
  `serial_monitor` varchar(28) DEFAULT NULL,
  `marca` varchar(10) DEFAULT NULL,
  `modelo` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `serial_UNIQUE` (`serial_monitor`),
  UNIQUE KEY `patrimonio_UNIQUE` (`patrimonio_monitor`),
  UNIQUE KEY `servicetag_UNIQUE` (`servicetag_monitor`),
  KEY `Monitores_ibfk_1` (`coord_id`),
  KEY `Monitores_ibfk_2` (`cpu_id`),
  KEY `Monitores_ibfk_3` (`setor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `monitores`
--

INSERT INTO `monitores` (`id`, `coord_id`, `setor_id`, `cpu_id`, `patrimonio_monitor`, `servicetag_monitor`, `serial_monitor`, `marca`, `modelo`) VALUES
(1, 1, 43, 1, '001.05261401-4', NULL, 'GNSJ5XA003922', 'AOC', '24P1U');

-- --------------------------------------------------------

--
-- Estrutura para tabela `setores`
--

DROP TABLE IF EXISTS `setores`;
CREATE TABLE IF NOT EXISTS `setores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sigla_setor` varchar(6) NOT NULL COMMENT 'Sigla do Setor',
  `nome_setor` varchar(70) NOT NULL COMMENT 'Nome da Unidade Administrativa',
  PRIMARY KEY (`id`),
  UNIQUE KEY `nome_UNIQUE` (`nome_setor`) USING BTREE,
  UNIQUE KEY `sigla_UNIQUE` (`sigla_setor`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `setores`
--

INSERT INTO `setores` (`id`, `sigla_setor`, `nome_setor`) VALUES
(1, 'ABAST', 'SETOR DE ABASTECIMENTO'),
(2, 'AC', 'ASSESSORIA DE COMUNICAÇÃO'),
(3, 'AD', 'ADMINISTRAÇÃO'),
(4, 'AJ', 'ASSESSORIA JURÍDICA'),
(5, 'AMOL', 'AMOXARIFADO LEVE'),
(6, 'AMOP', 'AMOXARIFADO DE PEÇAS'),
(7, 'APROV', 'UNIDADE TÉCNICA DE APROVAÇÃO DE PROJETOS'),
(8, 'ARMAZ', 'ARMAZENAMENTO'),
(9, 'AT', 'ASSESSORIA TÉCNICA'),
(10, 'AUTPRO', 'SETOR DE AUTUAÇÃO E PROTOCOLO'),
(11, 'CAD', 'SETOR DE CADASTRO'),
(12, 'CAE', 'CAMARA DE ANIMAÇÃO ECONOMICA'),
(13, 'CAF', 'COORDENADORIA DE ADMINISTRAÇÃO E FINANÇAS'),
(14, 'CC', 'CASA DE CULTURA'),
(15, 'CG', 'CHEFIA DE GABINETE'),
(16, 'CIPA', 'COMISSÃO INTERNA DE PREVENÇÃO DE ACIDENTES'),
(17, 'CODDEC', 'COORDENADORIA DISTRITAL DE DEFESA CIVIL'),
(18, 'COM', 'COMPRAS'),
(19, 'CPDU', 'COORDENADORIA DE PLANEJAMENTO E DESENVOLVIMENTO URBANO'),
(20, 'CPO', 'COORDENADORIA DE PROJETOS E OBRAS'),
(21, 'CTUTJH', 'CONSELHO TUTELAR DO JARDIM HELENA'),
(22, 'CTUTSM', 'CONSELHO TUTELAR DE SÃO MIGUEL'),
(23, 'CULT', 'SUPERVISÃO DE CULTURA'),
(24, 'DAP', 'UNIDADE TÉCNICA DE DESENVOLVIMENTO E ACOMPANHAMENTO PROFISSIONAL'),
(25, 'DLDVP', 'DIVISÃO DE LIMPEZA E DRENAGEM EM VIAS PÚBLICAS'),
(26, 'ELEVEI', 'SETOR DE ELÉTRICA DE VEÍCULOS'),
(27, 'EV', 'EVENTOS'),
(28, 'EXP', 'EXPEDIENTE DO GABINETE'),
(29, 'EXPED', 'EXPEDIENTE'),
(30, 'EXPON', 'EXPEDIENTE E PONTO'),
(31, 'FER', 'FERRAMENTARIA'),
(32, 'FROTA', 'FROTA'),
(33, 'FUN', 'FUNILARIA'),
(34, 'G', 'GABINETE DO SUBPREFEITO'),
(35, 'IMD', 'UNIDADE DE INGRESSO, MOVIMENTAÇÃO E DESLIGAMENTO'),
(36, 'LIC', 'UNIDADE TÉCNICA DE LICENCIAMENTOS'),
(37, 'LICENC', 'LICENCIAMENTO'),
(38, 'LICIT', 'LICITAÇÃO REUNIÃO'),
(39, 'LUB', 'LUBRIFICAÇÃO'),
(40, 'MANUT', 'MANUTENÇÃO'),
(41, 'MM', 'MERCADO MUNICIPAL'),
(42, 'NGAE', 'NÚCLEO DE GESTÃO E AÇÕES ESTRATÉGICAS'),
(43, 'AGTI', 'ASSESSORIA DE GESTÃO E TECNOLOGIA DA INFORMAÇÃO'),
(44, 'NUQ', 'NÚCLEO DE QUALIDADE'),
(45, 'PAT', 'PRAÇA DE ATENDIMENTO'),
(46, 'PATRI', 'PATRIMÔNIO'),
(47, 'PL', 'PONTO DE LEITURA'),
(48, 'RECG', 'RECEPÇÃO DO GABINETE'),
(49, 'REF', 'REFEITÓRIO'),
(50, 'REFPR', 'REFEITÓRIO PIRES DO RIO'),
(51, 'REFS', 'REFEITÓRIO SEDE'),
(52, 'RFP', 'UNIDADE DE REMUNERAÇÃO E FOLHA DE PAGAMENTO'),
(53, 'SAS', 'SUPERVISÃO DE ADMINISTRAÇÃO E SUPRIMENTOS'),
(54, 'SC', 'SALA DO COORDENADOR'),
(55, 'SUBC', 'SUB-CHEFIA'),
(56, 'SEBOR', 'SETOR DE BORRACHARIA'),
(57, 'SECOR', 'SETOR DE CORREGOS-GALERIAS E CANAIS'),
(58, 'SEL', 'SUPERVISÃO DE ESPORTES E LAZER'),
(59, 'SEMAQ', 'SETOR DE MÁQUINAS'),
(60, 'SEPIN', 'SETOR DE PINTURA'),
(61, 'SEREPR', 'SETOR DE REPROGRAFIA'),
(62, 'SETRAF', 'SETOR DE TRÁFEGO'),
(63, 'SF', 'SUPERVISÃO DE FINANÇAS'),
(64, 'SFISC', 'SUPERVISÃO DE FISCALIZAÇÃO'),
(65, 'SGS', 'SETOR DE GUIAS E SARJETAS'),
(66, 'SHAB', 'SUPERVISÃO DE HABITAÇÃO'),
(67, 'SJSV', 'SACOLÃO JARDIM SÃO VICENTE'),
(68, 'SLP', 'SUPERVISÃO DE LIMPEZA PÚBLICA'),
(69, 'SR', 'SALA DE REUNIÃO'),
(70, 'SS', 'SALA DO SUPERVISOR'),
(71, 'SSEC', 'SALAS DAS SECRETARIAS'),
(72, 'SSUB', 'SALA DO SUBPREFEITO'),
(73, 'STB', 'SETOR DE TAPA BURACO'),
(74, 'STLP', 'SUPERVISÃO TÉCNICA DE LIMPEZA PÚBLICA'),
(75, 'STM', 'SUPERVISÃO TÉCNICA DE MANUTENÇÃO'),
(76, 'STPO', 'SUPERVISÃO TÉCNICA DE PROJETOS E OBRAS'),
(77, 'SUGESP', 'SUPERVISÃO DE GESTÃO DE PESSOAS'),
(78, 'SUSL', 'SUPERVISÃO TÉCNICA DE USO DO SOLO E LICENCIAMENTOS'),
(79, 'TEL', 'TELEFONIA'),
(80, 'TORN', 'TORNEARIA'),
(81, 'TRAF', 'SEDE'),
(82, 'UAV', 'UNIDADES DE ÁREAS VERDES'),
(83, 'UDO', 'UNIDADE DE DEPÓSITO E OFICINA'),
(84, 'UNAI', 'UNIDADE DE AUTOS DE INFRAÇÃO'),
(85, 'UTI', 'UNIDADE DE TRANSPORTES INTERNOS-CHEFIA'),
(86, 'UV', 'UNIDADE DE VARRIÇÃO'),
(87, 'VEST', 'VESTIARIO'),
(88, 'VPORT', 'VIGIA PORTARIA'),
(89, 'ZALMOX', 'ZELADORIA-ALMOXARIFADO'),
(90, 'ZAUD', 'ZELADORIA-AUDITÓRIO'),
(91, 'ZBB', 'ZELADORIA SALA DE BENS PARA BAIXA'),
(92, 'ZDA', 'ZELADORIA-DEPÓSITO AUDITÓRIO'),
(93, 'ZELIMP', 'ZELADORIA -LIMPEZA'),
(94, 'ZEMAN', 'ZELADORIA-MANUTENÇÃO'),
(95, 'ZEPORT', 'ZELADORIA-PORTARIAS-GUARITA'),
(96, 'ZETEL', 'ZELADORIA-QUADRO GERAL DE TELEFONIA'),
(97, 'ZEXP', 'ZELADORIA-EXPEDIENTE'),
(98, 'CGL', 'COORDENADORIA DE GOVERNO LOCAL');

-- --------------------------------------------------------

--
-- Estrutura para view `dispositivos`
--
DROP TABLE IF EXISTS `dispositivos`;

DROP VIEW IF EXISTS `dispositivos`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `dispositivos`  AS SELECT `cpus`.`id` AS `id`, `cpus`.`nome_cpu` AS `nome_cpu`, `coordenadorias`.`sigla_coord` AS `sigla_coord`, `coordenadorias`.`nome_coord` AS `nome_coord`, `setores`.`sigla_setor` AS `sigla_setor`, `setores`.`nome_setor` AS `nome_setor`, `cpus`.`ult_usuario` AS `ult_usuario`, `cpus`.`patrimonio_cpu` AS `patrimonio_cpu`, `cpus`.`servicetag_cpu` AS `servicetag_cpu`, `cpus`.`office_email` AS `office_email`, `cpus`.`office_senha` AS `office_senha`, `cpus`.`office_serial` AS `office_serial`, `marcas`.`marca` AS `marca`, `modelos`.`modelo` AS `modelo` FROM ((((`cpus` left join `coordenadorias` on((`cpus`.`coord_id` = `coordenadorias`.`id`))) left join `setores` on((`cpus`.`setor_id` = `setores`.`id`))) left join `marcas` on((`cpus`.`marca_id` = `marcas`.`id`))) left join `modelos` on((`cpus`.`modelo_id` = `modelos`.`id`))) ;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `cpus`
--
ALTER TABLE `cpus`
  ADD CONSTRAINT `CPUs_ibfk_1` FOREIGN KEY (`coord_id`) REFERENCES `coordenadorias` (`id`),
  ADD CONSTRAINT `CPUs_ibfk_2` FOREIGN KEY (`setor_id`) REFERENCES `setores` (`id`),
  ADD CONSTRAINT `CPUs_ibfk_3` FOREIGN KEY (`marca_id`) REFERENCES `marcas` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `CPUs_ibfk_4` FOREIGN KEY (`modelo_id`) REFERENCES `modelos` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Restrições para tabelas `modelos`
--
ALTER TABLE `modelos`
  ADD CONSTRAINT `Modelos_ibfk_1` FOREIGN KEY (`marca_id`) REFERENCES `marcas` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Restrições para tabelas `monitores`
--
ALTER TABLE `monitores`
  ADD CONSTRAINT `Monitores_ibfk_1` FOREIGN KEY (`coord_id`) REFERENCES `coordenadorias` (`id`),
  ADD CONSTRAINT `Monitores_ibfk_2` FOREIGN KEY (`cpu_id`) REFERENCES `cpus` (`id`),
  ADD CONSTRAINT `Monitores_ibfk_3` FOREIGN KEY (`setor_id`) REFERENCES `setores` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
