CONN inscrip_admin/admin@localhost:1521/xepdb1

drop table eventos;
drop sequence eventos_seq;
CREATE SEQUENCE eventos_seq START WITH 1;
create table eventos (id number(3) default  eventos_seq.nextval  not null, descripcion varchar2(35), fecha_evento date , ubicacion varchar2(50),  capacidad number(3) not null, primary key (id));


drop table participante;
drop sequence participante_seq;
CREATE SEQUENCE participante_seq START WITH 1;
create table participante (id number(3)  default participante_seq.nextval not null, apellidos varchar2(35) not null, nombre varchar2(35) not null, primary key (id));


alter table inscripcion
drop constraint uk_inscripcion_participante_evento;
drop table inscripcion;
drop sequence inscripcion_seq;
CREATE SEQUENCE inscripcion_seq START WITH 1;
create table inscripcion (id number(3)  default inscripcion_seq.nextval  , id_evento number(3) not null, id_participante number(3) not null,
 constraint pk_inscripcion primary key (id) );
ALTER TABLE inscripcion
ADD CONSTRAINT uk_inscripcion_participante_evento UNIQUE  (id_participante, id_evento);


--PERMISOS EN TABLAS AL USER: 
grant select, insert,delete on eventos to inscrip_admin ;
grant select, insert,delete on participante to inscrip_admin ;
grant select, insert,delete on inscripcion to inscrip_admin ;
