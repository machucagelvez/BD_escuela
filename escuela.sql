create database escuela

use escuela

create table carrera(
-- Autogenrador (identity)
Clave_c int identity,
-- not null: los valores no pueden ser nulos
nom_c varchar(50) not null,
durac_c float not null,
constraint pk_cc primary key (clave_c))
insert into carrera values ('medicina',5)
insert into carrera values ('Contaduría',4.5)
insert into carrera values ('Filosofía', 5)
select * from carrera 

create table materia(
clave_m int,
nom_m varchar(50) unique,
--Permite campo nulo (null), se debe poner null cuando se inserta
cred_m float null,
constraint pk_cm primary key (clave_m))
insert into materia values(11,'Trigonometría',null)
insert into materia values(12,'Cálculo',null)
insert into materia values(13,'Matemáticas',10)
select * from materia

create table profesor(
clave_p int,
nom_p varchar(150) not null,
dir_p varchar(200),
tel_p bigint unique,
hor_p datetime null,
constraint pk_cp primary key (Clave_p))
insert into profesor values(123, 'Benito', 'Cll 1 # 2-3', 3001234567, null)
insert into profesor values(234, 'Jorge', 'Cll 1 # 2-3', 3002345678, 1400-1600)
insert into profesor values(345, 'Mónica', 'Cll 2 # 3-4', 3012345678, 2020-11-09)
select * from profesor
-------Tabla alumno con clave foranea

create table alumno(
mat_alu int,
nom_alu varchar(150) not null,
edad_alu int,
sem_alu int,
gen_alu varchar(10),
clave_c1 int unique,
constraint pk_calu primary key (mat_alu),
constraint fk_fc1 foreign key (clave_c1) references carrera(clave_c))
insert into alumno values(21, 'Rigoberto', 23, 3, 'm', 1)
insert into alumno values(22, 'Josefa', 22, 4, 'f', 2)
insert into alumno values(23, 'Eustorgio', 28, 9, 'm', 3)
select * from alumno

------tablas intermedias alumno-profesor

create table alu_pro(
mat_alu1 int,
clave_p1 int,
constraint fk_falu1 foreign key(mat_alu1) references alumno (mat_alu),
constraint fk_fp1 foreign key (clave_p1) references profesor (clave_p))
insert into alu_pro values(21, 123)
insert into alu_pro values(21, 234)
insert into alu_pro values(23, 345)
select * from alu_pro

-------tabla intermedia materia-alumno

create table mat_alu(
clave_m1 int,
mat_alu2 int,
constraint fk_fm1 foreign key (clave_m1) references materia(clave_m),
constraint fk_falu2 foreign key (mat_alu2) references alumno(mat_alu))
insert into mat_alu values(11, 23)
insert into mat_alu values(12, 22)
insert into mat_alu values(13, 21)
select * from mat_alu

------------tabla intermedia materia profesor

create table mat_pro(
clave_m2 int,
clave_p2 int,
constraint fk_fm2 foreign key (clave_m2) references materia(clave_m),
constraint fk_fp2 foreign key (clave_p2) references profesor (clave_p))
insert into mat_pro values(11, 234)
insert into mat_pro values(12, 345)
insert into mat_pro values(13, 123)
select * from mat_pro