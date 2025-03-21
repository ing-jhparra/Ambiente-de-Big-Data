CREATE DATABASE IF NOT EXISTS bigdata2;
USE bigdata2;

DROP TABLE IF EXISTS compra;
CREATE TABLE IF NOT EXISTS compra (
  IdCompra				INTEGER,
  Fecha 				DATE,
  IdProducto			INTEGER,
  Cantidad			    INTEGER,
  Precio				FLOAT,
  IdProveedor			INTEGER
)
STORED AS PARQUET
LOCATION '/data2/compra'
TBLPROPERTIES ('parquet.compression'='SNAPPY');

INSERT INTO compra
SELECT
	IdCompra,
	Fecha,
	IdProducto,
	Cantidad,
	Precio,
	IdProveedor
FROM 
    bigdata.compra;

DROP TABLE IF EXISTS gasto;
CREATE TABLE IF NOT EXISTS gasto (
  IdGasto				INTEGER,
  IdSucursal			INTEGER,
  Fecha 				DATE,
  Monto				    FLOAT
)
PARTITIONED BY(IdTipoGasto INTEGER)
STORED AS PARQUET
LOCATION '/data2/gasto'
TBLPROPERTIES ('parquet.compression'='SNAPPY');

INSERT INTO gasto
PARTITION(IdTipoGasto=1)
SELECT
	IdGasto,
	IdSucursal,
	Fecha,
	Monto
FROM bigdata.gasto
WHERE IdTipoGasto=1;

INSERT INTO gasto
PARTITION(IdTipoGasto=2)
SELECT
	IdGasto,
	IdSucursal,
	Fecha,
	Monto
FROM bigdata.gasto
WHERE IdTipoGasto=2;

INSERT INTO gasto
PARTITION(IdTipoGasto=3)
SELECT
	IdGasto,
	IdSucursal,
	Fecha,
	Monto
FROM bigdata.gasto
WHERE IdTipoGasto=3;

INSERT INTO gasto
PARTITION(IdTipoGasto=4)
SELECT
	IdGasto,
	IdSucursal,
	Fecha,
	Monto
FROM bigdata.gasto
WHERE IdTipoGasto=4;

DROP TABLE IF EXISTS tipo_gasto;
CREATE TABLE IF NOT EXISTS tipo_gasto (
  IdTipoGasto			INTEGER,
  Descripcion			VARCHAR(50),
  Monto_Aproximado	    FLOAT
)
STORED AS PARQUET
LOCATION '/data2/tipodegasto'
TBLPROPERTIES ('parquet.compression'='SNAPPY');

INSERT INTO tipo_gasto
SELECT
	IdTipoGasto,
	Descripcion,
	Monto_Aproximado
FROM bigdata.tipo_gasto;

DROP TABLE IF EXISTS venta;
CREATE TABLE IF NOT EXISTS venta (
  IdVenta				INTEGER,
  Fecha 				DATE,
  Fecha_Entrega 		DATE,
  IdCanal				INTEGER, 
  IdCliente			INTEGER, 
  IdSucursal			INTEGER,
  IdEmpleado			INTEGER,
  IdProducto			INTEGER,
  Precio				FLOAT,
  Cantidad			INTEGER
)
STORED AS PARQUET
LOCATION '/data2/venta'
TBLPROPERTIES ('parquet.compression'='SNAPPY');

INSERT INTO venta
SELECT 	
	IdVenta,
	Fecha,
	Fecha_Entrega,
	IdCanal,
	IdCliente,
	IdSucursal,
	IdEmpleado,
	IdProducto,
	Precio,
	Cantidad
FROM bigdata.venta;

DROP TABLE IF EXISTS canal_venta;
CREATE TABLE IF NOT EXISTS canal_venta (
  IdCanal				INTEGER,
  Canal 				VARCHAR(50)
)
STORED AS PARQUET
LOCATION '/data2/canaldeventa'
TBLPROPERTIES ('parquet.compression'='SNAPPY');

INSERT INTO canal_venta
SELECT
	IdCanal,
	Canal
FROM bigdata.canal_venta;

DROP TABLE IF EXISTS cliente;
CREATE TABLE IF NOT EXISTS cliente (
	IdCliente			INTEGER,
	Provincia			VARCHAR(50),
	Nombre_y_Apellido	VARCHAR(80),
	Domicilio			VARCHAR(150),
	Telefono			VARCHAR(30),
	Edad				VARCHAR(5),
	Localidad			VARCHAR(80),
	Longitud			FLOAT,
	Latitud				FLOAT
)
STORED AS PARQUET
LOCATION '/data2/cliente'
TBLPROPERTIES ('parquet.compression'='SNAPPY');

