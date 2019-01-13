select tt.nom, count(tt.nom),sum(t.surface) as cumul
from terrain t, type_terre tt
where tt.idtype_terre=t.fktype_terre
group by tt.nom
order by cumul desc;