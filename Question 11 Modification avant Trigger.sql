ALTER TABLE culture CHANGE fkresponsable fkemploye int(10);
ALTER TABLE culture modify fkemploye int(10) unsigned;
ALTER TABLE culture ADD CONSTRAINT fk_employe_culture foreign key (fkemploye) references employe(idemploye);
