#Modification base de données

CREATE TABLE if not exists meteo
(
idmeteo int not null,
date date,
qte_precipitation int(4),
saison enum('hiver','printemps','été','automne'),
temp_moyenne float(4),
temp_minimale float(4),
temp_maximale float(4),
idterrain int(10) unsigned,
constraint pk_idmeteo primary key (idmeteo),
constraint fk_terrain foreign key (idterrain) references terrain(idterrain)
);