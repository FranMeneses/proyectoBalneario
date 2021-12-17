create table cliente (
	idCliente serial,
	nombre text NOT NULL,
	apellido text NOT NULL,
	correo text NOT NULL,
	pass text NOT NULL,
	fono integer NOT NULL,
	primary key (idCliente)
);

create table reserva (
	idReserva serial,
	idCliente serial,
	tipo text NOT NULL,
	primary key (idReserva, idCliente),
	foreign key (idCliente) references Cliente(idCliente)
);

create table semana (
	idReserva serial,
	idCliente serial,
	fechaInicio date NOT NULL,
	fechaTermino date NOT NULL,
	primary key (idReserva, idCliente),
	foreign key (idReserva, idCliente) references reserva(idReserva, idCliente)
);

create table dia (
	idReserva serial,
	idCliente serial,
	fechaDia date NOT NULL,
	primary key (idReserva, idCliente),
	foreign key (idReserva, idCliente) references reserva(idReserva, idCliente)
);

create table sombrillaGlorieta (
	idSomGlo serial,
	tipo text NOT NULL,
	primary key (idSomGlo)
);

create table adicionales (
	idAdicional serial,
	tipo text NOT NULL,
	primary key (idAdicional)
);

create table estacionamientos (
	idEstacionamiento serial,
	primary key (idEstacionamiento)
);

create table reservaSomGlo (
	idReserva serial,
	idCliente serial,
	idSomGlo serial,
	primary key (idReserva, idCliente, idSomGlo),
	foreign key (idReserva, idCliente) references reserva(idReserva, idCliente),
	foreign key (idSomGlo) references sombrillaGlorieta(idSomGlo)
);

create table reservaAdicionales (
	idReserva serial,
	idCliente serial,
	idSomGlo serial,
	idAdicional serial,
	primary key (idReserva, idCliente, idSomGlo, idAdicional),
	foreign key (idReserva, idCliente, idSomGlo) references reservaSomGlo(idReserva, idCliente, idSomGlo),
	foreign key (idAdicional) references adicionales(idAdicional)
);

create table reservaEstacionamiento (
	idReserva serial,
	idCliente serial,
	idEstacionamiento serial,
	primary key (idReserva, idCliente, idEstacionamiento),
	foreign key (idReserva, idCliente) references reserva(idReserva, idCliente),
	foreign key (idEstacionamiento) references estacionamientos(idEstacionamiento)
);