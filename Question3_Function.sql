#fonction qui augmente la référence du terrain de 25 quand celle-ci est inférieure à 26.

DELIMITER $$
DROP FUNCTION IF EXISTS correctionId$$
CREATE function correctionId()
RETURNS int(10)
DETERMINISTIC
BEGIN
	UPDATE culture
	SET fkterrain = fkterrain + 25
	WHERE fkterrain <26;
	RETURN 1;
End $$

DELIMITER ;



