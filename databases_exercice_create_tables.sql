
DROP Table IF EXISTS Persons;
DROP Table IF EXISTS Users;

CREATE TABLE Users (
    ID int NOT NULL AUTO_INCREMENT,
    Login varchar(255) NOT NULL,
    Password varchar(255) NOT NULL,
    PRIMARY KEY (ID),
    UNIQUE (Login)
);


CREATE TABLE Persons (
    ID int NOT NULL AUTO_INCREMENT,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255) NOT NULL,
    Address varchar(255),
    City varchar(255) Default 'Mulhouse',
    Age int Default 0,
    User_ID int,
    PRIMARY KEY (ID),
    UNIQUE (FirstName, LastName),
    FOREIGN KEY (User_ID) REFERENCES Users(ID)
);

INSERT INTO Users (Login, Password) VALUES('jean@gmail.com', 'P@$$w0rd');			-- ID auto-généré = 1
INSERT INTO Users (Login, Password) VALUES('jean_d.privé@gmail.com', 'P@$$w0rd2');	-- ID auto-généré = 2


Select * from Users;

INSERT INTO Persons (LastName, FirstName, Address, City, Age, User_ID) VALUES('Dujardin', 'Jean', 'avenue des champs elysées', 'Paris', 53, 1); -- ID auto-généré = 1, référence l'utilisateur d'ID 1


Select * from Persons;

Delete From Users Where ID = 1;	-- Impossible car le User d'ID 1 est référencé par un enregistrement de la table `Persons`



-- Jointures
-- Voir https://doancongbang1991.wordpress.com/2016/07/13/sql-join-infographic/
-- Download https://brightwhiz.com/wp-content/uploads/2019/10/SQL-Joins.pdf
Select *
From Users u
Inner Join Persons p ON p.User_ID = u.ID

