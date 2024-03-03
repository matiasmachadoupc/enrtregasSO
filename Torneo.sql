mysql> create database Torneo;
Query OK, 1 row affected (0.00 sec)

mysql> use Torneo;
Database changed

mysql> create table Jugador(
    -> ID integer primary key not null,
    -> Username text not null,
    -> Password text not null
    -> )engine=InnoDB;
Query OK, 0 rows affected (0.16 sec)

mysql> create table Partida(
    -> ID integer primary key not null,
    -> fechayhora text not null,
    -> duracion integer not null,
    -> ganador text not null
    -> )engine= InnoDB;
Query OK, 0 rows affected (0.04 sec)


mysql> create table participacion ( Jugador integer not null, Partida integer not null, Posicion integer not null, foreign key (Jugador) references Jugador(ID), foreign key (Partida) references Partida(ID) )engine=InnoDB;
Query OK, 0 rows affected (0.08 sec)

mysql> insert into Jugador values (1, 'Matias', 'mimara');
Query OK, 1 row affected (0.05 sec)

mysql> insert into Jugador values (2, 'Pau', 'mimara2');
Query OK, 1 row affected (0.01 sec)

mysql> insert into Jugador values (3, 'Marco', 'mimara3');
Query OK, 1 row affected (0.01 sec)

mysql> insert into Partida values(1,'01-02-24/12.50',30,'matias');
Query OK, 1 row affected (0.02 sec)

mysql> insert into Partida values(2,'23-02-24/21.30',24,'marco');
Query OK, 1 row affected (0.00 sec)

mysql> insert into Partida values(3,'05-03-24/15.23',36,'marco');
Query OK, 1 row affected (0.01 sec)

mysql> insert into Partida values(4,'07-03-24/9.08',21,'pau');
Query OK, 1 row affected (0.01 sec)

mysql> insert into Partida values(5,'08-03-24/17.00',27,'matias');
Query OK, 1 row affected (0.01 sec)

mysql> insert into participacion values(1,1,1);
Query OK, 1 row affected (0.01 sec)

mysql> insert into participacion values(1,2,2);
Query OK, 1 row affected (0.01 sec)

mysql> insert into participacion values(1,3,2);
Query OK, 1 row affected (0.02 sec)

mysql> insert into participacion values(1,4,3);
Query OK, 1 row affected (0.01 sec)

mysql> insert into participacion values(1,5,1);
Query OK, 1 row affected (0.00 sec)

mysql> insert into participacion values(2,1,2);
Query OK, 1 row affected (0.00 sec)

mysql> insert into participacion values(2,2,3);
Query OK, 1 row affected (0.00 sec)

mysql> insert into participacion values(2,3,3);
Query OK, 1 row affected (0.01 sec)

mysql> insert into participacion values(2,4,1);
Query OK, 1 row affected (0.01 sec)

mysql> insert into participacion values(2,5,2);
Query OK, 1 row affected (0.01 sec)

mysql> insert into participacion values(3,1,3);
Query OK, 1 row affected (0.01 sec)

mysql> insert into participacion values(3,2,1);
Query OK, 1 row affected (0.01 sec)

mysql> insert into participacion values(3,3,1);
Query OK, 1 row affected (0.01 sec)

mysql> insert into participacion values(3,4,2);
Query OK, 1 row affected (0.01 sec)

mysql> insert into participacion values(3,5,3);
Query OK, 1 row affected (0.01 sec)

mysql> create table maximapuntuacion( Jugador integer not null, Username text not null, Partida integer not null, Puntuacion integer not null, Foreign key (Jugador) references Jugador(ID), Foreign key (Partida) references Partida(ID) )engine = InnoDB;
Query OK, 0 rows affected (0.06 sec)

mysql> insert into maximapuntuacion  values(1,'matias',1,200);
Query OK, 1 row affected (0.01 sec)

mysql> insert into maximapuntuacion  values(3,'marco',3,220);
Query OK, 1 row affected (0.03 sec)

mysql> insert into maximapuntuacion  values(3,'marco',2,180);
Query OK, 1 row affected (0.01 sec)

mysql> insert into maximapuntuacion  values(2,'pau',4,185);
Query OK, 1 row affected (0.01 sec)

mysql> insert into maximapuntuacion  values(1,'matias',5,195);
Query OK, 1 row affected (0.02 sec)


