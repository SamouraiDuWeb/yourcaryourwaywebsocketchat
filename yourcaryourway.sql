CREATE DATABASE yourcaryourway;

CREATE TABLE User (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(255) NOT NULL,
    prenom VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    mot_de_passe VARCHAR(255) NOT NULL,
    date_naissance DATE NOT NULL,
    adresse VARCHAR(255) NOT NULL,
    num_tele VARCHAR(255) NOT NULL,
    role VARCHAR(255) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    last_connection DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Vehicule (
    id INT PRIMARY KEY AUTO_INCREMENT,
    modele VARCHAR(255) NOT NULL,
    marque VARCHAR(255) NOT NULL,
    annee INT NOT NULL,
    categorie VARCHAR(255) NOT NULL,
    immatriculation VARCHAR(255) NOT NULL,
    id_agence INT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Agence (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(255) NOT NULL,
    adresse VARCHAR(255) NOT NULL,
    num_tel VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    horaire VARCHAR(255) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Location (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_user INT NOT NULL,
    id_vehicule INT NOT NULL,
    id_agence_start INT NOT NULL,
    id_agence_end INT NOT NULL,
    date_debut DATE NOT NULL,
    date_fin DATE NOT NULL,
    kilometrage_estime INT NOT NULL,
    prix_total INT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_user) REFERENCES User(id),
    FOREIGN KEY (id_vehicule) REFERENCES Vehicule(id),
    FOREIGN KEY (id_agence_start) REFERENCES Agence(id),
    FOREIGN KEY (id_agence_end) REFERENCES Agence(id)
);

CREATE TABLE Avis (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_user INT NOT NULL,
    id_location INT NOT NULL,
    note INT NOT NULL,
    description TEXT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_user) REFERENCES User(id),
    FOREIGN KEY (id_location) REFERENCES Location(id)
);

CREATE TABLE Notification (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_user INT NOT NULL,
    objet VARCHAR(255) NOT NULL,
    message TEXT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_user) REFERENCES User(id)
);

CREATE TABLE Message (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_sender INT NOT NULL,
    id_receiver INT NOT NULL,
    message TEXT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_sender) REFERENCES User(id),
    FOREIGN KEY (id_receiver) REFERENCES User(id)
);