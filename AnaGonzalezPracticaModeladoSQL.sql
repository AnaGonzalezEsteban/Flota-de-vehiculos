---------- PRÁCTICA DE MODELADO DE BASES DE DATOS EN SQL ----------

--- DDL: DEFINICIÓN DE ESTRUCTURAS DE DATOS

-- CREACIÓN DE ESQUEMA DE TRABAJO

-- Creación del esquema de trabajo:
create schema ana_gonzalez authorization lidhozau;



-- CREACIÓN DE TABLAS

-- Creación de la tabla 'Colores':
create table ana_gonzalez.colores(
	id_color varchar(10) not null, --PK
	nombre varchar(20) not null,
	comentario varchar(300) null
);

-- Creación de las restricciones de 'Colores':
alter table ana_gonzalez.colores
add constraint colores_PK primary key (id_color);

-- Creación de la tabla 'Aseguradoras':
create table ana_gonzalez.aseguradoras(
	id_aseguradora varchar(10) not null, --PK
	nombre varchar(20) not null,
	comentario varchar(300) null
);

-- Creación de las restricciones de 'Aseguradoras':
alter table ana_gonzalez.aseguradoras
add constraint aseguradoras_PK primary key (id_aseguradora);

-- Creación de la tabla 'Seguro':
create table ana_gonzalez.seguro(
	num_poliza varchar(10) not null, --PK
	id_aseguradora varchar(10) not null, --FK
	comentario varchar(300) null
);

-- Creación de las restricciones de 'Seguro':
alter table ana_gonzalez.seguro
add constraint seguro_PK primary key (num_poliza);

alter table ana_gonzalez.seguro
add constraint seguro_aseguradoras_FK foreign key (id_aseguradora) references ana_gonzalez.aseguradoras(id_aseguradora);

-- Creación de la tabla 'Grupos':
create table ana_gonzalez.grupos(
	id_grupo varchar(10) not null, --PK
	nombre varchar(20) not null,
	comentario varchar(300) null
);

-- Creación de las restricciones de 'Grupos':
alter table ana_gonzalez.grupos
add constraint grupos_PK primary key (id_grupo);

-- Creación de la tabla 'Marcas':
create table ana_gonzalez.marcas(
	id_marca varchar(10) not null, --PK
	id_grupo varchar(10) not null, --FK
	nombre varchar(20) not null,
	comentario varchar(300) null
);

-- Creación de las restricciones de 'Marcas':
alter table ana_gonzalez.marcas
add constraint marcas_PK primary key (id_marca);

alter table ana_gonzalez.marcas
add constraint marcas_grupos_FK foreign key (id_grupo) references ana_gonzalez.grupos(id_grupo);

-- Creación de la tabla 'Modelos':
create table ana_gonzalez.modelos(
	id_modelo varchar(10) not null, --PK
	id_marca varchar(10) not null, --FK
	nombre varchar(20) not null,
	comentario varchar(300) null
);

-- Creación de las restricciones de 'Modelos':
alter table ana_gonzalez.modelos
add constraint modelos_PK primary key (id_modelo);

alter table ana_gonzalez.modelos
add constraint modelos_marcas_FK foreign key (id_marca) references ana_gonzalez.marcas(id_marca);

-- Creación de la tabla 'Vehiculos':
create table ana_gonzalez.vehiculos(
	id_vehiculo varchar(10) not null, --PK
	id_modelo varchar(10) not null,--FK
	matricula varchar(10) not null,
	id_color varchar(10) not null,--FK
	num_km integer not null,
	num_poliza varchar(10) not null,--FK
	fecha_compra date not null,
	comentario varchar(300) null
);

-- Creación de las restricciones de 'Vehiculos':
alter table ana_gonzalez.vehiculos
add constraint vehiculos_PK primary key (id_vehiculo);

alter table ana_gonzalez.vehiculos
add constraint vehiculos_modelos_FK foreign key (id_modelo) references ana_gonzalez.modelos(id_modelo);

alter table ana_gonzalez.vehiculos
add constraint vehiculos_colores_FK foreign key (id_color) references ana_gonzalez.colores(id_color);

alter table ana_gonzalez.vehiculos
add constraint vehiculos_seguro_FK foreign key (num_poliza) references ana_gonzalez.seguro(num_poliza);

