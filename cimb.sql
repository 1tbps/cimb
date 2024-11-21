-- phpMyAdmin SQL Dump
-- version 5.2.1deb3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 21/11/2024 às 11:42
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
  `id` int NOT NULL,
  `sigla_coord` varchar(6) NOT NULL COMMENT 'Sigla da coordenadoria',
  `nome_coord` varchar(100) NOT NULL COMMENT 'Nome da Coordenadoria'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `Coordenadorias`
--

INSERT INTO `Coordenadorias` (`id`, `sigla_coord`, `nome_coord`) VALUES
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
  `id` int NOT NULL,
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
  `modelo_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `CPUs`
--

INSERT INTO `CPUs` (`id`, `nome_cpu`, `coord_id`, `setor_id`, `ult_usuario`, `patrimonio_cpu`, `servicetag_cpu`, `office_email`, `office_senha`, `office_serial`, `marca_id`, `modelo_id`) VALUES
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
(41, 'SUBMPC011', 4, 64, NULL, '', 'BKQQZ23', '', '', '', 3, 2);

--
-- Acionadores `CPUs`
--
DELIMITER $$
CREATE TRIGGER `nome_cpu` BEFORE INSERT ON `CPUs` FOR EACH ROW BEGIN
    SET NEW.nome_cpu = UPPER(NEW.nome_cpu)END;
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `office_email` BEFORE INSERT ON `CPUs` FOR EACH ROW BEGIN 
    SET NEW.office_email = LOWER(NEW.office_email)END;
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `office_serial` BEFORE INSERT ON `CPUs` FOR EACH ROW BEGIN 
    SET NEW.office_serial = UPPER(NEW.office_serial)END;
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `servicetag_cpu` BEFORE INSERT ON `CPUs` FOR EACH ROW BEGIN 
    SET NEW.servicetag_cpu = UPPER(NEW.servicetag_cpu)END;
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `ult_usuario` BEFORE INSERT ON `CPUs` FOR EACH ROW BEGIN
    SET NEW.ult_usuario = UPPER(NEW.ult_usuario)END;
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `Dispositivos`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `Dispositivos` (
`id` int
,`nome_cpu` varchar(10)
,`sigla_coord` varchar(6)
,`nome_coord` varchar(100)
,`sigla_setor` varchar(6)
,`nome_setor` varchar(70)
,`ult_usuario` varchar(15)
,`patrimonio_cpu` varchar(15)
,`servicetag_cpu` varchar(7)
,`office_email` varchar(30)
,`office_senha` varchar(12)
,`office_serial` varchar(29)
,`marca` varchar(10)
,`modelo` varchar(25)
);

-- --------------------------------------------------------

--
-- Estrutura para tabela `Marcas`
--

CREATE TABLE `Marcas` (
  `id` int NOT NULL,
  `marca` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `Marcas`
--

INSERT INTO `Marcas` (`id`, `marca`) VALUES
(3, 'DELL'),
(2, 'HP'),
(4, 'ITAUTEC'),
(1, 'POSITIVO');

-- --------------------------------------------------------

--
-- Estrutura para tabela `Modelos`
--

CREATE TABLE `Modelos` (
  `id` int NOT NULL,
  `modelo` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `marca_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `Modelos`
--

INSERT INTO `Modelos` (`id`, `modelo`, `marca_id`) VALUES
(1, 'ELITEDESK 800 G4 DM', 2),
(2, 'OPTIPLEX', 3);

-- --------------------------------------------------------

--
-- Estrutura para tabela `Monitores`
--

