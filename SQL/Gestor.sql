
SELECT IF(EXISTS (SELECT SCHEMA_NAME FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME = 'gestor'), 'exists', 'not_exists') AS db_status;
CREATE DATABASE IF NOT EXISTS gestor;
USE gestor;



CREATE TABLE Categorias (
    IdCategoria INT PRIMARY KEY AUTO_INCREMENT,
    Categoria VARCHAR(50)
);

INSERT INTO Categorias(Categoria)
VALUES ("lógica de programación"), ("Flutter"), ("Node.js"), ("Desarrollo Web"), ("Big Data"), ("Cloud Computing"), ("Desarrollo Móvil");

CREATE TABLE Tutoriales (
    IdTutorial INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(150),
    Url TEXT,
    Estado VARCHAR(15),
    Prioridad INT,
    IdCategoria INT,
    FOREIGN KEY (IdCategoria)
        REFERENCES Categorias (IdCategoria)
);

-- Crear el procedimiento almacenado para agregar un nuevo tutorial
DELIMITER //

CREATE PROCEDURE AgregarTutorial(
    IN p_Nombre VARCHAR(150),
    IN p_Url TEXT,
    IN p_Estado VARCHAR(15),
    IN p_Prioridad INT,
    IN p_IdCategoria INT
)
BEGIN
    INSERT INTO Tutoriales(Nombre, Url, Estado, Prioridad, IdCategoria)
    VALUES (p_Nombre, p_Url, p_Estado, p_Prioridad, p_IdCategoria);
END //

DELIMITER ;


