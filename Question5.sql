select  plante.nom, (alimentation.qtx*elevage.capacite) as 'quantité plantes consommées', alimentation.annee, animal.nom, elevage.idelevage
from plante
INNER JOIN alimentation
   ON plante.idplante = alimentation.fkplante
INNER JOIN animal
   ON alimentation.fkanimal = animal.idanimal
INNER JOIN elevage
   ON animal.idanimal = elevage.fkanimal
