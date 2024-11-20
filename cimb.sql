-- phpMyAdmin SQL Dump
-- version 5.2.1deb3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 20/11/2024 às 12:32
-- Versão do servidor: 8.0.40-0ubuntu0.24.04.1
-- Versão do PHP: 8.3.6

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
-- Estrutura para tabela `Coordenadorias`
--

CREATE TABLE `Coordenadorias` (
  `ID` int NOT NULL,
  `sigla_coord` varchar(6) NOT NULL COMMENT 'Sigla da coordenadoria',
  `nome_coord` varchar(100) NOT NULL COMMENT 'Nome da Coordenadoria'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `Coordenadorias`
--

INSERT INTO `Coordenadorias` (`ID`, `sigla_coord`, `nome_coord`) VALUES
(1, 'GAB', 'GABINETE'),
(2, 'CAF', 'COORDENADORIA DE ADMINISTRAÇÃO E FINANÇAS'),
(3, 'CODDEC', 'COORDENADORIA DISTRITAL DE DEFESA CIVIL'),
(4, 'CPDU', 'COORDENADORIA DE PLANEJAMENTO E DESENVOLVIMENTO URBANO'),
(5, 'CGL', 'COORDENADORIA DE GOVERNO LOCAL'),
(6, 'CPO', 'COORDENADORIA DE PROJETOS E OBRAS');

-- --------------------------------------------------------

--
-- Estrutura para tabela `CPUs`
--

CREATE TABLE `CPUs` (
  `ID` int NOT NULL,
  `nome_cpu` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Nome da CPU',
  `coord_id` int NOT NULL,
  `setor_id` int NOT NULL,
  `ult_usuario` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Último Usuário',
  `patrimonio_cpu` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Patrimônio',
  `servicetag_cpu` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Service Tag',
  `office_email` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'e-Mail do Office',
  `office_senha` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Senha do Office',
  `office_serial` varchar(29) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Serial do Office',
  `marca` enum('HP','DELL','ITAUTEC','POSITIVO') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Marca',
  `modelo` enum('ELITEDESK 800 G4 DM','OPTIPLEX 3070') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Modelo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `CPUs`
--

INSERT INTO `CPUs` (`ID`, `nome_cpu`, `coord_id`, `setor_id`, `ult_usuario`, `patrimonio_cpu`, `servicetag_cpu`, `office_email`, `office_senha`, `office_serial`, `marca`, `modelo`) VALUES
(1, 'SMSPMPC000', 1, 43, 'FERNANDO', '001.052161184-8', NULL, NULL, NULL, NULL, 'HP', 'ELITEDESK 800 G4 DM'),
(2, 'SUBMPC001', 1, 4, 'VANESSA', '001.052234223-9', 'BJM1R23', 'bjm1r23@outlook.com', 'mpinfo@2021', 'QFJHN-7JXCX-DTHKG-4HX4R-W8HHX', 'DELL', 'OPTIPLEX 3070'),
(3, 'SUBMPC002', 1, 28, 'MARISA', '001.052234247-6', 'BBYVQ23', 'bbyvq23@outlook.com', 'mpinfo2019', 'KJKVP-JNRJK-BMBKW-P3WM2-D7B39', 'DELL', 'OPTIPLEX 3070'),
(4, 'SUBMPC003', 4, 64, 'JOÃO BATISTA', '001.052234238-7', 'BD53R23', 'bd53r23@outlook.com', 'mpinfo2019', NULL, 'DELL', 'OPTIPLEX 3070'),
(5, 'SUBMPC004', 2, 29, 'SERGIO', '001.052234216-6', 'BC63R23', 'bc63r23@outlook.com', 'mpinfo@2022', 'JFWNP-K7RTB-7JWGT-JGRXT-P7K7X', 'DELL', 'OPTIPLEX 3070'),
(6, 'SUBMPC005', 2, 63, 'DANIELA', '001.052234192-5', 'BKH2R23', 'bkh2r23@outlook.com', 'mpinfo2019', 'NPT7T-PWCR8-X4FF6-RTYFC-MP3VX', 'DELL', 'OPTIPLEX 3070'),
(7, 'SUBMPC006', 1, 98, 'CADU', '001.052234256-5', 'BHXWQ23', 'bhxwq23@outlook.com', 'mpinfo@2019', NULL, 'DELL', 'OPTIPLEX 3070'),
(8, 'SUBMPC009', 2, 63, 'LETÍCIA', '001.052234195-0', 'BBNWQ23', 'bbnwq23@outlook.com', NULL, 'XPQFB-N78WP-FKQ68-F9X24-K4VHX', 'DELL', 'OPTIPLEX 3070'),
(9, 'SUBMPC010', 2, 13, 'VALMIR', '001.052234191-7', 'BH90R23', 'bh90r23@outlook.com', 'mpinfo@2022', NULL, 'DELL', 'OPTIPLEX 3070'),
(10, 'SUBMPC040', 2, 63, 'GAUCHO', '001.052236669-3', 'BGJZQ23', 'bgjzq23@outlook.com', 'Q!Akloi9', 'VQ2N4-4FFVM-4YQ62-MTF2F-37B39', 'DELL', 'OPTIPLEX 3070'),
(11, 'SUBMPC008', 2, 35, 'JONHANSON', '001.052234200-0', 'BHR2R23', 'bhr2r23@outlook.com', 'mpinfo2019', 'JRKNC-TXHHK-KYWGX-TVWGV-QPGMK', 'DELL', 'OPTIPLEX 3070');

--
-- Acionadores `CPUs`
--
DELIMITER $$
CREATE TRIGGER `nome_cpu` 
BEFORE INSERT ON `CPUs`
FOR EACH ROW 
BEGIN
    SET NEW.nome_cpu = UPPER(NEW.nome_cpu);
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER `office_email` 
BEFORE INSERT ON `CPUs` 
FOR EACH ROW 
BEGIN 
    SET NEW.office_email = LOWER(NEW.office_email);
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER `office_serial` 
BEFORE INSERT ON `CPUs` 
FOR EACH ROW 
BEGIN 
    SET NEW.office_serial = UPPER(NEW.office_serial);
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER `servicetag_cpu` 
BEFORE INSERT ON `CPUs` 
FOR EACH ROW 
BEGIN 
    SET NEW.servicetag_cpu = UPPER(NEW.servicetag_cpu);
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER `ult_usuario` 
BEFORE INSERT ON `CPUs` 
FOR EACH ROW 
BEGIN
    SET NEW.ult_usuario = UPPER(NEW.ult_usuario);
END$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `Dispositivos`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `Dispositivos` (
`ID` int
,`marca` enum('HP','DELL','ITAUTEC','POSITIVO')
,`modelo` enum('ELITEDESK 800 G4 DM','OPTIPLEX 3070')
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
-- Estrutura para tabela `Monitores`
--

CREATE TABLE `Monitores` (
  `ID` int NOT NULL,
  `coord_id` int NOT NULL,
  `setor_id` int NOT NULL,
  `cpu_id` int DEFAULT NULL,
  `patrimonio_monitor` varchar(15) DEFAULT NULL,
  `servicetag_monitor` varchar(7) DEFAULT NULL,
  `serial_monitor` varchar(28) DEFAULT NULL,
  `marca` varchar(10) DEFAULT NULL,
  `modelo` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `Monitores`
--

INSERT INTO `Monitores` (`ID`, `coord_id`, `setor_id`, `cpu_id`, `patrimonio_monitor`, `servicetag_monitor`, `serial_monitor`, `marca`, `modelo`) VALUES
(1, 1, 43, 1, '001.05261401-4', NULL, 'GNSJ5XA003922', 'AOC', '24P1U');

-- --------------------------------------------------------

--
-- Estrutura para tabela `Setores`
--

CREATE TABLE `Setores` (
  `ID` int NOT NULL,
  `sigla_setor` varchar(6) NOT NULL COMMENT 'Sigla do Setor',
  `nome_setor` varchar(70) NOT NULL COMMENT 'Nome da Unidade Administrativa'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `Setores`
--

INSERT INTO `Setores` (`ID`, `sigla_setor`, `nome_setor`) VALUES
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
-- Estrutura para view `Dispositivos`
--
DROP TABLE IF EXISTS `Dispositivos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `Dispositivos`  AS SELECT `CPUs`.`ID` AS `ID`, `CPUs`.`nome_cpu` AS `nome_cpu`, `Coordenadorias`.`sigla_coord` AS `sigla_coord`, `Coordenadorias`.`nome_coord` AS `nome_coord`, `Setores`.`sigla_setor` AS `sigla_setor`, `Setores`.`nome_setor` AS `nome_setor`, `CPUs`.`ult_usuario` AS `ult_usuario`, `CPUs`.`patrimonio_cpu` AS `patrimonio_cpu`, `CPUs`.`servicetag_cpu` AS `servicetag_cpu`, `CPUs`.`office_email` AS `office_email`, `CPUs`.`office_senha` AS `office_senha`, `CPUs`.`office_serial` AS `office_serial`, `CPUs`.`marca` AS `marca`, `CPUs`.`modelo` AS `modelo` FROM ((`CPUs` left join `Coordenadorias` on((`CPUs`.`coord_id` = `Coordenadorias`.`ID`))) left join `Setores` on((`CPUs`.`setor_id` = `Setores`.`ID`))) ;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `Coordenadorias`
--
ALTER TABLE `Coordenadorias`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `nome_UNIQUE` (`nome_coord`) USING BTREE,
  ADD UNIQUE KEY `sigla_UNIQUE` (`sigla_coord`) USING BTREE;

--
-- Índices de tabela `CPUs`
--
ALTER TABLE `CPUs`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `CPUs_UNIQUE` (`nome_cpu`),
  ADD UNIQUE KEY `servicetag_UNIQUE` (`servicetag_cpu`),
  ADD UNIQUE KEY `patrimonio_UNIQUE` (`patrimonio_cpu`),
  ADD UNIQUE KEY `emailoffice_UNIQUE` (`office_email`),
  ADD KEY `CPUs_ibfk_1` (`coord_id`),
  ADD KEY `CPUs_ibfk_2` (`setor_id`);

--
-- Índices de tabela `Monitores`
--
ALTER TABLE `Monitores`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `serial_UNIQUE` (`serial_monitor`),
  ADD UNIQUE KEY `patrimonio_UNIQUE` (`patrimonio_monitor`),
  ADD UNIQUE KEY `servicetag_UNIQUE` (`servicetag_monitor`),
  ADD KEY `Monitores_ibfk_1` (`coord_id`),
  ADD KEY `Monitores_ibfk_2` (`cpu_id`),
  ADD KEY `Monitores_ibfk_3` (`setor_id`);

--
-- Índices de tabela `Setores`
--
ALTER TABLE `Setores`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `nome_UNIQUE` (`nome_setor`) USING BTREE,
  ADD UNIQUE KEY `sigla_UNIQUE` (`sigla_setor`) USING BTREE;

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `Coordenadorias`
--
ALTER TABLE `Coordenadorias`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `CPUs`
--
ALTER TABLE `CPUs`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `Monitores`
--
ALTER TABLE `Monitores`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `Setores`
--
ALTER TABLE `Setores`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `CPUs`
--
ALTER TABLE `CPUs`
  ADD CONSTRAINT `CPUs_ibfk_1` FOREIGN KEY (`coord_id`) REFERENCES `Coordenadorias` (`ID`),
  ADD CONSTRAINT `CPUs_ibfk_2` FOREIGN KEY (`setor_id`) REFERENCES `Setores` (`ID`);

--
-- Restrições para tabelas `Monitores`
--
ALTER TABLE `Monitores`
  ADD CONSTRAINT `Monitores_ibfk_1` FOREIGN KEY (`coord_id`) REFERENCES `Coordenadorias` (`ID`),
  ADD CONSTRAINT `Monitores_ibfk_2` FOREIGN KEY (`cpu_id`) REFERENCES `CPUs` (`ID`),
  ADD CONSTRAINT `Monitores_ibfk_3` FOREIGN KEY (`setor_id`) REFERENCES `Setores` (`ID`);
--
-- Banco de dados: `phpmyadmin`
--
DROP DATABASE IF EXISTS `phpmyadmin`;
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int UNSIGNED NOT NULL,
  `dbase` varchar(255) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `query` text COLLATE utf8mb3_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `col_length` text COLLATE utf8mb3_bin,
  `col_collation` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8mb3_bin DEFAULT '',
  `col_default` text COLLATE utf8mb3_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8mb3_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `settings_data` text COLLATE utf8mb3_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8mb3_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `template_data` text COLLATE utf8mb3_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `tables` text COLLATE utf8mb3_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sqlquery` text COLLATE utf8mb3_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8mb3_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `page_nr` int UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `tables` text COLLATE utf8mb3_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Recently accessed tables';

--
-- Despejando dados para a tabela `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"cimb\",\"table\":\"CPUs\"},{\"db\":\"cimb\",\"table\":\"Dispositivos\"},{\"db\":\"cimb\",\"table\":\"Setores\"},{\"db\":\"cimb\",\"table\":\"Coordenadorias\"},{\"db\":\"cimb\",\"table\":\"Dispositivo\"}]');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8mb3_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8mb3_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `pdf_page_number` int NOT NULL DEFAULT '0',
  `x` float UNSIGNED NOT NULL DEFAULT '0',
  `y` float UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8mb3_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `prefs` text COLLATE utf8mb3_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Tables'' UI preferences';

--
-- Despejando dados para a tabela `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'cimb', 'Setores', '{\"sorted_col\":\"`ID` DESC\"}', '2024-11-17 23:05:31');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `version` int UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8mb3_bin NOT NULL,
  `schema_sql` text COLLATE utf8mb3_bin,
  `data_sql` longtext COLLATE utf8mb3_bin,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8mb3_bin DEFAULT NULL,
  `tracking_active` int UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` text COLLATE utf8mb3_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Despejando dados para a tabela `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2024-11-20 10:46:17', '{\"lang\":\"pt_BR\",\"Console\\/Mode\":\"collapse\",\"NavigationWidth\":193,\"ThemeDefault\":\"metro\"}');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8mb3_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8mb3_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Users and their assignments to user groups';

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Índices de tabela `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Índices de tabela `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Índices de tabela `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Índices de tabela `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Índices de tabela `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Índices de tabela `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Índices de tabela `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Índices de tabela `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Índices de tabela `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Índices de tabela `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Índices de tabela `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Índices de tabela `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Índices de tabela `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Índices de tabela `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Índices de tabela `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Índices de tabela `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Índices de tabela `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