-- Creación de la tabla 'Monedas':
create table ana_gonzalez.monedas(
	id_moneda varchar(10) not null, --PK
	nombre varchar(20) not null,
	comentario varchar(300) null
);

-- Creación de las restricciones de 'Monedas':
alter table ana_gonzalez.monedas
add constraint monedas_PK primary key (id_moneda);

-- Creación de la tabla 'Revisiones':
create table ana_gonzalez.revisiones(
	id_revision varchar(10) not null, --PK
	id_vehiculo varchar(10) not null, --PK,FK
	fecha_revision date not null,
	km_revision integer not null,
	importe_revision integer not null,
	id_moneda varchar(10) not null, --FK
	comentario varchar(300) null	
);

-- Creación de las restricciones de 'Revisiones':
alter table ana_gonzalez.revisiones
add constraint revisiones_PK primary key (id_revision,id_vehiculo);

alter table ana_gonzalez.revisiones
add constraint revisiones_vehiculos_FK foreign key (id_vehiculo) references ana_gonzalez.vehiculos(id_vehiculo);

alter table ana_gonzalez.revisiones
add constraint revisiones_monedas_FK foreign key (id_moneda) references ana_gonzalez.monedas(id_moneda);



--- DML: MANIPULACIÓN DE DATOS 

-- INTRODUCCIÓN DE DATOS EN LAS TABLAS

-- Introducción de datos en la tabla 'Colores':
insert into ana_gonzalez.colores
(id_color,nombre)
values ('001','blanco');

insert into ana_gonzalez.colores
(id_color,nombre)
values ('002','negro');

insert into ana_gonzalez.colores
(id_color,nombre)
values ('003','rojo');

-- Comprobación: select * from ana_gonzalez.colores

-- Introducción de datos en la tabla 'Aseguradoras':
insert into ana_gonzalez.aseguradoras 
(id_aseguradora,nombre)
values ('A01','Mutua Madrileña');

insert into ana_gonzalez.aseguradoras 
(id_aseguradora,nombre)
values ('A02','Santa Lucía');

insert into ana_gonzalez.aseguradoras 
(id_aseguradora,nombre)
values ('A03','Mapfre');

-- Comprobación: select * from ana_gonzalez.aseguradoras

-- Introducción de datos en la tabla 'Seguro':
insert into ana_gonzalez.seguro  
(num_poliza,id_aseguradora)
values ('P01','A01');

insert into ana_gonzalez.seguro  
(num_poliza,id_aseguradora)
values ('P02','A01');

insert into ana_gonzalez.seguro  
(num_poliza,id_aseguradora)
values ('P03','A01');

insert into ana_gonzalez.seguro  
(num_poliza,id_aseguradora)
values ('P04','A02');

insert into ana_gonzalez.seguro  
(num_poliza,id_aseguradora)
values ('P05','A02');

insert into ana_gonzalez.seguro  
(num_poliza,id_aseguradora)
values ('P06','A03');

insert into ana_gonzalez.seguro  
(num_poliza,id_aseguradora)
values ('P07','A03');

insert into ana_gonzalez.seguro  
(num_poliza,id_aseguradora)
values ('P08','A03');

insert into ana_gonzalez.seguro  
(num_poliza,id_aseguradora)
values ('P09','A03');

insert into ana_gonzalez.seguro  
(num_poliza,id_aseguradora)
values ('P10','A02');

insert into ana_gonzalez.seguro  
(num_poliza,id_aseguradora)
values ('P11','A02');

insert into ana_gonzalez.seguro  
(num_poliza,id_aseguradora)
values ('P12','A01');

insert into ana_gonzalez.seguro  
(num_poliza,id_aseguradora)
values ('P13','A01');

insert into ana_gonzalez.seguro  
(num_poliza,id_aseguradora)
values ('P14','A03');

insert into ana_gonzalez.seguro  
(num_poliza,id_aseguradora)
values ('P15','A02');

insert into ana_gonzalez.seguro  
(num_poliza,id_aseguradora)
values ('P16','A01');

insert into ana_gonzalez.seguro  
(num_poliza,id_aseguradora)
values ('P17','A01');

insert into ana_gonzalez.seguro  
(num_poliza,id_aseguradora)
values ('P18','A02');

insert into ana_gonzalez.seguro  
(num_poliza,id_aseguradora)
values ('P19','A03');

