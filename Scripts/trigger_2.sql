USE `catastros`
DELIMITER $$
CREATE TRIGGER `viviendas_diferentes` BEFORE INSERT ON PERSONA FOR EACH ROW
BEGIN
	IF (((NEW.Número_Unifamiliar IS NOT NULL) OR (NEW.Calle_Unifamiliar IS NOT NULL)) AND ((NEW.Piso_Número_Piso IS NOT NULL) OR (NEW.Letra_Piso IS NOT NULL) OR (NEW.Número_Bloque IS NOT NULL) OR (NEW.Calle_Bloque IS NOT NULL))) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Una persona no puede vivir en dos alojamientos';
	END IF;
END $$
DELIMITER ;
	
