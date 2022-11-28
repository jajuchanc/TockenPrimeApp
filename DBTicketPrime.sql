create database DBTicketPrime;
go
use DBTicketPrime;
go

create table rol(
	Id int primary key identity(1,1) not null,
	nombre_rol varchar(252),
);
go

create table area(
	Id int primary key identity(1,1) not null,
	nombre_area varchar(250)
);
go

create table puesto (
	Id int primary key identity(1,1) not null,
	nombre_puesto varchar(250),
	id_area int
	constraint fk_area_puesto foreign key (id_area) references area(Id)
);
go

create table usuario(
	Id int primary key identity(1,1) not null,
	nombres varchar(250),
	apellidos varchar(250),
	correo varchar(250),
	contrasena varchar(8),
	id_puesto int,
	id_rol int,
	constraint fk_usuario_puesto foreign key (id_puesto) references area(Id),
	constraint fk_usuario_rol foreign key (id_rol) references area(Id)
);

go

create table estado (
	Id int primary key identity(1,1) not null,
	estado bit
);
go

create table tipoEstado (
	Id int primary key identity(1,1) not null,
	nombre_tipoEstado varchar(500)
);

go
create table tipoSolcitud(
	Id int primary key identity(1,1) not null,
	nombre_tipoSolicitud varchar(250)
);
go

create table prioridad (
	Id int primary key identity(1,1) not null,
	nombre_prioridad varchar(250)
);
go

create table ticket(
	Id int primary key identity(1,1) not null,
	Codigo  AS ('TICKET-'+right('000'+CONVERT([varchar],[Id]),(3))),
	idTipoSolicitud int,
	nombre varchar(500),
	idPrioridad int,
	descripcion varchar(1500),
	idEstado int,
	idTipoEstado int,
	idUsuario int,
	archivo HEX(5000)


);

