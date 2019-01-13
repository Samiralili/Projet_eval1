select idelevage,nom,sum(productionviande.quantite/elevage.capacite) as rendement 
from productionviande,elevage,animal
where idanimal=fkanimal
and idelevage=fkelevage
group by elevage.idelevage
