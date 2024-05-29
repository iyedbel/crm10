-- Création de la table client
CREATE TABLE client (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(100),
    prenom VARCHAR(100),
    email VARCHAR(100),
    telephone VARCHAR(20),
    password VARCHAR(20),
    date_creation DATE
);

-- Insertion de données dans la table client
INSERT INTO `client` (`nom`, `prenom`, `email`, `telephone`, `password`, `date_creation`) VALUES
('client', 'client', 'chennoufwail@gmail.com', '0754591689', 'wail', CURDATE());

-- Création de la table vendeur
CREATE TABLE vendeur (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(100),
    prenom VARCHAR(100),
    email VARCHAR(100),
    telephone VARCHAR(20),
    wilaya VARCHAR(20),
    bureau VARCHAR(20),
    password VARCHAR(20),
    date_creation DATE
);

-- Insertion de données dans la table vendeur
INSERT INTO vendeur (nom, prenom, email, telephone, wilaya, bureau, password, date_creation) VALUES 
('vendeur', 'vendeur', 'yahiabdelhak7@gmail.com', '0754506598', 'fouka', 'dilvrili chlef', 'wail', CURDATE());


-- Création de la table de liaison pour stocker les relations entre les vendeurs et les clients
CREATE TABLE Vendeur_Client (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_vendeur INT,
    id_client INT,
    FOREIGN KEY (id_vendeur) REFERENCES vendeur(id),
    FOREIGN KEY (id_client) REFERENCES client(id)
);

-- Insertion de données dans la table de liaison pour établir des relations entre les vendeurs et les clients
INSERT INTO Vendeur_Client (id_vendeur, id_client) VALUES 
(1, 1); -- Cela signifie que le client avec l'ID 1 est lié au vendeur avec l'ID 1



-- Création de la table chef de bureau 
CREATE TABLE chef_de_bureau ( 
    id INT PRIMARY KEY AUTO_INCREMENT, 
    nom VARCHAR(100), 
    prenom VARCHAR(100), 
    email VARCHAR(100), 
    telephone VARCHAR(20), 
    bureau VARCHAR(100), 
    password VARCHAR(20) 
);


INSERT INTO `chef_de_bureau` (`id`, `nom`, `prenom`, `email`, `telephone`, `bureau`, `password`) VALUES 
(1, 'chef', 'chef', 'iyedbelm@gmail.com', '0531587541', 'alger', 'wail');

CREATE TABLE admin (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(100),
    prenom VARCHAR(100),
    email VARCHAR(100),
    telephone VARCHAR(20),
    password VARCHAR(20),
    id_client INT,
    id_vendeur INT,
    FOREIGN KEY (id_client) REFERENCES client(id),
    FOREIGN KEY (id_vendeur) REFERENCES vendeur(id)
);

-- Insertion de données dans la table admin avec les relations client et vendeur
INSERT INTO `admin` (`id`, `nom`, `prenom`, `email`, `telephone`, `password`, `id_client`, `id_vendeur`) VALUES 
(1, 'admin', 'admin', 'akramaymen7@gmail.com', '0754591689', 'wail', 1, 1);


-- Création de la table comptable
CREATE TABLE comptable (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(100),
    prenom VARCHAR(100),
    email VARCHAR(100),
    telephone VARCHAR(20),
    bureau VARCHAR(100),
    password VARCHAR(20)
);

-- Insertion de données dans la table comptable
INSERT INTO `comptable` (`nom`, `prenom`, `email`, `telephone`, `bureau`, `password`) VALUES 
('compt', 'compt', 'chennoufwail01@gmail.com', '075786564', 'alger', 'wail');

-- Création de la table Paiement avec la clé étrangère correctement formée
CREATE TABLE Paiement (
    id INT PRIMARY KEY AUTO_INCREMENT,
    wilaya VARCHAR(100),
    Bureau VARCHAR(100),
    Prix DECIMAL(10, 2),
    Prix_livraison DECIMAL(10, 2),
    status VARCHAR(100),
    date_creation DATE,
    id_comptable INT,
    FOREIGN KEY (id_comptable) REFERENCES comptable(id)
);

-- Insertion de données dans la table Paiement
INSERT INTO `Paiement` (`wilaya`, `Bureau`, `Prix`, `Prix_livraison`, `status`, `date_creation`, `id_comptable`) VALUES 
('alger', 'Delivrili Alger', '2000.00', '850.00', 'initialisation', CURDATE(), 1);

-- Création de la table livreur
CREATE TABLE livreur (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(100),
    prenom VARCHAR(100),
    email VARCHAR(100),
    telephone VARCHAR(100),
    bureau VARCHAR(100),
    date_creation DATE,
    password VARCHAR(20)
);

-- Insertion de données dans la table livreur
INSERT INTO livreur (`nom`, `prenom`, `email`, `telephone`, `bureau`, `date_creation`, `password`) 
VALUES ('livreur', 'livreur', 'chennoufwail03@gmail.com', '0554552767', 'delivri_chlef', CURDATE(), 'wail');

-- Création de la table produit
CREATE TABLE produit (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(100),
    prix DECIMAL(10, 2),
    id_vendeur INT,
    FOREIGN KEY (id_vendeur) REFERENCES vendeur(id)
);

-- Insertion de données dans la table produit
INSERT INTO `produit` (`nom`, `prix`, `id_vendeur`) 
VALUES ('prod', '2000.00', 1);

-- Création de la table colis
CREATE TABLE colis (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_vendeur INT,
    id_produit INT,
    wilaya VARCHAR(100),
    wilaya_destination VARCHAR(100),
    prix_total DECIMAL(10, 2),
    paiement VARCHAR(20),
    option VARCHAR(100),
    status VARCHAR(100),
    date_creation DATE,
    FOREIGN KEY (id_vendeur) REFERENCES vendeur(id),
    FOREIGN KEY (id_produit) REFERENCES produit(id)
);

-- Insertion de données dans la table colis
INSERT INTO `colis` (`id_vendeur`, `id_produit`, `wilaya`, `wilaya_destination`, `prix_total`, `option`, `status`, `date_creation`, `paiement`)
VALUES (1, 1, 'tipaza', 'Algiers', '2000.00', 'annuler', 'En attente', CURDATE(), 'initialisation');

