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

create table estacionamientos (
	idEstacionamiento serial,
	primary key (idEstacionamiento)
);

create table reservaSomGlo (
	idReserva serial,
	idCliente serial,
	sombrilla boolean,
	glorieta boolean,
	primary key (idReserva, idCliente),
	foreign key (idReserva, idCliente) references reserva(idReserva, idCliente)
);

create table reservaAdicionales (
	idReserva serial,
	idCliente serial,
	camas integer,
	sillas integer,
	tumbonas integer,
	primary key (idReserva, idCliente),
	foreign key (idReserva, idCliente) references reservaSomGlo(idReserva, idCliente)
);

create table reservaEstacionamiento (
	idReserva serial,
	idCliente serial,
	idEstacionamiento serial,
	primary key (idReserva, idCliente, idEstacionamiento),
	foreign key (idReserva, idCliente) references reserva(idReserva, idCliente),
	foreign key (idEstacionamiento) references estacionamientos(idEstacionamiento)
);