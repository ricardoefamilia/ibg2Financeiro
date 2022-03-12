-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 10-Set-2017 às 00:03
-- Versão do servidor: 5.7.17-log
-- PHP Version: 7.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `financasibg2`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `inserir_membro` (IN `P_status` TINYINT(1), IN `P_tipoPessoa` TINYINT(1), IN `P_nome` VARCHAR(255), IN `P_sexo` INT(11), IN `P_rg` VARCHAR(20), IN `P_orgaoExpedidor` VARCHAR(20), IN `P_cpf` VARCHAR(14), IN `P_endereco` VARCHAR(150), IN `P_numero` VARCHAR(20), IN `P_complemento` VARCHAR(20), IN `P_bairro` VARCHAR(50), IN `P_cidade` VARCHAR(150), IN `P_estado` VARCHAR(2), IN `P_cep` VARCHAR(9), IN `P_emailPessoal` VARCHAR(150), IN `P_telefone` VARCHAR(50), IN `P_celular` VARCHAR(50), IN `P_nascimento` DATE, IN `P_nascimentoCidade` VARCHAR(100), IN `P_nascimentoEstado` VARCHAR(2), IN `P_estadoCivil` INT(11), IN `P_tipoSanguineo` INT(11), IN `P_fatorRh` VARCHAR(1), IN `P_escolaridade` INT(11), IN `P_profissao` VARCHAR(45), IN `P_empresaNome` VARCHAR(100), IN `P_empresaEndereco` VARCHAR(150), IN `P_empresaNumero` VARCHAR(20), IN `P_empresaComplemento` VARCHAR(20), IN `P_empresaBairro` VARCHAR(50), IN `P_empresaCidade` VARCHAR(150), IN `P_empresaEstado` VARCHAR(2), IN `P_empresaCep` VARCHAR(9), IN `P_empresaCargo` VARCHAR(50), IN `P_igrejaBatismoNomeIgreja` VARCHAR(100), IN `P_igrejaBatismoDataBatismo` DATE, IN `P_igrejaOrigemNome` VARCHAR(100), IN `P_igrejaOrigemEndereco` VARCHAR(100), IN `P_igrejaOrigemNumero` VARCHAR(20), IN `P_igrejaOrigemComplemento` VARCHAR(20), IN `P_igrejaOrigemBairro` VARCHAR(50), IN `P_igrejaOrigemCidade` VARCHAR(150), IN `P_igrejaOrigemEstado` VARCHAR(2), IN `P_igrejaOrigemCep` VARCHAR(9), IN `P_igrejaOigemTelefone` VARCHAR(45), IN `P_igrejaOrigemAtividades` VARCHAR(45), IN `P_igrejaOrigemDizimista` TINYINT(1), IN `P_dizimista` TINYINT(1), IN `P_donsConhece` TINYINT(1), IN `P_donsPratica` TINYINT(1), IN `P_dataAdmissao` DATE, IN `P_modoAdmissao` VARCHAR(50), IN `P_atividades` VARCHAR(50), IN `P_saidaModo` VARCHAR(50), IN `P_saidaDate` DATE, IN `P_readmissaoModo` VARCHAR(50), IN `P_readmissaoData` DATE, IN `P_outrosPaiNome` VARCHAR(255), IN `P_outrosPaiEvangelico` TINYINT(1), IN `P_outrosPaiIgreja` VARCHAR(255), IN `P_outrosMaeNome` VARCHAR(255), IN `P_outrosMaeEvangelica` TINYINT(1), IN `P_outrosMaeIgreja` VARCHAR(255), IN `P_outrosConjugeNome` VARCHAR(255), IN `P_outrosConjugeEvangelico` TINYINT(1), IN `P_outrosConjugeIgreja` VARCHAR(255), IN `P_outrosConjugeDataNascimento` DATE, IN `P_outrosConjugeDataCasamento` DATE, OUT `P_idPessoa` INT(11))  begin

end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cursosrealizados`
--

CREATE TABLE `cursosrealizados` (
  `idCursosRealizados` int(11) NOT NULL,
  `curso` varchar(255) NOT NULL,
  `titulacao` int(11) NOT NULL,
  `instituicao` varchar(255) DEFAULT NULL,
  `FKPessoas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `destinacao`
--

