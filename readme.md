# Proyecto SQL: Definición de estructuras y manipulación de bases de datos (BBDD)

## Descripción del proyecto

El proyecto consiste en una aplicación práctica de conocimientos sobre el lenguaje SQL (Structured Query Language). Se utilizarán para ello tanto comandos DDL (Data Definition Language) como comandos DML (Data Manipulation Language).

## Software empleado en este proyecto

Las herramientas utilizadas para la realización de este proyecto son las siguientes:

* [Draw.io](https://app.diagrams.net/) para modelar bases de datos mediante la construcción del Diagrama Entidad - Relación.
* [PosgreeSQL](https://www.postgresql.org/) como motor de base de datos.
* [DBeaver](https://dbeaver.io/) , un cliente genérico de acceso a las bases de datos de todo tipo, que usaremos para conectar a postgreSQL.

## Enunciado del problema

La práctica consistirá en dar solución al enunciado de la práctica mediante la creación del modelo Entidad Relación normalizado y un fichero con los comandos DDL para la creación del modelo diseñado así como los comandos DML para cargar las tablas. Es obligatorio que el script sea 100% autónomo, de tal forma que solo haya que abrirlo y pulsar sobre el botón ejecutar Script y este todo hecho (tablas, PKs, relaciones, datos). Si se produce un error al ejecutar el script la práctica no será corregida y será automáticamente no apto. En el script debéis crear un espacio de trabajo y crear todos los objetos en ese espacio de trabajo (no usar public).

En KeepCoding queremos gestionar la flota de vehículos de empresa, controlando los modelos de los coches, las marcas y el grupo empresarial de la marca (por ejemplo VW SEAT, Audi etc. pertenecen al grupo VAN). 

De los coches también necesitamos saber el color del coche, su matrícula, el número total de kilómetros que tiene, la compañía aseguradora ( Mapfre, MMT, AXA etc), el número de póliza, fecha de compra etc.

Además queremos controlar de cada coche las revisiones que se ha pasado al coche sabiendo los Kms que tenía en el momento de la revisión, la fecha de la revisión y el importe de la revisión.

Aparte del script, habrá que entregar una consulta SQL para sacar el siguiente listado de coches activos que hay en KeepCoding:
* Nombre modelo, marca y grupo de coches (los nombre de todos)
* Fecha de compra
* Matricula
* Nombre del color del coche
* Nombre empresa que esta asegurado el coche
* Numero de póliza
* Total kilómetros

Nota: Los importes se debe controlar la moneda (EURO, DÓLAR etc.).

KeepCoding© All rights reserved.


## Archivos que conforman el proyecto

Este proyecto se compone de tres partes:

### Diagrama E - R

* [AnaGonzalezPracticaDiagramaSQL.drawio](https://github.com/AnaGonzalezEsteban/Proyecto-SQL---Definicion-de-estructuras-y-manipulacion-de-datos/blob/master/AnaGonzalezPracticaDiagramaSQL.drawio) - Diagrama Entidad - Relación (Diagrama E-R) con la estructura que va a tener la base de datos que vamos a crear.

### Modelado y creación de la BBDD

* [AnaGonzalezPracticaModeladoSQL.sql](https://github.com/AnaGonzalezEsteban/Proyecto-SQL---Definicion-de-estructuras-y-manipulacion-de-datos/blob/master/AnaGonzalezPracticaModeladoSQL.sql) - Fichero con la creación de un esquema de trabajo llamado 'ana_gonzalez', en el que se incluyela creación de las tablas que aparecen en el Diagrama E - R y la introducción de los datos imaginarios de 19 vehículos que servirán como ejemplo para la realización de este ejercicio.

### Consulta en la BBDD

* [AnaGonzalezPracticaConsultaSQL.sql](https://github.com/AnaGonzalezEsteban/Proyecto-SQL---Definicion-de-estructuras-y-manipulacion-de-datos/blob/master/AnaGonzalezPracticaConsultaSQL.sql) - Fichero con una consulta para obtener, a partir de la BBDD creada, el siguiente listado de vehículos:
    * Nombre modelo, marca y grupo de coches (los nombre de todos)
    * Fecha de compra
    * Matricula
    * Nombre del color del coche
    * Nombre empresa que esta asegurado el coche
    * Numero de póliza
    * Total kilómetros

## Participantes en el proyecto

* **Ana González Esteban** - *Autor del proyecto* - [Linkedin/anagonzalezesteban](https://www.linkedin.com/in/anagonzalezesteban/)
* **Jose Luis Bustos Esteban** - *Profesor* - [Linkedin/joseluisbustosesteban](https://www.linkedin.com/in/jlbedeveloper/)
* **KeepCoding** - *Centro de formación* - [KeepCoding](https://keepcoding.io/)

## Agradecimientos

Me gustaría agradecer a Andrés Villanueva [Villanuevand](https://github.com/Villanuevand) por la información compartida en su GitHub.
