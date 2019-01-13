DELIMITER $$
DROP FUNCTION IF EXISTS qtx_plante$$
CREATE function qtx_plante(elevage_Id INT,plante_Id INT)
RETURNS int(10)
DETERMINISTIC
BEGIN
DECLARE quantity int(10);
SELECT alimentation.qtx*elevage.capacite into quantity
from plante
INNER JOIN alimentation
	ON plante.idplante = alimentation.fkplante
INNER JOIN animal
	ON alimentation.fkanimal = animal.idanimal
INNER JOIN elevage
	ON animal.idanimal = elevage.fkanimal
where elevage_id=elevage.idelevage
AND plante_id=plante.idplante;
RETURN quantity;
End $$

DELIMITER ;