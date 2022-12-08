---------- PRÁCTICA DE MODELADO DE BASES DE DATOS EN SQL ----------

--- DML: LENGUAJE DE MANIPULACIÓN DE DATOS

-- Se desea obtener un informe con el listado de vehiculos en el que aparezca la siguiente información:
--		- Nombres del modelo, marca y grupo de coche
--		- Fecha de compra
--		- Matrícula
--		- Nombre del color del coche
--		- Nombre de la empresa aseguradora
--		- Número de póliza
--		- Total de km


select mo.nombre as modelo, 
ma.nombre as marca, 
g.nombre as grupo,
v.fecha_compra,
v.matricula, 
c.nombre as color ,
s.num_poliza,
a.nombre as aseguradora, 
r.km_revision as total_km  --valor maximo de los km de todas las revisiones del coche
from ana_gonzalez.vehiculos v 
inner join ana_gonzalez.modelos mo on v.id_modelo = mo.id_modelo
inner join ana_gonzalez.marcas ma on mo.id_marca = ma.id_marca 
inner join ana_gonzalez.grupos g on ma.id_grupo = g.id_grupo
inner join ana_gonzalez.colores c on v.id_color = c.id_color
inner join ana_gonzalez.seguro s  on v.num_poliza  = s.num_poliza
inner join ana_gonzalez.aseguradoras a  on s.id_aseguradora  = a.id_aseguradora
inner join ana_gonzalez.revisiones r on v.id_vehiculo = r.id_vehiculo and km_revision = (select max(r2.km_revision) from ana_gonzalez.revisiones r2 where r2.id_vehiculo = r.id_vehiculo)

