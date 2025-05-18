conn sys/Netec_123@localhost:1521/xepdb1 as sysdba

---CREAR USUARIO
CREATE USER inscrip_admin IDENTIFIED BY admin
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp;

GRANT CONNECT, RESOURCE TO inscrip_admin;
ALTER USER inscrip_admin QUOTA UNLIMITED ON users;

--verificar conexion
CONN inscrip_admin/admin@localhost:1521/xepdb1

