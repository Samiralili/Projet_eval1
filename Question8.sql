select idculture,p.nom,t.qtx,(t.qtx/tr.surface) as surface
from traitement t,produit p,culture c,terrain tr
where idculture=fkculture
and   idterrain=fkterrain
and   idproduit=fkproduit
