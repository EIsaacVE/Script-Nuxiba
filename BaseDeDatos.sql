/*-----Creación de la Base de Datos*/
create database NuxubiA;
use NuxubiA;


/*-----Creación de tablas-----*/
create table tipoUsuario(
	idTipoUsuario int auto_increment not null,
    descripcion varchar(100),
    primary key(idTipoUsuario)
);

create table CatalogoResultados(
	idResultados int auto_increment not null,
    descripcion varchar(100),
    primary key (idResultados)
);

/*Tabla con llave foranea*/
create table usuarios(
	idUsuario int auto_increment not null,
    nombre varchar(50),
    apellidoPaterno varchar(50),
    apellidoMaterno varchar(50),
    idTipoUsuarioF int,
    primary key(idUsuario),
    foreign key(idTipoUsuarioF) references tipoUsuario(idTipoUsuario)
);

/*Tabla con llave foranea*/
create table Marcaciones(
	idMarcaciones int auto_increment not null,
	fecha datetime,
	telefono varchar(50),
	duracion int,
	idResultadosF int,
	idUsuarioF int,
	primary key(idMarcaciones),
    foreign key (idResultadosF) references CatalogoResultados(idResultados),
    foreign key (idUsuarioF) references usuarios(idUsuario)
);