-- Comprobación: select * from ana_gonzalez.seguro

-- Introducción de datos en la tabla 'Grupos':
insert into ana_gonzalez.grupos  
(id_grupo,nombre)
values ('G01','Renault Nissan');

insert into ana_gonzalez.grupos  
(id_grupo,nombre)
values ('G02','PSA');

insert into ana_gonzalez.grupos  
(id_grupo,nombre)
values ('G03','Volkswagen');

-- Comprobación: select * from ana_gonzalez.grupos

-- Introducción de datos en la tabla 'Marcas':
insert into ana_gonzalez.marcas  
(id_marca,id_grupo,nombre)
values ('M01','G01','Renault');

insert into ana_gonzalez.marcas  
(id_marca,id_grupo,nombre)
values ('M02','G01','Nissan');

insert into ana_gonzalez.marcas  
(id_marca,id_grupo,nombre)
values ('M03','G01','Dacia');

insert into ana_gonzalez.marcas  
(id_marca,id_grupo,nombre)
values ('M04','G02','Citroen');

insert into ana_gonzalez.marcas  
(id_marca,id_grupo,nombre)
values ('M05','G02','Peugeot');

insert into ana_gonzalez.marcas  
(id_marca,id_grupo,nombre)
values ('M06','G02','Opel');

insert into ana_gonzalez.marcas  
(id_marca,id_grupo,nombre)
values ('M07','G03','Volkswagen');

insert into ana_gonzalez.marcas  
(id_marca,id_grupo,nombre)
values ('M08','G03','Audi');

insert into ana_gonzalez.marcas  
(id_marca,id_grupo,nombre)
values ('M09','G03','Seat');

-- Comprobación: select * from ana_gonzalez.marcas

-- Introducción de datos en la tabla 'Modelos':
insert into ana_gonzalez.modelos  
(id_modelo,id_marca,nombre)
values ('1','M01','Megane');

insert into ana_gonzalez.modelos  
(id_modelo,id_marca,nombre)
values ('2','M01','Clio');

insert into ana_gonzalez.modelos  
(id_modelo,id_marca,nombre)
values ('3','M02','Qashqai');

insert into ana_gonzalez.modelos  
(id_modelo,id_marca,nombre)
values ('4','M03','Duster');

insert into ana_gonzalez.modelos  
(id_modelo,id_marca,nombre)
values ('5','M03','Logan');

insert into ana_gonzalez.modelos  
(id_modelo,id_marca,nombre)
values ('6','M04','C5');

insert into ana_gonzalez.modelos  
(id_modelo,id_marca,nombre)
values ('7','M05','307');
insert into ana_gonzalez.modelos  
(id_modelo,id_marca,nombre)
values ('8','M05','5008');

insert into ana_gonzalez.modelos  
(id_modelo,id_marca,nombre)
values ('9','M05','208');

insert into ana_gonzalez.modelos  
(id_modelo,id_marca,nombre)
values ('10','M06','Corsa');

insert into ana_gonzalez.modelos  
(id_modelo,id_marca,nombre)
values ('11','M06','Astra');

insert into ana_gonzalez.modelos  
(id_modelo,id_marca,nombre)
values ('12','M07','Polo');

insert into ana_gonzalez.modelos  
(id_modelo,id_marca,nombre)
values ('13','M07','Golf');

insert into ana_gonzalez.modelos  
(id_modelo,id_marca,nombre)
values ('14','M08','A1');

insert into ana_gonzalez.modelos  
(id_modelo,id_marca,nombre)
values ('15','M08','A3');

insert into ana_gonzalez.modelos  
(id_modelo,id_marca,nombre)
values ('16','M09','Ibiza');

insert into ana_gonzalez.modelos  
(id_modelo,id_marca,nombre)
values ('17','M09','Toledo');

insert into ana_gonzalez.modelos  
(id_modelo,id_marca,nombre)
values ('18','M09','Leon');

--Comprobación: select * from ana_gonzalez.modelos

-- Introducción de datos en la tabla 'Vehiculos':
insert into ana_gonzalez.vehiculos  
(id_vehiculo,id_modelo ,matricula ,id_color ,num_km,num_poliza,fecha_compra)
values ('01','1','001AAA','001','0','P01','20180101');

