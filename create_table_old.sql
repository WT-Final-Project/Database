--Fichero de creacion de tablas del grupo C02


CREATE SEQUENCE idproyecto_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 999
    NO CYCLE;

-- Tabla proyecto
CREATE TABLE proyecto (
    idProyecto integer DEFAULT nextval('idproyecto_seq') PRIMARY KEY,
    nombre varchar(30) NOT NULL CHECK (nombre <> ''),
    descripcion varchar(300)
);

-- Tabla usuario
CREATE TABLE usuario (
    nombreUsuario varchar(25) PRIMARY KEY  CHECK (nombreUsuario <> ''),
    nombre varchar(15) NOT NULL CHECK (nombre <> ''),
    contrasenya varchar(10) NOT NULL CHECK (contrasenya <> ''),
    correo varchar(20) NOT NULL CHECK (correo <> ''),
    apellidos varchar(25) NOT NULL CHECK (apellidos <> '')
);

-- Tabla participan
CREATE TABLE  participan (
    idProyecto integer,
    nombreUsuario varchar(25),
    rango varchar(12) NOT NULL, -- Posibles lider y participante
    PRIMARY KEY (idProyecto, nombreUsuario),
    FOREIGN KEY (idProyecto) REFERENCES proyecto (idProyecto) ON DELETE CASCADE,
    FOREIGN KEY (nombreUsuario) REFERENCES usuario (nombreUsuario)
);

-- Secuencia para idTarea va desde 1 hasta 999
CREATE SEQUENCE idtarea_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 999
    NO CYCLE;


-- Tabla tarea
CREATE TABLE tarea (
    idTarea integer DEFAULT nextval('idtarea_seq') PRIMARY KEY,
    idProyecto integer NOT NULL,
    nombreUsuario varchar(25) NOT NULL,
    titulo varchar(25) NOT NULL,
    descripcion varchar(300) NOT NULL,
    fechaVencimineto DATE NOT NULL,
    completada integer CHECK (completada IN (0, 1)), --0 es no completada
    FOREIGN KEY (idProyecto) REFERENCES proyecto (idProyecto)  ON DELETE CASCADE,
    FOREIGN KEY (nombreUsuario) REFERENCES usuario (nombreUsuario)
);

-- Secuencia para idPeticion va desde 1 hasta 999
CREATE SEQUENCE idpeticion_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 999
    NO CYCLE;


-- Tabla peticion
CREATE TABLE peticion (
    idPeticion integer DEFAULT nextval('idpeticion_seq') PRIMARY KEY,
    idProyecto integer NOT NULL,
    nombreUsuario varchar(25) NOT NULL,
    descripcion varchar(300) NOT NULL,
    titulo varchar(25) NOT NULL,
    FOREIGN KEY (idProyecto) REFERENCES proyecto (idProyecto)  ON DELETE CASCADE,
    FOREIGN KEY (nombreUsuario) REFERENCES usuario (nombreUsuario)
);

-- Secuencia para idFichero va desde 1 hasta 999
CREATE SEQUENCE idfichero_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 999
    NO CYCLE;


-- Tabla fichero
CREATE TABLE fichero (
    idFichero integer DEFAULT nextval('idfichero_seq') PRIMARY KEY,
    nombre varchar(20) NOT NULL,
    idTarea integer NOT NULL,
    FOREIGN KEY (idTarea) REFERENCES tarea (idTarea)
);