CREATE TABLE `destinacao` (
  `iddestinacao` int(11) NOT NULL,
  `descricao` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `destinacao`
--

INSERT INTO `destinacao` (`iddestinacao`, `descricao`) VALUES
(1, 'Dízimo'),
(2, 'Missões Mundiais'),
(3, 'Missões Nacionais'),
(4, 'Missões Regionais'),
(5, 'Cantina_22Jun.2017 Jovens');

-- --------------------------------------------------------

--
-- Estrutura da tabela `dons`
--

CREATE TABLE `dons` (
  `idDom` int(11) NOT NULL,
  `nomeDom` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `dons`
--

INSERT INTO `dons` (`idDom`, `nomeDom`) VALUES
(1, 'Serviço'),
(2, 'Profecia'),
(3, 'Liderança'),
(4, 'Interpretação de línguas'),
(5, 'Misericórdia'),
(6, 'Línguas'),
(7, 'Milagres'),
(8, 'Pastorado'),
(9, 'Conhecimento'),
(10, 'Curas'),
(11, 'Apostolado'),
(12, 'Missionário'),
(13, 'Exortação'),
(14, 'Ensino'),
(15, 'Socorros'),
(16, 'Intercessão'),
(17, 'Contribuição'),
(18, 'Fé'),
(19, 'Hospitalidade'),
(20, 'Administração'),
(21, 'Evangelismo'),
(22, 'Sabedoria'),
(23, 'Discernimento de espíritos');

-- --------------------------------------------------------

--
-- Estrutura da tabela `entradas`
--

CREATE TABLE `entradas` (
  `idEntradas` int(11) NOT NULL,
  `FKdestinacao` int(11) NOT NULL,
  `FKPessoa_Ofertou` int(11) NOT NULL,
  `FKUsuarioLancou` int(11) NOT NULL,
  `FKUsuarioConferiu` int(11) NOT NULL,
  `valor` decimal(18,2) NOT NULL,
  `especie` int(5) NOT NULL,
  `nrCheque` varchar(45) DEFAULT NULL,
  `bancoCheque` varchar(45) DEFAULT NULL,
  `nrDepositoComprovante` varchar(45) DEFAULT NULL,
  `agencia` varchar(45) DEFAULT NULL,
  `conta` varchar(45) DEFAULT NULL,
  `dataLancamentoEntrada` date NOT NULL,
  `horaLancamentoEntrada` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `entradas`
--

INSERT INTO `entradas` (`idEntradas`, `FKdestinacao`, `FKPessoa_Ofertou`, `FKUsuarioLancou`, `FKUsuarioConferiu`, `valor`, `especie`, `nrCheque`, `bancoCheque`, `nrDepositoComprovante`, `agencia`, `conta`, `dataLancamentoEntrada`, `horaLancamentoEntrada`) VALUES
(4, 1, 18, 4, 8, '150.00', 1, '-', '-', '-', '-', '-', '2017-09-09', '18:24:16'),
(5, 1, 18, 4, 8, '700.00', 3, '10001', 'Caixa Econômica Federal', '-', '0805', '1234-1', '2017-09-09', '18:24:16'),
(6, 1, 19, 4, 8, '850.00', 2, '-', '-', '20171234', '-', '-', '2017-09-09', '18:24:16'),
(7, 3, 19, 4, 8, '250.00', 1, '-', '-', '-', '-', '-', '2017-09-09', '18:24:16'),
(8, 3, 1, 4, 8, '100.00', 1, '-', '-', '-', '-', '-', '2017-09-09', '19:00:45'),
(9, 1, 18, 4, 8, '150.00', 1, '-', '-', '-', '-', '-', '2017-09-09', '19:00:45'),
(10, 1, 18, 4, 8, '450.00', 3, '12200', '104 - Caixa Econômica Federal', '-', '0643', '554433', '2017-09-09', '19:00:45'),
(11, 1, 19, 4, 8, '850.00', 2, '-', '-', '2017555', '-', '-', '2017-09-09', '19:00:45'),
(12, 3, 19, 4, 8, '250.00', 1, '-', '-', '-', '-', '-', '2017-09-09', '19:00:45'),
(13, 5, 19, 4, 8, '90.00', 1, '-', '-', '-', '-', '-', '2017-09-09', '19:00:45');

-- --------------------------------------------------------

--
-- Estrutura da tabela `familiares`
--

CREATE TABLE `familiares` (
  `idFamiliares` int(11) NOT NULL,
  `nomePai` varchar(255) DEFAULT NULL,
  `paiEvangelico` tinyint(1) DEFAULT NULL,
  `igrejaPai` varchar(255) DEFAULT NULL,
  `nomeMae` varchar(255) DEFAULT NULL,
  `maeEvangelica` tinyint(1) DEFAULT NULL,
  `igrejaMae` varchar(255) DEFAULT NULL,
  `nomeConjuge` varchar(255) DEFAULT NULL,
  `conjugeEvangelico` tinyint(1) DEFAULT NULL,
  `igrejaConjuge` varchar(255) DEFAULT NULL,
  `dataNascimentoConjuge` date DEFAULT NULL,
  `dataCasamento` date DEFAULT NULL,
  `fkPessoa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `familiares`
--

INSERT INTO `familiares` (`idFamiliares`, `nomePai`, `paiEvangelico`, `igrejaPai`, `nomeMae`, `maeEvangelica`, `igrejaMae`, `nomeConjuge`, `conjugeEvangelico`, `igrejaConjuge`, `dataNascimentoConjuge`, `dataCasamento`, `fkPessoa`) VALUES
(1, 'nomePai', 1, 'igrejaPai', 'nomeMae', 1, 'igrejaMãe', 'nomeEsposa', 1, 'igrejaEsposa', '2019-09-06', '2020-09-12', 12),
(2, 'hPai', 0, '', 'hMãe', 0, '', '', 1, '', NULL, NULL, 18);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pessoas`
--

CREATE TABLE `pessoas` (
  `idPessoas` int(11) NOT NULL,
  `tipoPessoa` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `sexo` int(11) NOT NULL,
  `dataNascimento` date NOT NULL,
  `cidadeNascimento` varchar(255) NOT NULL,
  `estadoNascimento` varchar(255) NOT NULL,
  `rg` varchar(255) NOT NULL,
  `orgaoExpedidor` varchar(255) NOT NULL,
  `cpf` varchar(255) NOT NULL,
  `estadoCivil` varchar(255) NOT NULL,
  `tipoSanguineo` varchar(2) NOT NULL,
  `fatorRh` varchar(255) DEFAULT NULL,
  `escolaridade` varchar(255) NOT NULL,
  `logradouroEndereco` varchar(255) DEFAULT NULL,
  `numeroEndereco` varchar(255) DEFAULT NULL,
  `complementoEndereco` varchar(255) DEFAULT NULL,
  `bairroEndereco` varchar(2555) DEFAULT NULL,
  `cidadeEndereco` varchar(255) DEFAULT NULL,
  `EstadoEndereco` varchar(255) DEFAULT NULL,
  `cepEndereco` varchar(255) DEFAULT NULL,
  `emailPessoal` varchar(255) DEFAULT NULL,
  `telefone` varchar(255) DEFAULT NULL,
  `celular` varchar(255) DEFAULT NULL,
  `profissao` varchar(45) DEFAULT NULL,
  `nomeEmpresa` varchar(45) DEFAULT NULL,
  `enderecoEmpresa` varchar(45) DEFAULT NULL,
  `numeroEmpresa` varchar(255) DEFAULT NULL,
  `complementoEmpresa` varchar(255) DEFAULT NULL,
  `bairroEmpresa` varchar(255) DEFAULT NULL,
  `cidadeEmpresa` varchar(255) DEFAULT NULL,
  `estadoEmpresa` varchar(255) DEFAULT NULL,
  `cepEmpresa` varchar(45) DEFAULT NULL,
  `cargoEmpresa` varchar(45) DEFAULT NULL,
  `nomeIgrejaBatismo` varchar(45) DEFAULT NULL,
  `dataBatismo` date DEFAULT NULL,
  `igrejaOrigem` varchar(45) DEFAULT NULL,
  `estadoIgrejaOrigem` varchar(45) DEFAULT NULL,
  `cidadeIgrejaOrigem` varchar(45) DEFAULT NULL,
  `logradouroIgrejaOrigem` varchar(255) DEFAULT NULL,
  `numeroIgrejaOrigem` varchar(255) DEFAULT NULL,
  `complementoIgrejaOrigem` varchar(255) NOT NULL,
  `bairroIgrejaOrigem` varchar(255) DEFAULT NULL,
  `cepIgrejaOrigem` varchar(45) DEFAULT NULL,
  `telefoneIgrejaOigem` varchar(45) DEFAULT NULL,
  `atividadesIgrejaOrigem` varchar(45) DEFAULT NULL,
  `dizimistIgrejaOrigem` tinyint(1) DEFAULT NULL,
  `dizimistaIgrejaAtual` tinyint(1) DEFAULT NULL,
  `conheceDons` tinyint(1) DEFAULT NULL,
  `praticDons` tinyint(1) DEFAULT NULL,
  `modoAdmissao` varchar(45) NOT NULL,
  `dataAdmissao` date NOT NULL,
  `atividadesIBG2` varchar(255) DEFAULT NULL,
  `modoSaida` varchar(45) DEFAULT NULL,
  `dateSaida` date DEFAULT NULL,
  `modoReadmissaoIBG2` varchar(45) DEFAULT NULL,
  `dataReadmissao` date DEFAULT NULL,
  `statusPessoa` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `pessoas`
--

INSERT INTO `pessoas` (`idPessoas`, `tipoPessoa`, `nome`, `sexo`, `dataNascimento`, `cidadeNascimento`, `estadoNascimento`, `rg`, `orgaoExpedidor`, `cpf`, `estadoCivil`, `tipoSanguineo`, `fatorRh`, `escolaridade`, `logradouroEndereco`, `numeroEndereco`, `complementoEndereco`, `bairroEndereco`, `cidadeEndereco`, `EstadoEndereco`, `cepEndereco`, `emailPessoal`, `telefone`, `celular`, `profissao`, `nomeEmpresa`, `enderecoEmpresa`, `numeroEmpresa`, `complementoEmpresa`, `bairroEmpresa`, `cidadeEmpresa`, `estadoEmpresa`, `cepEmpresa`, `cargoEmpresa`, `nomeIgrejaBatismo`, `dataBatismo`, `igrejaOrigem`, `estadoIgrejaOrigem`, `cidadeIgrejaOrigem`, `logradouroIgrejaOrigem`, `numeroIgrejaOrigem`, `complementoIgrejaOrigem`, `bairroIgrejaOrigem`, `cepIgrejaOrigem`, `telefoneIgrejaOigem`, `atividadesIgrejaOrigem`, `dizimistIgrejaOrigem`, `dizimistaIgrejaAtual`, `conheceDons`, `praticDons`, `modoAdmissao`, `dataAdmissao`, `atividadesIBG2`, `modoSaida`, `dateSaida`, `modoReadmissaoIBG2`, `dataReadmissao`, `statusPessoa`) VALUES
(1, 0, 'Anônimo', 1, '2000-12-20', '-', 'AC', '-', 'SSP', '-', '1', '1', NULL, '1', '', '', '', '', '', '-', '-', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Recomendação', '2000-10-20', '-', NULL, NULL, NULL, NULL, 0),
(2, 1, 'a', 1, '1457-05-26', '-', 'AC', '-', 'SSP', '-', '1', '1', NULL, '1', '', '', '', '', '', '-', '-', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Recomendação', '1982-12-14', '=', NULL, NULL, NULL, NULL, 0),
(3, 1, 'b', 1, '1445-05-26', 'Brasilia', 'DF', '123', 'SSP', '123', '1', '1', NULL, '3', '', '', '', '', '', 'DF', '71010047', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Recomendação', '1543-12-14', '-', NULL, NULL, NULL, NULL, 0),
(4, 1, 'c', 1, '2000-12-20', '-', 'AC', '-', 'SSP', '-', '1', '1', NULL, '1', '', '', '', '', '', '-', '-', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Recomendação', '2000-10-20', '-', NULL, NULL, NULL, NULL, 0),
(5, 1, 'd', 1, '2000-12-20', '-', 'AC', '-', 'SSP', '-', '1', '1', NULL, '1', '', '', '', '', '', '-', '-', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Recomendação', '2000-10-20', '-', NULL, NULL, NULL, NULL, 0),
(6, 1, 'e', 1, '2000-12-20', '-', 'AC', '-', 'SSP', '-', '1', '1', NULL, '1', '', '', '', '', '', '-', '-', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Recomendação', '2000-10-20', '-', NULL, NULL, NULL, NULL, 0),
(7, 1, 'f', 1, '2000-12-20', '-', 'AC', '-', 'SSP', '-', '1', '1', NULL, '1', '', '', '', '', '', '-', '-', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Recomendação', '2000-10-20', '-', NULL, NULL, NULL, NULL, 0),
(8, 1, 'g', 1, '2000-12-20', '-', 'AC', '-', 'SSP', '-', '1', '1', NULL, '1', '', '', '', '', '', '-', '-', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Recomendação', '2000-10-20', '-', NULL, NULL, NULL, NULL, 0),
(12, 1, 'nomePessoa', 1, '1980-09-07', 'BRASÍLIA', 'DF', '012345', 'SSPDF', '111.111.111-01', 'Casado(a)', 'B', '+', 'Ensino Superior completo', 'QI 23 Lote 14', '205', 'Bloco B Ap205', 'Guará II', 'Brasília', 'DF', '71060639', 'emailPessoa@gmail.com', '(61)3333-8555', '(61)99888-7777', 'nomeProfissao', 'nomeTrabalho', 'QE 13 Conjunto F', '6', 'casa trabalho', 'Guará II', 'Brasília', 'DF', '71050-060', 'nomeCargo', 'igreja Batismo', '2000-09-13', 'igreja Origem', 'RJ', 'Rio de Janeiro', 'Rua Amapurus', '10', 'complemento Igreja Origem', 'Tauá', '21920120', '(21)3225-9900', 'Recepção', 1, 1, 1, 1, 'Aclamação', '2017-08-27', 'Recepção e segurança.', NULL, NULL, NULL, NULL, 1),
(18, 1, 'h', 0, '1990-09-07', 'BRASÍLIA', 'DF', '1112223', 'SSPDF', '111.111.110-11', 'Solteiro(a)', 'O', '-', 'Ensino Superior cursando', 'QE 13 Conjunto E', '7', 'casa', 'Guará II', 'Brasília', 'DF', '71050050', 'h@gmail.com', '', '', '', '', '', '', '', '', '', '', '', '', 'IBG2', '2017-08-27', '', '', '', '', '', '', '', '', '', '', 1, 1, 1, 0, 'Batismo', '2017-08-27', 'Ministério de Jovens - Auxilia.', NULL, NULL, NULL, NULL, 1),
(19, 1, 'Paulo', 1, '1970-09-21', 'Rio de Janeiro', 'RJ', '223123', 'MD', '111.111.110-12', 'Solteiro(a)', 'A', '+', 'Ensino Superior cursando', 'QI 23 Lote 14', '208', 'bloco B', 'Guará II', 'Brasília', 'DF', '71060639', 'paulo@gmail.com', '', '', '', '', '', '', '', '', '', '', '', '', 'IBG2', '2017-08-27', '', '', '', '', '', '', '', '', '', '', 1, 1, 1, 1, 'Batismo', '2017-08-27', 'Ensino.', NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pessoas_has_dons`
--

CREATE TABLE `pessoas_has_dons` (
  `Pessoas_idPessoas` int(11) NOT NULL,
  `Dons_idDom` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `pessoas_has_dons`
--

INSERT INTO `pessoas_has_dons` (`Pessoas_idPessoas`, `Dons_idDom`) VALUES
(12, 1),
(18, 1),
(19, 2),
(12, 3),
(12, 5),
(18, 6);

-- --------------------------------------------------------

--
-- Estrutura da tabela `sistemabancos`
--

CREATE TABLE `sistemabancos` (
  `nrBanco` char(10) NOT NULL,
  `banco` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `sistemabancos`
--

INSERT INTO `sistemabancos` (`nrBanco`, `banco`) VALUES
('000', 'Banco Bankpar S.A.'),
('001', 'Banco do Brasil S.A.'),
('003', 'Banco da Amazônia S.A.'),
('004', 'Banco do Nordeste do Brasil S.A.'),
('021', 'BANESTES S.A. Banco do Estado do Espírito Santo'),
('024', 'Banco de Pernambuco S.A., BANDEPE'),
('025', 'Banco Alfa S.A.'),
('029', 'Banco Banerj S.A.'),
('031', 'Banco Beg S.A.'),
('033', 'Banco Santander (Brasil) S.A.'),
('036', 'Banco Bradesco BBI S.A.'),
('037', 'Banco do Estado do Pará S.A.'),
('038', 'Banco Banestado S.A.'),
('040', 'Banco Cargill S.A.'),
('041', 'Banco do Estado do Rio Grande do Sul S.A.'),
('044', 'Banco BVA S.A.'),
('045', 'Banco Opportunity S.A.'),
('047', 'Banco do Estado de Sergipe S.A.'),
('062', 'Hipercard Banco Múltiplo S.A.'),
('063', 'Banco Ibi S.A. Banco Múltiplo'),
('065', 'Banco Lemon S.A.'),
('069', 'BPN Brasil Banco Múltiplo S.A.'),
('070', 'BRB Banco de Brasília S.A.'),
('072', 'Banco Rural Mais S.A.'),
('073', 'BB Banco Popular do Brasil S.A.'),
('074', 'Banco J. Safra S.A.'),
('078', 'BES Investimento do Brasil S.A.-Banco de Investimento'),
('081-7', 'Concórdia Banco S.A.'),
('082-5', 'Banco Topázio S.A.'),
('083-3', 'Banco da China Brasil S.A.'),
('096', 'Banco BM&F de Serviços de Liquidação e Custódia S.A'),
('104', 'Caixa Econômica Federal'),
('107', 'Banco BBM S.A.'),
('151', 'Banco Nossa Caixa S.A.'),
('184', 'Banco Itaú BBA S.A.'),
('204', 'Banco Bradesco Cartões S.A.'),
('208', 'Banco UBS Pactual S.A.'),
('214', 'Banco Dibens S.A.'),
('215', 'Banco Comercial e de Investimento Sudameris S.A.'),
('217', 'Banco John Deere S.A.'),
('222', 'Banco Calyon Brasil S.A.'),
('224', 'Banco Fibra S.A.'),
('225', 'Banco Brascan S.A.'),
('229', 'Banco Cruzeiro do Sul S.A.'),
('230', 'Unicard Banco Múltiplo S.A.'),
('233', 'Banco GE Capital S.A.'),
('237', 'Banco Bradesco S.A.'),
('246', 'Banco ABC Brasil S.A.'),
('248', 'Banco Boavista Interatlântico S.A.'),
('249', 'Banco Investcred Unibanco S.A.'),
('250', 'Banco Schahin S.A.'),
('263', 'Banco Cacique S.A.'),
('265', 'Banco Fator S.A.'),
('318', 'Banco BMG S.A.'),
('320', 'Banco Industrial e Comercial S.A.'),
('341', 'Banco Itaú S.A.'),
('356', 'Banco Real S.A. (antigo)'),
('366', 'Banco Société Générale Brasil S.A.'),
('370', 'Banco WestLB do Brasil S.A.'),
('376', 'Banco J. P. Morgan S.A.'),
('389', 'Banco Mercantil do Brasil S.A.'),
('394', 'Banco Finasa BMC S.A.'),
('399', 'HSBC Bank Brasil S.A., Banco Múltiplo'),
('409', 'UNIBANCO União de Bancos Brasileiros S.A.'),
('422', 'Banco Safra S.A.'),
('453', 'Banco Rural S.A.'),
('456', 'Banco de Tokyo-Mitsubishi UFJ Brasil S.A.'),
('464', 'Banco Sumitomo Mitsui Brasileiro S.A.'),
('473', 'Banco Caixa Geral, Brasil S.A.'),
('477', 'Citibank N.A.'),
('479', 'Banco ItaúBank S.A'),
('487', 'Deutsche Bank S.A.,Banco Alemão'),
('488', 'JPMorgan Chase Bank'),
('492', 'ING Bank N.V.'),
('505', 'Banco Credit Suisse Brasil S.A.'),
('600', 'Banco Luso Brasileiro S.A.'),
('604', 'Banco Industrial do Brasil S.A.'),
('610', 'Banco VR S.A.'),
('611', 'Banco Paulista S.A.'),
('612', 'Banco Guanabara S.A.'),
('623', 'Banco Panamericano S.A.'),
('626', 'Banco Ficsa S.A.'),
('630', 'Banco Intercap S.A.'),
('633', 'Banco Rendimento S.A.'),
('634', 'Banco Triângulo S.A.'),
('637', 'Banco Sofisa S.A.'),
('638', 'Banco Prosper S.A.'),
('641', 'Banco Alvorada S.A.'),
('643', 'Banco Pine S.A.'),
('652', 'Itaú Unibanco Holding S.A.'),
('653', 'Banco Indusval S.A.'),
('655', 'Banco Votorantim S.A.'),
('707', 'Banco Daycoval S.A.'),
('719', 'Banif-Banco Internacional do Funchal Brasil S.A.'),
('734', 'Banco Gerdau S.A.'),
('740', 'Banco Barclays S.A.'),
('745', 'Banco Citibank S.A.'),
('746', 'Banco Modal S.A.'),
('747', 'Banco Rabobank International Brasil S.A.'),
('748', 'Banco Cooperativo Sicredi S.A.'),
('749', 'Banco Simples S.A.'),
('751', 'Dresdner Bank Brasil S.A.,Banco Múltiplo'),
('752', 'Banco BNP Paribas Brasil S.A.'),
('755', 'Banco Merrill Lynch de Investimentos S.A.'),
('756', 'Banco Cooperativo do Brasil S.A., BANCOOB'),
('M03', 'Banco Fiat S.A.'),
('M06', 'Banco de Lage Landen Brasil S.A.'),
('M07', 'Banco GMAC S.A.'),
('M08', 'Banco Citicard S.A.'),
('M09', 'Banco Itaucred Financiamentos S.A.'),
('M11', 'Banco IBM S.A.'),
('M14', 'Banco Volkswagen S.A.'),
('M16', 'Banco Rodobens S.A.'),
('M18', 'Banco Ford S.A.'),
('M19', 'Banco CNH Capital S.A.'),
('M20', 'Banco Toyota do Brasil S.A.'),
('M22', 'Banco Honda S.A.');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `nome` varchar(45) NOT NULL,
  `senha` varchar(64) NOT NULL,
  `perfil` int(11) NOT NULL,
  `FKPessoas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`nome`, `senha`, `perfil`, `FKPessoas`) VALUES
('a', '202cb962ac59075b964b07152d234b70', 1, 2),
('b', '202cb962ac59075b964b07152d234b70', 2, 3),
('c', '202cb962ac59075b964b07152d234b70', 3, 4),
('d', '202cb962ac59075b964b07152d234b70', 4, 5),
('e', '202cb962ac59075b964b07152d234b70', 5, 6),
('f', '202cb962ac59075b964b07152d234b70', 6, 7),
('g', '202cb962ac59075b964b07152d234b70', 3, 8),
('paulop', '202cb962ac59075b964b07152d234b70', 3, 19);

-- --------------------------------------------------------

--
-- Estrutura da tabela `visitantes`
--

CREATE TABLE `visitantes` (
  `idVisitantes` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `data` date NOT NULL,
  `dataNascimento` date DEFAULT NULL,
  `telefone` varchar(255) DEFAULT NULL,
  `celular` varchar(255) DEFAULT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `cep` int(11) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `suaVisita` int(11) NOT NULL,
  `tipo` varchar(24) NOT NULL,
  `faixaEtaria` varchar(24) NOT NULL,
  `minhaDecisao` varchar(255) DEFAULT NULL,
  `meuInteresse` varchar(255) DEFAULT NULL,
  `precisoOrientacao` varchar(255) DEFAULT NULL,
  `pedidoOracao` varchar(255) DEFAULT NULL,
  `conheciIBG2` varchar(255) DEFAULT NULL,
  `opiniaoMusica` varchar(24) DEFAULT NULL,
  `opiniaoRecepcao` varchar(24) DEFAULT NULL,
  `opiniaoPregacao` varchar(24) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cursosrealizados`
--
ALTER TABLE `cursosrealizados`
  ADD PRIMARY KEY (`idCursosRealizados`),
  ADD KEY `fk_CursosRealizados_Pessoas1_idx` (`FKPessoas`);

--
-- Indexes for table `destinacao`
--
ALTER TABLE `destinacao`
  ADD PRIMARY KEY (`iddestinacao`);

--
-- Indexes for table `dons`
--
ALTER TABLE `dons`
  ADD PRIMARY KEY (`idDom`);

--
-- Indexes for table `entradas`
--
ALTER TABLE `entradas`
  ADD PRIMARY KEY (`idEntradas`),
  ADD KEY `fk_Entradas_Destinacao1_idx` (`FKdestinacao`),
  ADD KEY `fk_Entradas_PessoasOfertou1_idx` (`FKPessoa_Ofertou`),
  ADD KEY `FKUsuarioLancou` (`FKUsuarioLancou`),
  ADD KEY `FKUsuarioConferiu` (`FKUsuarioConferiu`);

--
-- Indexes for table `familiares`
--
ALTER TABLE `familiares`
  ADD PRIMARY KEY (`idFamiliares`),
  ADD KEY `fkPessoa` (`fkPessoa`);

--
-- Indexes for table `pessoas`
--
ALTER TABLE `pessoas`
  ADD PRIMARY KEY (`idPessoas`);

--
-- Indexes for table `pessoas_has_dons`
--
ALTER TABLE `pessoas_has_dons`
  ADD PRIMARY KEY (`Pessoas_idPessoas`,`Dons_idDom`),
  ADD KEY `fk_Pessoas_has_Dons_Dons1_idx` (`Dons_idDom`),
  ADD KEY `fk_Pessoas_has_Dons_Pessoas1_idx` (`Pessoas_idPessoas`);

--
-- Indexes for table `sistemabancos`
--
ALTER TABLE `sistemabancos`
  ADD PRIMARY KEY (`nrBanco`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`nome`),
  ADD KEY `fk_usuario_pessoas1_idx` (`FKPessoas`);

--
-- Indexes for table `visitantes`
--
ALTER TABLE `visitantes`
  ADD PRIMARY KEY (`idVisitantes`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cursosrealizados`
--
ALTER TABLE `cursosrealizados`
  MODIFY `idCursosRealizados` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `destinacao`
--
ALTER TABLE `destinacao`
  MODIFY `iddestinacao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `dons`
--
ALTER TABLE `dons`
  MODIFY `idDom` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `entradas`
--
ALTER TABLE `entradas`
  MODIFY `idEntradas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `familiares`
--
ALTER TABLE `familiares`
  MODIFY `idFamiliares` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `pessoas`
--
ALTER TABLE `pessoas`
  MODIFY `idPessoas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `visitantes`
--
ALTER TABLE `visitantes`
  MODIFY `idVisitantes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `cursosrealizados`
--
ALTER TABLE `cursosrealizados`
  ADD CONSTRAINT `fk_CursosRealizados_Pessoas1` FOREIGN KEY (`FKPessoas`) REFERENCES `pessoas` (`idPessoas`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `entradas`
--
ALTER TABLE `entradas`
  ADD CONSTRAINT `entradas_ibfk_1` FOREIGN KEY (`FKUsuarioLancou`) REFERENCES `pessoas` (`idPessoas`),
  ADD CONSTRAINT `entradas_ibfk_2` FOREIGN KEY (`FKUsuarioConferiu`) REFERENCES `pessoas` (`idPessoas`),
  ADD CONSTRAINT `fk_Entradas_Destinacao1` FOREIGN KEY (`FKdestinacao`) REFERENCES `destinacao` (`iddestinacao`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Entradas_PessoasOfertou1` FOREIGN KEY (`FKPessoa_Ofertou`) REFERENCES `pessoas` (`idPessoas`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `familiares`
--
ALTER TABLE `familiares`
  ADD CONSTRAINT `familiares_ibfk_1` FOREIGN KEY (`fkPessoa`) REFERENCES `pessoas` (`idPessoas`);

--
-- Limitadores para a tabela `pessoas_has_dons`
--
ALTER TABLE `pessoas_has_dons`
  ADD CONSTRAINT `fk_Pessoas_has_Dons_Dons1` FOREIGN KEY (`Dons_idDom`) REFERENCES `dons` (`idDom`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Pessoas_has_Dons_Pessoas1` FOREIGN KEY (`Pessoas_idPessoas`) REFERENCES `pessoas` (`idPessoas`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usuario_pessoas1` FOREIGN KEY (`FKPessoas`) REFERENCES `pessoas` (`idPessoas`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
