USE `viveros`
DELIMITER $$
CREATE TRIGGER `trigger_crear_email_before_insert` BEFORE INSERT ON CLIENTE FOR EACH ROW
BEGIN	
	if NEW.Email IS NULL THEN
		CALL crear_email(NEW.Nombre, 'ull.edu.es', @correo);
		SET NEW.Email = @correo;
	END IF;
END $$
DELIMITER ;
	