INSERT INTO cliente
(   idcliente,
	provincia,
	nombre_y_apellido,
	domicilio,
	telefono,
	edad,
	localidad,
	longitud,
	latitud)
SELECT
	ID,
	Provincia,
	Nombre_y_Apellido,
	Domicilio,
	Telefono,
	Edad,
	Localidad,
	REPLACE(Y, ',', '.'),
	REPLACE(X, ',', '.')
FROM bigdata.cliente;

DROP TABLE IF EXISTS producto;
CREATE TABLE IF NOT EXISTS producto (
	IdProducto					INTEGER,
	Descripcion					VARCHAR(100),
	Tipo						VARCHAR(50),
	Precio						FLOAT
)
STORED AS PARQUET
LOCATION '/data2/producto'
TBLPROPERTIES ('parquet.compression'='SNAPPY');

INSERT INTO producto
	(idproducto,
	descripcion,
	tipo,
	precio)
SELECT
	IdProducto,
	Concepto,
	Tipo,
	REPLACE(Precio, ',', '.')
FROM bigdata.producto;

DROP TABLE IF EXISTS empleado;
CREATE TABLE IF NOT EXISTS empleado (
	CodigoEmpleado	INTEGER,
	Apellido		VARCHAR(50),
	Nombre	        VARCHAR(80),
	Sucursal		VARCHAR(150),
	Sector			VARCHAR(30),
	Cargo			VARCHAR(30),
	Salario			FLOAT
)
STORED AS PARQUET
LOCATION '/data2/empleado'
TBLPROPERTIES ('parquet.compression'='SNAPPY');

INSERT INTO empleado
	(codigoempleado,
	apellido,
	nombre,
	sucursal,
	sector,
	cargo,
	salario)
SELECT
	ID_empleado,
	Apellido,
	Nombre,
	Sucursal,
	Sector,
	Cargo,
	Salario
FROM bigdata.empleado;

DROP TABLE IF EXISTS sucursal;
CREATE TABLE IF NOT EXISTS sucursal (
	IdSucursal	INTEGER,
	Sucursal	VARCHAR(40),
	Domicilio	VARCHAR(150),
	Localidad	VARCHAR(80),
	Provincia	VARCHAR(50),
	Latitud		FLOAT,
	Longitud	FLOAT
)
STORED AS PARQUET
LOCATION '/data2/sucursal'
TBLPROPERTIES ('parquet.compression'='SNAPPY');

INSERT INTO sucursal
SELECT	
	IdSucursal,
	Sucursal,
	Domicilio,
	Localidad,
	Provincia,
	REPLACE(Latitud, ',', '.'),
	REPLACE(Longitud, ',', '.')
FROM bigdata.sucursal;

DROP TABLE IF EXISTS calendario;
CREATE TABLE calendario (
        id                      INTEGER,
        fecha                 	DATE,
        anio                    INTEGER,
        mes                   	INTEGER,
        dia                     INTEGER,
        trimestre               INTEGER,
        semana                  INTEGER,
        dia_nombre              VARCHAR(9),
        mes_nombre              VARCHAR(9)
)
STORED AS PARQUET
LOCATION '/data2/calendario'
TBLPROPERTIES ('parquet.compression'='SNAPPY');

INSERT INTO calendario
SELECT
	id,
	fecha,
	anio,
	mes,
	dia,
	trimestre,
	semana,
	dia_nombre,
	mes_nombre
FROM bigdata.calendario;

DROP TABLE IF EXISTS proveedor;
CREATE TABLE IF NOT EXISTS proveedor (
	IDProveedor			INTEGER,
	Nombre	VARCHAR(40),
	Address	VARCHAR(150),
	City	VARCHAR(80),
	State	VARCHAR(50),
	Country	VARCHAR(20),
	departamen	VARCHAR(50)
)
STORED AS PARQUET
LOCATION '/data2/proveedor'
TBLPROPERTIES ('parquet.compression'='SNAPPY');

INSERT INTO proveedor
SELECT
	IdProveedor	,
	Nombre,
	Direccion,
	Ciudad,
	Provincia,
	Pais,
	Departamento
FROM bigdata.proveedor;
