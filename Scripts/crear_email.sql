USE `viveros`
DELIMITER $$
CREATE PROCEDURE `crear_email` (IN nombre VARCHAR(45), IN dominio VARCHAR(45), OUT correo VARCHAR(100))
BEGIN
	SET correo = CONCAT(nombre, '@', dominio);
END $$
DELIMITER ;