insert into ana_gonzalez.vehiculos  
(id_vehiculo,id_modelo ,matricula ,id_color ,num_km,num_poliza,fecha_compra)
values ('02','2','002AAA','001','0','P02','20180101');

insert into ana_gonzalez.vehiculos  
(id_vehiculo,id_modelo ,matricula ,id_color ,num_km,num_poliza,fecha_compra)
values ('03','3','003AAA','001','0','P03','20180101');

insert into ana_gonzalez.vehiculos  
(id_vehiculo,id_modelo ,matricula ,id_color ,num_km,num_poliza,fecha_compra)
values ('04','4','004AAA','001','0','P04','20180101');

insert into ana_gonzalez.vehiculos  
(id_vehiculo,id_modelo ,matricula ,id_color ,num_km,num_poliza,fecha_compra)
values ('05','11','005AAA','001','0','P05','20180101');

insert into ana_gonzalez.vehiculos  
(id_vehiculo,id_modelo ,matricula ,id_color ,num_km,num_poliza,fecha_compra)
values ('06','6','006AAA','001','0','P06','20180101');

insert into ana_gonzalez.vehiculos  
(id_vehiculo,id_modelo ,matricula ,id_color ,num_km,num_poliza,fecha_compra)
values ('07','7','007AAA','001','0','P07','20180101');

insert into ana_gonzalez.vehiculos  
(id_vehiculo,id_modelo ,matricula ,id_color ,num_km,num_poliza,fecha_compra)
values ('08','8','008AAA','001','0','P08','20180101');

insert into ana_gonzalez.vehiculos  
(id_vehiculo,id_modelo ,matricula ,id_color ,num_km,num_poliza,fecha_compra)
values ('09','9','009AAA','001','0','P09','20180101');

insert into ana_gonzalez.vehiculos  
(id_vehiculo,id_modelo ,matricula ,id_color ,num_km,num_poliza,fecha_compra)
values ('10','10','010AAA','001','0','P10','20180101');

insert into ana_gonzalez.vehiculos  
(id_vehiculo,id_modelo ,matricula ,id_color ,num_km,num_poliza,fecha_compra)
values ('11','11','011AAA','001','0','P11','20180101');

insert into ana_gonzalez.vehiculos  
(id_vehiculo,id_modelo ,matricula ,id_color ,num_km,num_poliza,fecha_compra)
values ('12','12','012AAA','001','0','P12','20180101');

insert into ana_gonzalez.vehiculos  
(id_vehiculo,id_modelo ,matricula ,id_color ,num_km,num_poliza,fecha_compra)
values ('13','13','013AAA','001','0','P13','20180101');

insert into ana_gonzalez.vehiculos  
(id_vehiculo,id_modelo ,matricula ,id_color ,num_km,num_poliza,fecha_compra)
values ('14','14','014AAA','001','0','P14','20180101');

insert into ana_gonzalez.vehiculos  
(id_vehiculo,id_modelo ,matricula ,id_color ,num_km,num_poliza,fecha_compra)
values ('15','15','015AAA','001','0','P15','20180101');

insert into ana_gonzalez.vehiculos  
(id_vehiculo,id_modelo ,matricula ,id_color ,num_km,num_poliza,fecha_compra)
values ('16','16','016AAA','001','0','P16','20180101');

insert into ana_gonzalez.vehiculos  
(id_vehiculo,id_modelo ,matricula ,id_color ,num_km,num_poliza,fecha_compra)
values ('17','17','017AAA','001','0','P17','20180101');

insert into ana_gonzalez.vehiculos  
(id_vehiculo,id_modelo ,matricula ,id_color ,num_km,num_poliza,fecha_compra)
values ('18','18','018AAA','001','0','P18','20180101');

insert into ana_gonzalez.vehiculos  
(id_vehiculo,id_modelo ,matricula ,id_color ,num_km,num_poliza,fecha_compra)
values ('19','1','002BBB','001','0','P19','20180101');

--Comprobación: select * from ana_gonzalez.vehiculos

-- Introducción de datos en la tabla 'Monedas':
insert into ana_gonzalez.monedas  --me da error aqui al ejecutarlo de golpe pero si ejecuto todo lo anterior y luego esto, no da error
(id_moneda,nombre)
values ('01','euro');

insert into ana_gonzalez.monedas
(id_moneda,nombre)
values ('02','dolar');

--Comprobación: select * from ana_gonzalez.monedas

