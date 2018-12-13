Create database Estacionamientos;
use Estacionamientos;

Create table Usuarios (
	idUsuario Int NOT NULL AUTO_INCREMENT,
	TipoUsuario Int NOT NULL,
	NombreUsuario Varchar(50),
	Apellido Varchar(80),
	Email Varchar(50) NOT NULL UNIQUE,
	password Varchar(20) NOT NULL,
	Direccion Varchar(50),
	Telefono Varchar(20),
	imgPerfil Mediumblob,
 Primary Key (idUsuario)
) Engine InnoDB default charset=latin1;

Create table Autos (
	idAuto Int NOT NULL AUTO_INCREMENT,
	placa Int(40) NOT NULL,
	modelo Varchar(50) NOT NULL,
	marca Varchar(50),
	descripcion Varchar(80),
	idUsuario Int NOT NULL,
 Primary Key (idAuto),
 Constraint usuarios_autos Foreign Key (idUsuario) references Usuarios (idUsuario) on delete  restrict on update  restrict
) Engine InnoDB default charset=latin1;

Create table Estacionamiento (
	idEstacionamiento Int NOT NULL AUTO_INCREMENT,
	TipoE Int NOT NULL,
	idUsuario Int NOT NULL,
	NomEst Varchar(30),
	Ciudad Varchar(50) NOT NULL,
	Direccion Varchar(20),
	Codpostal Int(5) NOT NULL,
	claveEstablecimiento Varchar(40) NOT NULL,
	tarifabase Double NOT NULL,
	tarifafraccion Double NOT NULL,
	latitud Double NOT NULL,
	longitud Double NOT NULL,
	Descripcion Varchar(70) NOT NULL,
	NumLugares Int NOT NULL,
	lugaresDisponibles Int,
	imgEstacionamiento Mediumblob,
	Fecha_registro Timestamp,
 Primary Key (idEstacionamiento),
 Constraint usuarios_estacioamiento Foreign Key (idUsuario) references Usuarios (idUsuario) on delete  restrict on update  restrict
) Engine InnoDB default charset=latin1;

Create table Empleados (
	idEmpleado Int NOT NULL AUTO_INCREMENT,
	NombreEmpleado Varchar(50),
	Apellido Varchar(80),
	Email Varchar(50) NOT NULL UNIQUE,
	password Varchar(20) NOT NULL,
	Telefono Varchar(20),
	imgPerfil Mediumblob,
	horaEntrada Time,
	horaSalida Time,
	idUsuario Int NOT NULL,
	idEstacionamiento Int NOT NULL,
	Constraint usuarios_empleado Foreign Key (idUsuario) references Usuarios (idUsuario) on delete  restrict on update  restrict
	Constraint estacionamiento_empleado Foreign Key (idEstacionamiento) references Estacionamiento (idEstacionamiento) on delete  restrict on update  restrict
 Primary Key (idEmpleado)
) Engine InnoDB default charset=latin1;

Create table MetodosPago (
	idMetodo Int NOT NULL AUTO_INCREMENT,
	nombreMetodo Varchar(30) NOT NULL,
	claveMetodo Varchar(20) NOT NULL,
	idUsuario Int NOT NULL,
 Primary Key (idMetodo),
 Constraint usuarios_metodosPago Foreign Key (idUsuario) references Usuarios (idUsuario) on delete  restrict on update  restrict
) Engine InnoDB default charset=latin1;

Create table Pago (
	idPago Int NOT NULL AUTO_INCREMENT,
	Monto Double,
	Fecha Timestamp,
	idMetodo Int NOT NULL,
	idUsuario Int NOT NULL,
 Primary Key (idPago),
 Constraint usuarios_pago Foreign Key (idUsuario) references Usuarios (idUsuario) on delete  restrict on update  restrict,
 Constraint metodoPago_pago Foreign Key (idMetodo) references MetodosPago (idMetodo) on delete  restrict on update  restrict
) Engine InnoDB default charset=latin1;

Create table Reserva (
	idReserva Int NOT NULL AUTO_INCREMENT, 
	idEstacionamiento Int NOT NULL,
	TimeReserva Timestamp,
	TimeEntrada Timestamp,
	TimeSalida Timestamp,
	TimeCancelacion Timestamp,
	idUsuario Int NOT NULL,
 Primary Key (idReserva),
 Constraint Estacionamiento_Reserva Foreign Key (idEstacionamiento) references Estacionamiento (idEstacionamiento) on delete  restrict on update  restrict,
 Constraint usuarios_reserva Foreign Key (idUsuario) references Usuarios (idUsuario) on delete  restrict on update  restrict
) Engine InnoDB default charset=latin1;

Create table QR (
	idQR Int NOT NULL AUTO_INCREMENT,
	codigoQR Mediumblob,
	idUsuario Int NOT NULL,
	idReserva Int NOT NULL,
 Primary Key (idQR),
 Constraint usuaria_qr Foreign Key (idUsuario) references Usuarios (idUsuario) on delete  restrict on update  restrict,
 Constraint reserva_qr Foreign Key (idReserva) references Autos (idReserva) on delete  restrict on update  restrict
) Engine InnoDB default charset=latin1;

Create table Autos_Estacionados (
	idAutoEstacionado Int NOT NULL AUTO_INCREMENT,
	fechaUso Timestamp,
	idAuto Int NOT NULL,
	idEstacionamiento Int NOT NULL,
 Primary Key (idAutoEstacionado),
 Constraint estacionamiento_autosEst Foreign Key (idEstacionamiento) references Estacionamiento (idEstacionamiento) on delete  restrict on update  restrict,
 Constraint autos_autosEst Foreign Key (idAuto) references Autos (idAuto) on delete  restrict on update  restrict
) Engine InnoDB default charset=latin1;

Create table Reportes_Resenas (
	idOpinion Int NOT NULL AUTO_INCREMENT,
	Descripcion Varchar(50),
	Calificacion Int,
	Fecha Timestamp NOT NULL,
	ImgReporte Mediumblob,
	idUsuario Int NOT NULL,
	idEstacionamiento Int NOT NULL,
 Primary Key (idOpinion),
 Constraint usuarios_opiniones Foreign Key (idUsuario) references Usuarios (idUsuario) on delete  restrict on update  restrict,
 Constraint comentarios_estacionamiento Foreign Key (idEstacionamiento) references Estacionamiento (idEstacionamiento) on delete  restrict on update  restrict
) Engine InnoDB default charset=latin1;

