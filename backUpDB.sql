create table cliente (
	id serial,
	nombre text NOT NULL,
	apellido text NOT NULL,
	correo text NOT NULL,
	pass text NOT NULL,
	fono integer NOT NULL,
	PRIMARY KEY (id)
);

insert into cliente (nombre, apellido, correo, pass, fono)
values ('John', 'Wick', 'dogLover@gmail.com', 't4ctic4lSuit', 930027113);