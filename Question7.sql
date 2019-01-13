select idculture,p.nom,t.qtx
from traitement t,produit p,culture c
where idculture=fkculture
and   idproduit=fkproduit
