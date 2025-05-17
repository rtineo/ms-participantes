--restman extension de chrome:
https://chromewebstore.google.com/detail/restman/ihgpcfpkpmdcghlnaofdmjkoemnlijdi

--RESTS:
GET Consultar por evento:
http://localhost:9081/api2/eventos/1


GET Inscripciones por participante: http://localhost:9091/api2/inscripciones/3

POST Inscripciones:
http://localhost:9091/api2/inscripciones
Json Body:
{
    "idParticipante":3,
    "idEvento":2
}
Header:
Content-Type: application/json


--CREAR BD:
create database inscripciones_db; 
 
---USER
CREATE USER inscrip_admin IDENTIFIED BY admin
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp;

GRANT CONNECT, RESOURCE TO inscrip_admin;
ALTER USER inscrip_admin QUOTA UNLIMITED ON users;


ALTER USER inscrip_admin QUOTA UNLIMITED ON users;

CONN inscrip_admin/admin@localhost:1521/xepdb1

CREATE SEQUENCE eventos_seq START WITH 1;
create table eventos (id number(3) default  eventos_seq.nextval  not null, descripcion varchar2(35), fecha_evento date , ubicacion varchar2(50),  capacidad number(3) not null, primary key (id));
 

--DATA:
 
insert into eventos (descripcion ,fecha_evento , ubicacion , capacidad) values ('capacitacion de AWS',to_date('05/30/2025', 'mm/dd/yyyy'), 'Local Sistemas Uni', 2);
insert into eventos (descripcion ,fecha_evento , ubicacion , capacidad) values ('capacitacion de DevOps',to_date('06/15/2025', 'mm/dd/yyyy'), 'Local Sistemas Uni', 2);
insert into eventos (descripcion ,fecha_evento , ubicacion , capacidad) values ('capacitacion de TOGAF',to_date('06/05/2025', 'mm/dd/yyyy'), 'Local Sistemas Uni', 2);

commit;


--CREAR TABLAS:


drop table participante;

CREATE SEQUENCE participante_seq START WITH 1;
create table participante (id number(3)  default participante_seq.nextval not null, apellidos varchar2(35) not null, nombre varchar2(35) not null, primary key (id));

drop table inscripcion;

CREATE SEQUENCE inscripcion_seq START WITH 1;
create table inscripcion (id number(3)  default inscripcion_seq.nextval  , id_evento number(3) not null, id_participante number(3) not null,
 constraint pk_inscripcion primary key (id) );

ALTER TABLE inscripcion
ADD CONSTRAINT uk_inscripcion_participante_evento UNIQUE  (id_participante, id_evento);


--PERMISOS EN TABLAS AL USER: 
grant select, insert,delete on eventos to inscrip_admin ;
grant select, insert,delete on participante to inscrip_admin ;
grant select, insert,delete on inscripcion to inscrip_admin ;



--INSERT TABLA PRECARGADO:
select * from eventos;
insert into eventos (descripcion ,fecha_evento , ubicacion , capacidad) values ('capacitacion de AWS',TO_DATE('05/30/2025', 'mm/dd/yyyy'), 'Local Sistemas Uni', 2);
insert into eventos (descripcion ,fecha_evento , ubicacion , capacidad) values ('capacitacion de DevOps',TO_DATE('06/15/2025', 'mm/dd/YYYY'), 'Local Sistemas Uni', 2);
insert into eventos (descripcion ,fecha_evento , ubicacion , capacidad) values ('capacitacion de TOGAF',TO_DATE('06/05/2025', 'mm/dd/yyyy'), 'Local Sistemas Uni', 2);

commit;


select * from participante;


insert into participante (apellidos, nombre) values ('BENZA', 'PAOLO');


insert into participante (apellidos, nombre) values ('QUISPE', 'CARLOS');

insert into participante (apellidos, nombre) values ('RIVERA', 'JULIO');

insert into participante (apellidos, nombre) values ( 'GUEVARA', 'MARCO');
commit;