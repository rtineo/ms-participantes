CONN inscrip_admin/admin@localhost:1521/xepdb1

--CARGA TABLA PARTICIPANTE
--select * from participante;
insert into participante (apellidos, nombre) values ('BENZA', 'PAOLO');
insert into participante (apellidos, nombre) values ('QUISPE', 'CARLOS');
insert into participante (apellidos, nombre) values ('RIVERA', 'JULIO');
insert into participante (apellidos, nombre) values ( 'GUEVARA', 'MARCO');
commit;

--select * from eventos;
insert into eventos (descripcion ,fecha_evento , ubicacion , capacidad) values ('capacitacion de AWS',to_date('05/30/2025', 'mm/dd/yyyy'), 'Local Sistemas Uni', 2);
insert into eventos (descripcion ,fecha_evento , ubicacion , capacidad) values ('capacitacion de DevOps',to_date('06/15/2025', 'mm/dd/yyyy'), 'Local Sistemas Uni', 2);
insert into eventos (descripcion ,fecha_evento , ubicacion , capacidad) values ('capacitacion de TOGAF',to_date('06/05/2025', 'mm/dd/yyyy'), 'Local Sistemas Uni', 2);
commit; 