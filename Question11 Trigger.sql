DELIMITER $$

DROP TRIGGER if exists contrainte_employe $$

CREATE TRIGGER contrainte_employe
BEFORE INSERT
ON culture
FOR EACH ROW
BEGIN
    DECLARE to_verify smallint(5) unsigned;
    SELECT fkposte INTO to_verify FROM employe 
    INNER JOIN culture on 
    employe.idemploye = new.fkemploye
    GROUP BY employe.fkposte;
    IF (to_verify = 11) AND ((new.idculture = 112) OR (new.idculture = 232)) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "L'employé n'est pas autorisé à travailler sur cette culture";
    end if;
END $$


DROP TRIGGER if exists updatecontrainte_employe $$

CREATE TRIGGER updatecontrainte_employe
BEFORE UPDATE
ON culture
FOR EACH ROW
BEGIN
    DECLARE to_verify smallint(5) unsigned;
    SELECT fkposte INTO to_verify FROM employe 
    INNER JOIN culture on 
    employe.idemploye = new.fkemploye
    GROUP BY employe.fkposte;
    IF (to_verify = 11) AND ((new.idculture = 112) OR (new.idculture = 232)) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "L'employé n'est pas autorisé à travailler sur cette culture";
    end if;
END $$

DELIMITER ;