CREATE TABLE `Monitores` (
  `id` int NOT NULL,
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

INSERT INTO `Monitores` (`id`, `coord_id`, `setor_id`, `cpu_id`, `patrimonio_monitor`, `servicetag_monitor`, `serial_monitor`, `marca`, `modelo`) VALUES
(1, 1, 43, 1, '001.05261401-4', NULL, 'GNSJ5XA003922', 'AOC', '24P1U');

-- --------------------------------------------------------

--
-- Estrutura para tabela `Setores`
--

CREATE TABLE `Setores` (
  `id` int NOT NULL,
  `sigla_setor` varchar(6) NOT NULL COMMENT 'Sigla do Setor',
  `nome_setor` varchar(70) NOT NULL COMMENT 'Nome da Unidade Administrativa'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `Setores`
--

INSERT INTO `Setores` (`id`, `sigla_setor`, `nome_setor`) VALUES
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

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `Dispositivos`  AS SELECT `CPUs`.`id` AS `id`, `CPUs`.`nome_cpu` AS `nome_cpu`, `Coordenadorias`.`sigla_coord` AS `sigla_coord`, `Coordenadorias`.`nome_coord` AS `nome_coord`, `Setores`.`sigla_setor` AS `sigla_setor`, `Setores`.`nome_setor` AS `nome_setor`, `CPUs`.`ult_usuario` AS `ult_usuario`, `CPUs`.`patrimonio_cpu` AS `patrimonio_cpu`, `CPUs`.`servicetag_cpu` AS `servicetag_cpu`, `CPUs`.`office_email` AS `office_email`, `CPUs`.`office_senha` AS `office_senha`, `CPUs`.`office_serial` AS `office_serial`, `Marcas`.`marca` AS `marca`, `Modelos`.`modelo` AS `modelo` FROM ((((`CPUs` left join `Coordenadorias` on((`CPUs`.`coord_id` = `Coordenadorias`.`id`))) left join `Setores` on((`CPUs`.`setor_id` = `Setores`.`id`))) left join `Marcas` on((`CPUs`.`marca_id` = `Marcas`.`id`))) left join `Modelos` on((`CPUs`.`modelo_id` = `Modelos`.`id`))) ;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `Coordenadorias`
--
ALTER TABLE `Coordenadorias`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nome_UNIQUE` (`nome_coord`) USING BTREE,
  ADD UNIQUE KEY `sigla_UNIQUE` (`sigla_coord`) USING BTREE;

--
-- Índices de tabela `CPUs`
--
ALTER TABLE `CPUs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `CPUs_UNIQUE` (`nome_cpu`),
  ADD UNIQUE KEY `servicetag_UNIQUE` (`servicetag_cpu`),
  ADD UNIQUE KEY `patrimonio_UNIQUE` (`patrimonio_cpu`),
  ADD UNIQUE KEY `emailoffice_UNIQUE` (`office_email`),
  ADD KEY `CPUs_ibfk_1` (`coord_id`),
  ADD KEY `CPUs_ibfk_2` (`setor_id`),
  ADD KEY `marca_id` (`marca_id`),
  ADD KEY `modelo_id` (`modelo_id`);

--
-- Índices de tabela `Marcas`
--
ALTER TABLE `Marcas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `marca` (`marca`);

--
-- Índices de tabela `Modelos`
--
ALTER TABLE `Modelos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Modelo` (`modelo`),
  ADD KEY `marca_id` (`marca_id`);

--
-- Índices de tabela `Monitores`
--
ALTER TABLE `Monitores`
  ADD PRIMARY KEY (`id`),
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
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nome_UNIQUE` (`nome_setor`) USING BTREE,
  ADD UNIQUE KEY `sigla_UNIQUE` (`sigla_setor`) USING BTREE;

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `Coordenadorias`
--
ALTER TABLE `Coordenadorias`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `CPUs`
--
ALTER TABLE `CPUs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT de tabela `Marcas`
--
ALTER TABLE `Marcas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `Modelos`
--
ALTER TABLE `Modelos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `Monitores`
--
ALTER TABLE `Monitores`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `Setores`
--
ALTER TABLE `Setores`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `CPUs`
--
ALTER TABLE `CPUs`
  ADD CONSTRAINT `CPUs_ibfk_1` FOREIGN KEY (`coord_id`) REFERENCES `Coordenadorias` (`id`),
  ADD CONSTRAINT `CPUs_ibfk_2` FOREIGN KEY (`setor_id`) REFERENCES `Setores` (`id`),
  ADD CONSTRAINT `CPUs_ibfk_3` FOREIGN KEY (`marca_id`) REFERENCES `Marcas` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `CPUs_ibfk_4` FOREIGN KEY (`modelo_id`) REFERENCES `Modelos` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Restrições para tabelas `Modelos`
--
ALTER TABLE `Modelos`
  ADD CONSTRAINT `Modelos_ibfk_1` FOREIGN KEY (`marca_id`) REFERENCES `Marcas` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Restrições para tabelas `Monitores`
--
ALTER TABLE `Monitores`
  ADD CONSTRAINT `Monitores_ibfk_1` FOREIGN KEY (`coord_id`) REFERENCES `Coordenadorias` (`id`),
  ADD CONSTRAINT `Monitores_ibfk_2` FOREIGN KEY (`cpu_id`) REFERENCES `CPUs` (`id`),
  ADD CONSTRAINT `Monitores_ibfk_3` FOREIGN KEY (`setor_id`) REFERENCES `Setores` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
