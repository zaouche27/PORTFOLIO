-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : jeu. 05 fév. 2026 à 12:24
-- Version du serveur : 8.0.44
-- Version de PHP : 8.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `aquarius`
--

-- --------------------------------------------------------

--
-- Structure de la table `achat`
--

CREATE TABLE `achat` (
  `idAnimal` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `idEspece` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `date_achat` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `animaux`
--

CREATE TABLE `animaux` (
  `idAnimal` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `immatriculation` varchar(50) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `bassins`
--

CREATE TABLE `bassins` (
  `idbassin` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `piece` varchar(50) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `deplacement`
--

CREATE TABLE `deplacement` (
  `idbassin` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `idAnimal` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `date_entree` date NOT NULL,
  `date_sortie` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `epece`
--

CREATE TABLE `epece` (
  `idEspece` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `nomespece` varchar(50) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `soins`
--

CREATE TABLE `soins` (
  `idsoins` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `date_soins` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `traitement`
--

CREATE TABLE `traitement` (
  `idsoins` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `idAnimal` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `nature_soin` varchar(50) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `achat`
--
ALTER TABLE `achat`
  ADD PRIMARY KEY (`idAnimal`,`idEspece`),
  ADD KEY `achat_idEspece_FK` (`idEspece`);

--
-- Index pour la table `animaux`
--
ALTER TABLE `animaux`
  ADD PRIMARY KEY (`idAnimal`);

--
-- Index pour la table `bassins`
--
ALTER TABLE `bassins`
  ADD PRIMARY KEY (`idbassin`);

--
-- Index pour la table `deplacement`
--
ALTER TABLE `deplacement`
  ADD PRIMARY KEY (`idbassin`,`idAnimal`),
  ADD KEY `deplacement_idAnimal_FK` (`idAnimal`);

--
-- Index pour la table `epece`
--
ALTER TABLE `epece`
  ADD PRIMARY KEY (`idEspece`);

--
-- Index pour la table `soins`
--
ALTER TABLE `soins`
  ADD PRIMARY KEY (`idsoins`);

--
-- Index pour la table `traitement`
--
ALTER TABLE `traitement`
  ADD PRIMARY KEY (`idsoins`,`idAnimal`),
  ADD KEY `traitement_idAnimal_FK` (`idAnimal`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `achat`
--
ALTER TABLE `achat`
  ADD CONSTRAINT `achat_idAnimal_FK` FOREIGN KEY (`idAnimal`) REFERENCES `animaux` (`idAnimal`),
  ADD CONSTRAINT `achat_idEspece_FK` FOREIGN KEY (`idEspece`) REFERENCES `epece` (`idEspece`);

--
-- Contraintes pour la table `deplacement`
--
ALTER TABLE `deplacement`
  ADD CONSTRAINT `deplacement_idAnimal_FK` FOREIGN KEY (`idAnimal`) REFERENCES `animaux` (`idAnimal`),
  ADD CONSTRAINT `deplacement_idbassin_FK` FOREIGN KEY (`idbassin`) REFERENCES `bassins` (`idbassin`);

--
-- Contraintes pour la table `traitement`
--
ALTER TABLE `traitement`
  ADD CONSTRAINT `traitement_idAnimal_FK` FOREIGN KEY (`idAnimal`) REFERENCES `animaux` (`idAnimal`),
  ADD CONSTRAINT `traitement_idsoins_FK` FOREIGN KEY (`idsoins`) REFERENCES `soins` (`idsoins`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;