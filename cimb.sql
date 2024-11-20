SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
CREATE DATABASE cimb;
USE cimb;

CREATE TABLE Coordenadorias (
  ID int(11) NOT NULL,
  sigla_coord varchar(6) NOT NULL COMMENT 'Sigla da coordenadoria',
  nome_coord varchar(100) NOT NULL COMMENT 'Nome da Coordenadoria'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO Coordenadorias (ID, sigla_coord, nome_coord) VALUES
(1, 'GAB', 'GABINETE'),
(2, 'CAF', 'COORDENADORIA DE ADMINISTRAÇÃO E FINANÇAS'),
(3, 'CODDEC', 'COORDENADORIA DISTRITAL DE DEFESA CIVIL'),
(4, 'CPDU', 'COORDENADORIA DE PLANEJAMENTO E DESENVOLVIMENTO URBANO'),
(5, 'CPO', 'COORDENADORIA DE PROJETOS E OBRAS');

CREATE TABLE CPUs (
  ID int(11) NOT NULL,
  nome_cpu varchar(10) NOT NULL,
  coord_id int(11) NOT NULL,
  setor_id int(11) NOT NULL,
  ult_usuario varchar(15) DEFAULT NULL,
  patrimonio_cpu varchar(15) DEFAULT NULL,
  servicetag_cpu varchar(7) DEFAULT NULL,
  office_email varchar(30) DEFAULT NULL,
  office_senha varchar(12) DEFAULT NULL,
  office_serial varchar(29) DEFAULT NULL,
  marca varchar(10) DEFAULT NULL,
  modelo varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO CPUs (ID, nome_cpu, coord_id, setor_id, ult_usuario, patrimonio_cpu, servicetag_cpu, office_email, office_senha, office_serial, marca, modelo) VALUES
(1, 'SMSPMPC000', 1, 43, 'FERNANDO', '001.052161184-8', NULL, 'OFFICE 365', NULL, NULL, 'HP', 'ELITEDESK 800 G4 DM');

CREATE TABLE Monitores (
  ID int(11) NOT NULL,
  coord_id int(11) NOT NULL,
  setor_id int(11) NOT NULL,
  cpu_id int(11) DEFAULT NULL,
  patrimonio_monitor varchar(15) DEFAULT NULL,
  servicetag_monitor varchar(7) DEFAULT NULL,
  serial_monitor varchar(28) DEFAULT NULL,
  marca varchar(10) DEFAULT NULL,
  modelo varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO Monitores (ID, coord_id, setor_id, cpu_id, patrimonio_monitor, servicetag_monitor, serial_monitor, marca, modelo) VALUES
(1, 1, 43, 1, '001.05261401-4', NULL, 'GNSJ5XA003922', 'AOC', '24P1U');

CREATE TABLE Setores (
  ID int(11) NOT NULL,
  sigla_setor varchar(6) NOT NULL COMMENT 'Sigla do Setor',
  nome_setor varchar(70) NOT NULL COMMENT 'Nome da Unidade Administrativa'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO Setores (ID, sigla_setor, nome_setor) VALUES
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
(97, 'ZEXP', 'ZELADORIA-EXPEDIENTE');


ALTER TABLE Coordenadorias
  ADD PRIMARY KEY (ID),
  ADD UNIQUE KEY nome_UNIQUE (nome_coord) USING BTREE,
  ADD UNIQUE KEY sigla_UNIQUE (sigla_coord) USING BTREE;

ALTER TABLE CPUs
  ADD PRIMARY KEY (ID),
  ADD UNIQUE KEY CPUs_UNIQUE (nome_cpu),
  ADD UNIQUE KEY servicetag_UNIQUE (servicetag_cpu),
  ADD UNIQUE KEY patrimonio_UNIQUE (patrimonio_cpu),
  ADD UNIQUE KEY emailoffice_UNIQUE (office_email),
  ADD KEY CPUs_ibfk_1 (coord_id),
  ADD KEY CPUs_ibfk_2 (setor_id);

ALTER TABLE Monitores
  ADD PRIMARY KEY (ID),
  ADD UNIQUE KEY serial_UNIQUE (serial_monitor),
  ADD UNIQUE KEY patrimonio_UNIQUE (patrimonio_monitor),
  ADD UNIQUE KEY servicetag_UNIQUE (servicetag_monitor),
  ADD KEY Monitores_ibfk_1 (coord_id),
  ADD KEY Monitores_ibfk_2 (cpu_id),
  ADD KEY Monitores_ibfk_3 (setor_id);

ALTER TABLE Setores
  ADD PRIMARY KEY (ID),
  ADD UNIQUE KEY nome_UNIQUE (nome_setor) USING BTREE,
  ADD UNIQUE KEY sigla_UNIQUE (sigla_setor) USING BTREE;


ALTER TABLE Coordenadorias
  MODIFY ID int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE CPUs
  MODIFY ID int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE Monitores
  MODIFY ID int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE Setores
  MODIFY ID int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE CPUs
  ADD CONSTRAINT CPUs_ibfk_1 FOREIGN KEY (coord_id) REFERENCES Coordenadorias (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT CPUs_ibfk_2 FOREIGN KEY (setor_id) REFERENCES Setores (ID) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE Monitores
  ADD CONSTRAINT Monitores_ibfk_1 FOREIGN KEY (coord_id) REFERENCES Coordenadorias (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT Monitores_ibfk_2 FOREIGN KEY (cpu_id) REFERENCES `CPUs` (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT Monitores_ibfk_3 FOREIGN KEY (setor_id) REFERENCES Setores (ID) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