-- Introducción de datos en la tabla 'Revisiones':
insert into ana_gonzalez.revisiones  
(id_revision,id_vehiculo,fecha_revision,km_revision,importe_revision,id_moneda)
values ('01','01','20190101','6000','50','01');

insert into ana_gonzalez.revisiones  
(id_revision,id_vehiculo,fecha_revision,km_revision,importe_revision,id_moneda)
values ('02','01','20200101','16000','50','01');

insert into ana_gonzalez.revisiones  
(id_revision,id_vehiculo,fecha_revision,km_revision,importe_revision,id_moneda)
values ('01','02','20190101','7000','50','01');

insert into ana_gonzalez.revisiones  
(id_revision,id_vehiculo,fecha_revision,km_revision,importe_revision,id_moneda)
values ('01','03','20190101','8000','50','01');

insert into ana_gonzalez.revisiones  
(id_revision,id_vehiculo,fecha_revision,km_revision,importe_revision,id_moneda)
values ('01','04','20190101','9000','50','01');

insert into ana_gonzalez.revisiones  
(id_revision,id_vehiculo,fecha_revision,km_revision,importe_revision,id_moneda)
values ('01','05','20190101','10000','50','01');

insert into ana_gonzalez.revisiones  
(id_revision,id_vehiculo,fecha_revision,km_revision,importe_revision,id_moneda)
values ('01','06','20190101','11000','50','01');

insert into ana_gonzalez.revisiones  
(id_revision,id_vehiculo,fecha_revision,km_revision,importe_revision,id_moneda)
values ('01','07','20190101','12000','50','01');

insert into ana_gonzalez.revisiones  
(id_revision,id_vehiculo,fecha_revision,km_revision,importe_revision,id_moneda)
values ('01','08','20190101','13000','50','01');

insert into ana_gonzalez.revisiones  
(id_revision,id_vehiculo,fecha_revision,km_revision,importe_revision,id_moneda)
values ('01','09','20190101','14000','50','01');

insert into ana_gonzalez.revisiones  
(id_revision,id_vehiculo,fecha_revision,km_revision,importe_revision,id_moneda)
values ('01','10','20190101','15000','50','01');

insert into ana_gonzalez.revisiones  
(id_revision,id_vehiculo,fecha_revision,km_revision,importe_revision,id_moneda)
values ('01','11','20190101','16000','50','01');

insert into ana_gonzalez.revisiones  
(id_revision,id_vehiculo,fecha_revision,km_revision,importe_revision,id_moneda)
values ('01','12','20190101','17000','50','01');

insert into ana_gonzalez.revisiones  
(id_revision,id_vehiculo,fecha_revision,km_revision,importe_revision,id_moneda)
values ('01','13','20190101','18000','50','01');

insert into ana_gonzalez.revisiones  
(id_revision,id_vehiculo,fecha_revision,km_revision,importe_revision,id_moneda)
values ('01','14','20190101','19000','50','01');

insert into ana_gonzalez.revisiones  
(id_revision,id_vehiculo,fecha_revision,km_revision,importe_revision,id_moneda)
values ('01','15','20190101','16000','50','01');

insert into ana_gonzalez.revisiones  
(id_revision,id_vehiculo,fecha_revision,km_revision,importe_revision,id_moneda)
values ('01','16','20190101','16000','50','01');

insert into ana_gonzalez.revisiones  
(id_revision,id_vehiculo,fecha_revision,km_revision,importe_revision,id_moneda)
values ('01','17','20190101','16000','50','01');

insert into ana_gonzalez.revisiones  
(id_revision,id_vehiculo,fecha_revision,km_revision,importe_revision,id_moneda)
values ('01','18','20190101','16000','50','01');

insert into ana_gonzalez.revisiones  
(id_revision,id_vehiculo,fecha_revision,km_revision,importe_revision,id_moneda)
values ('01','19','20190101','20000','50','01');

--Comprobación: select * from ana_gonzalez.revisiones
 

-- PARA COMPROBAR QUE EL SCRIPT FUNCIONA COMO SE PIDE EN ESTA PRÁCTICA, ME APOYO EN LA SIGUIENTE SENTENCIA PARA ELIMINAR TODO LO QUE HE HECHO Y EJECUTARLO COMPLETO DE UNA SOLA VEZ:
--drop schema ana_gonzalez cascade