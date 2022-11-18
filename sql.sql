/* las tablas estan con esa sintaxis porque tuve un problema que cerro dos 
veces pgAdmin y los cambios no se guardaron, el codigo los saque del SQL 
que da pgAdmin al abrir las tablas desde la interfaz*/
-- CREACION DE LA TABLA ARTICULO
CREATE TABLE IF NOT EXISTS public.articulo
(
    id_articulo integer NOT NULL,
    id_categoria integer,
    nombre character varying(100) COLLATE pg_catalog."default",
    precio_venta integer,
    stock integer,
    CONSTRAINT articulo_pkey PRIMARY KEY (id_articulo),
    CONSTRAINT articulo_id_categoria_fkey FOREIGN KEY (id_categoria)
        REFERENCES public.categoria (id_categoria) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

-- CREACION DE LA TABLA CATEGORIA
CREATE TABLE IF NOT EXISTS public.categoria
(
    id_categoria integer NOT NULL,
    nombre character varying(50) COLLATE pg_catalog."default",
    descripcion character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT categoria_pkey PRIMARY KEY (id_categoria)
)

-- CREACION DE LA TABLA DETALLE DE INGRESO
CREATE TABLE IF NOT EXISTS public.detalle_ingreso
(
    id_detalleingreso integer NOT NULL,
    id_ingreso integer,
    id_articulo integer,
    cantidad integer,
    precio integer,
    CONSTRAINT detalle_ingreso_pkey PRIMARY KEY (id_detalleingreso),
    CONSTRAINT detalle_ingreso_id_articulo_fkey FOREIGN KEY (id_articulo)
        REFERENCES public.articulo (id_articulo) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT detalle_ingreso_id_ingreso_fkey FOREIGN KEY (id_ingreso)
        REFERENCES public.ingreso (id_ingreso) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

-- CREACION DE LA TABLA INGRESO
CREATE TABLE IF NOT EXISTS public.ingreso
(
    id_ingreso integer NOT NULL,
    id_usuario integer,
    fecha character varying(10) COLLATE pg_catalog."default",
    total integer,
    CONSTRAINT ingreso_pkey PRIMARY KEY (id_ingreso),
    CONSTRAINT ingreso_id_usuario_fkey FOREIGN KEY (id_usuario)
        REFERENCES public.usuario (id_usuario) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

-- CREACION DE LA TABLA USUARIO
CREATE TABLE IF NOT EXISTS public.usuario
(
    id_usuario integer NOT NULL,
    nombre character varying(100) COLLATE pg_catalog."default",
    rfc character varying(13) COLLATE pg_catalog."default",
    direccion character varying(70) COLLATE pg_catalog."default",
    telefono character varying(20) COLLATE pg_catalog."default",
    email character varying(50) COLLATE pg_catalog."default",
    "contraseña" character varying(100) COLLATE pg_catalog."default",
    CONSTRAINT usuario_pkey PRIMARY KEY (id_usuario)
)

-- CREACION DE LA TABLA CLIENTE
CREATE TABLE cliente(
id_cliente INT PRIMARY KEY,
direccion VARCHAR(70),
telefono VARCHAR(20),
email VARCHAR(50),
contraseña VARCHAR(100)
);

-- CREACION DE LA TABLA CLIENTE
CREATE TABLE compra(
id_compra INT PRIMARY KEY,
id_cliente INT REFERENCES cliente,
fecha VARCHAR(10),
total INT
);

-- CREACION DE LA TABLA DETALLE COMPRA
CREATE TABLE detalle_compra(
id_detallecompra INT PRIMARY KEY,
id_compra INT REFERENCES compra,
id_articulo INT REFERENCES articulo,
cantidad INT,
precio INT
);

-- QUERYS DE LAS TABLAS
	-- ARTICULO
	SELECT * FROM articulo;
	-- CATEGORIA
	SELECT * FROM categoria;
	-- DETALLE INGRESO
	SELECT * FROM detalle_ingreso;
	-- INGRESO
	SELECT * FROM ingreso;
	-- USUARIO
	SELECT * FROM usuario;
	-- CLIENTE
	SELECT * FROM cliente;
	-- COMPRA
	SELECT * FROM compra;
	-- DETALLE COMPRA
	SELECT * FROM detalle_compra;

-- INSERCION DE DATOS A LAS TABLAS
	-- ARTICULO
		-- en esta tabla inserte 10 filas pero por el error del pgAdmin las perdi
	-- CATEGORIA
		-- en esta tabla igual inserte 7 filas pero ocurrio el error
	-- DETALLE INGRESO
	INSERT INTO detalle_ingreso VALUES(111498271,128250156,240718684,50,1400);
	INSERT INTO detalle_ingreso VALUES(111498272,128250156,240718690,170,1700);
	INSERT INTO detalle_ingreso VALUES(111498273,128250156,240718685,20,1900);
	-- INGRESO
	INSERT INTO ingreso VALUES(128250156,19216821,'17/11/2022',50000);
	-- USUARIO
	INSERT INTO usuario VALUES(192168217,'Eliud Flores','1234567890123','Col. U','8119607834','jair.floresp@uanl.edu.mx','052e2c577769b6bd155d90723da5b2475f007365');
	INSERT INTO usuario VALUES(192168218,'Jorge Torres','5148967102589','Col. CR','811980792','jorge.torresb@uanl.edu.mx','89ef60bc9f69226f6aa3aad1b9e6f27cadb787a8');
	INSERT INTO usuario VALUES(192168219,'Briseida Puente','4861795803158','Col. SM','81193758','briseida.puentet@uanl.edu.mx','d8f750f488f5af6bf84ca4b9b838ae554742546e');
	-- CLIENTE
	INSERT INTO cliente VALUES(255791382,'Col. C #2961','8119603479','jairfloreskye@gmail.com','7b1cf1d23e82262e6ec55b4270ef521f476ed77c');
	INSERT INTO cliente VALUES(255791383,'Col. A #542','8119648729','ratonvaquero@gmail.com','7a545cfd83b3daca9d9f5ee91c7672bb9d91b5e0');
	INSERT INTO cliente VALUES(255791383,'Col. B #26','8181648929','cruzazulcampeon@gmail.com','cfa388ba2fc075076ef0c7cb1569e77307451b64');
/* las tablas estan con esa sintaxis porque tuve un problema que cerro 
pgAdmin y los cambios no se guardaron, el codigo los saque del SQL que
da pgAdmin al abrir las tablas desde la interfaz*/
-- CREACION DE LA TABLA ARTICULO
CREATE TABLE IF NOT EXISTS public.articulo
(
    id_articulo integer NOT NULL,
    id_categoria integer,
    nombre character varying(100) COLLATE pg_catalog."default",
    precio_venta integer,
    stock integer,
    CONSTRAINT articulo_pkey PRIMARY KEY (id_articulo),
    CONSTRAINT articulo_id_categoria_fkey FOREIGN KEY (id_categoria)
        REFERENCES public.categoria (id_categoria) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

-- CREACION DE LA TABLA CATEGORIA
CREATE TABLE IF NOT EXISTS public.categoria
(
    id_categoria integer NOT NULL,
    nombre character varying(50) COLLATE pg_catalog."default",
    descripcion character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT categoria_pkey PRIMARY KEY (id_categoria)
)

-- CREACION DE LA TABLA DETALLE DE INGRESO
CREATE TABLE IF NOT EXISTS public.detalle_ingreso
(
    id_detalleingreso integer NOT NULL,
    id_ingreso integer,
    id_articulo integer,
    cantidad integer,
    precio integer,
    CONSTRAINT detalle_ingreso_pkey PRIMARY KEY (id_detalleingreso),
    CONSTRAINT detalle_ingreso_id_articulo_fkey FOREIGN KEY (id_articulo)
        REFERENCES public.articulo (id_articulo) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT detalle_ingreso_id_ingreso_fkey FOREIGN KEY (id_ingreso)
        REFERENCES public.ingreso (id_ingreso) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

-- CREACION DE LA TABLA INGRESO
CREATE TABLE IF NOT EXISTS public.ingreso
(
    id_ingreso integer NOT NULL,
    id_usuario integer,
    fecha character varying(10) COLLATE pg_catalog."default",
    total integer,
    CONSTRAINT ingreso_pkey PRIMARY KEY (id_ingreso),
    CONSTRAINT ingreso_id_usuario_fkey FOREIGN KEY (id_usuario)
        REFERENCES public.usuario (id_usuario) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

-- CREACION DE LA TABLA USUARIO
CREATE TABLE IF NOT EXISTS public.usuario
(
    id_usuario integer NOT NULL,
    nombre character varying(100) COLLATE pg_catalog."default",
    rfc character varying(13) COLLATE pg_catalog."default",
    direccion character varying(70) COLLATE pg_catalog."default",
    telefono character varying(20) COLLATE pg_catalog."default",
    email character varying(50) COLLATE pg_catalog."default",
    "contraseña" character varying(100) COLLATE pg_catalog."default",
    CONSTRAINT usuario_pkey PRIMARY KEY (id_usuario)
)

-- CREACION DE LA TABLA CLIENTE
CREATE TABLE cliente(
id_cliente INT PRIMARY KEY,
direccion VARCHAR(70),
telefono VARCHAR(20),
email VARCHAR(50),
contraseña VARCHAR(100)
);

-- CREACION DE LA TABLA CLIENTE
CREATE TABLE compra(
id_compra INT PRIMARY KEY,
id_cliente INT REFERENCES cliente,
fecha VARCHAR(10),
total INT
);

-- CREACION DE LA TABLA DETALLE COMPRA
CREATE TABLE detalle_compra(
id_detallecompra INT PRIMARY KEY,
id_compra INT REFERENCES compra,
id_articulo INT REFERENCES articulo,
cantidad INT,
precio INT
);

-- QUERYS DE LAS TABLAS
	-- ARTICULO
	SELECT * FROM articulo;
	-- CATEGORIA
	SELECT * FROM categoria;
	-- DETALLE INGRESO
	SELECT * FROM detalle_ingreso;
	-- INGRESO
	SELECT * FROM ingreso;
	-- USUARIO
	SELECT * FROM usuario;
	-- CLIENTE
	SELECT * FROM cliente;
	-- COMPRA
	SELECT * FROM compra;
	-- DETALLE COMPRA
	SELECT * FROM detalle_compra;

-- INSERCION DE DATOS A LAS TABLAS
	-- ARTICULO
		-- en esta tabla inserte 10 filas pero por el error del pgAdmin las perdi
	-- CATEGORIA
		-- en esta tabla igual inserte 7 filas pero ocurrio el error
	-- DETALLE INGRESO
	INSERT INTO detalle_ingreso VALUES(111498271,128250156,240718684,50,1400);
	INSERT INTO detalle_ingreso VALUES(111498272,128250156,240718690,170,1700);
	INSERT INTO detalle_ingreso VALUES(111498273,128250156,240718685,20,1900);
	-- INGRESO
	INSERT INTO ingreso VALUES(128250156,19216821,'17/11/2022',50000);
	-- USUARIO
	INSERT INTO usuario VALUES(192168217,'Eliud Flores','1234567890123','Col. U','8119607834','jair.floresp@uanl.edu.mx','052e2c577769b6bd155d90723da5b2475f007365');
	INSERT INTO usuario VALUES(192168218,'Jorge Torres','5148967102589','Col. CR','811980792','jorge.torresb@uanl.edu.mx','89ef60bc9f69226f6aa3aad1b9e6f27cadb787a8');
	INSERT INTO usuario VALUES(192168219,'Briseida Puente','4861795803158','Col. SM','81193758','briseida.puentet@uanl.edu.mx','d8f750f488f5af6bf84ca4b9b838ae554742546e');
	-- CLIENTE
	INSERT INTO cliente VALUES(255791382,'Col. C #2961','8119603479','jairfloreskye@gmail.com','7b1cf1d23e82262e6ec55b4270ef521f476ed77c');
	INSERT INTO cliente VALUES(255791383,'Col. A #542','8119648729','ratonvaquero@gmail.com','7a545cfd83b3daca9d9f5ee91c7672bb9d91b5e0');
	INSERT INTO cliente VALUES(255791384,'Col. B #26','8181648929','cruzazulcampeon@gmail.com','cfa388ba2fc075076ef0c7cb1569e77307451b64');
	INSERT INTO cliente VALUES(255791385,'Col. D #6356','8189644824','abuelitogamer@hotmail.com','dfdc28ac5e6bdb4bde6e4d80c67e199c79f3243f');
	-- COMPRA
	INSERT INTO compra VALUES(141824971,255791382,'20/10/2022',500);
	INSERT INTO compra VALUES(141824972,255791383,'30/10/2022',450);
	INSERT INTO compra VALUES(141824973,255791384,'27/10/2022',120);
	INSERT INTO compra VALUES(141824974,255791385,'11/11/2022',50);
	-- DETALLE COMPRA
		-- en esta tabla inserte 8 filas pero igual se perdieron por el error

-- CREACION DE ROL DE LECTURA/ESCRITURA
CREATE ROLE readwrite;
GRANT CONNECT ON DATABASE cyberbakery TO readwrite;
GRANT USAGE ON SCHEMA public TO readwrite;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO readwrite;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA public TO readwrite;

-- CREACION DE USUARIO EMPLEADO
CREATE USER empleado WITH PASSWORD 'd1j2r3e4g5l6';
GRANT readwrite TO empleado;

