USE `viveros`
DELIMITER $$
CREATE TRIGGER `updated_stock` BEFORE INSERT ON PRODUCTOPEDIDO FOR EACH ROW
BEGIN
  SET @newStock = (SELECT Stock FROM PRODUCTO WHERE Codigo_Barras = NEW.Codigo_Barras);
  SET @newStock = (@newStock - NEW.Cantidad);
  IF (@newStock < 0) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cantidad pedida mayor a la disponible para este producto';
  ELSE
    UPDATE PRODUCTO SET Stock = @newStock WHERE Codigo_Barras = NEW.Codigo_Barras;
  END IF;
END $$
DELIMITER ;