<div align="center">
  <h1 align="center">
    Viaje hacia la analítica avanzada con Big Data: La clave del éxito
    <br />
    <br />
      <img src="./imagenes/bigdata.jpeg" alt="Herramientas Big Data">
  </h1>
</div>

<p align="center">
   <br />
   <img src="https://img.shields.io/badge/STATUS-EN%20DESAROLLO-green">
   <br />
</p>

## Indice

*[Introducción](#Introducción)

*[Implementación](#Implementación)

*[Glosario](#Glosario)

*[Recursos](#Recursos)

*[Créditos](#Créditos)


## Introducción

En la era de la información, las empresas necesitan herramientas para procesar y analizar grandes volúmenes de datos. El Big Data ofrece una solución para extraer información valiosa de estos conjuntos de datos, lo que permite tomar mejores decisiones y optimizar procesos.
Beneficios de usar herramientas de Big Data:

- **Mejora en la toma de decisiones**: Permite identificar patrones y tendencias que de otra manera serían invisibles.
- **Optimización de procesos**: Ayuda a identificar áreas de ineficiencia y desarrollar soluciones para mejorarlas.
- **Ventaja competitiva**: Diferencia a las empresas de sus competidores.

La implementación de un MVP de Big Data utilizando Docker es una excelente manera de demostrar el valor de esta tecnología y puede conducir a la adopción de soluciones de Big Data en toda la empresa, lo que puede generar importantes beneficios para el negocio.

### La implementación de un MVP de Big Data utilizando Docker ofrece las siguientes ventajas:

- **Bajo costo**: Docker es una plataforma de código abierto que no requiere de licencias costosas. Esto permite implementar un entorno de Big Data de manera económica.
- **Escalabilidad**: Docker permite escalar fácilmente el entorno de Big Data para adaptarse a las necesidades del negocio.
- **Flexibilidad**: Docker permite desarrollar e implementar aplicaciones de Big Data de manera rápida y sencilla.
- **Portabilidad**: Docker permite implementar aplicaciones de Big Data en cualquier entorno, ya sea en la nube o en un servidor local.

En resumen, la implementación de un MVP de Big Data utilizando Docker es una excelente manera de demostrar el valor de esta tecnología a la gerencia de infraestructura. Esta iniciativa puede conducir a la adopción de soluciones de Big Data en toda la empresa, lo que puede generar importantes beneficios para el negocio.



## Entorno Docker con Hadoop, Spark y Hive
## Se pesenta un entorno Docker con Hadoop (HDFS) y la implementación de:

- **Spark**
- **Hive**
- **HBase**
- **MongoDB**
- **Neo4J**
- **Zeppelin**
- **Kafka**

La implementación completa de este proyecto requiere de un entorno con recursos considerables, podemos adaptar la propuesta para ajustarla a las capacidades del equipo que servira para tal fin. Para ello, se plantearán unos pasos prácticos en entornos reducidos, cuidadosamente seleccionados en función de las herramientas utilizadas. De esta manera, podrán familiarizarse con las funcionalidades y el potencial del proyecto sin sobrecargar los recursos informáticos.

## Implementación

verificar la interface de Red de docker. Ejecute el siguiente comando en la terminal de linux :

```bash
sudo docker network ls
```

Se debe mostrar una lista de red, incluyendo la del proyecto, sino,  es porque aun no se ha mostrado

<p align="center">
    <img src="./imagenes/network_docker.png" alt="Lista de redes"  />
</p>

Inspeccionemos la red para encontrar la IP en la que se publican las intefaces de hadoop</p>

```bash
sudo docker network inspect proyecto-integrador-big-data_default
```

Y observe

<p align="center">
    <img src="./imagenes/network_inspect.png" alt="Lista de redes"  />
</p>


<p>
Namenode: http://ip_servidor:9870/dfshealth.html#tab-overview</br>
Datanode: http://ip_servidor:9864/</br>
Spark master: http://ip_servidor:8080/</br>
Spark worker: http://ip_servidor:8081/</br>
HBase Master-Status: http://ip_servidor:16010</br>
HBase Zookeeper_Dump: http://ip_servidor:16010/zk.jsp</br>
HBase Region_Server: http://ip_servidor:16030</br>
Zeppelin: http://ip_servidor:8888</br>
Neo4j: http://ip_servidor:7474</br>
<p>


- **Paso 1**. Clonamos el repositorio para iniciar el proceso de implementación del entorno de prueba o demostración

<p> .: </p>

```bash
sudo git clone https://github.com/ing-jhparra/Proyecto-Integrador-Big-Data.git
```

<p align="center">
    <img src="./imagenes/clonando_repositorio.png" alt="Clonando Repositorio"  />
</p>

- **Paso 1.1**: Cambiamos al directorio del repositorio creado

```bash
cd Proyecto-Integrador-Big-Data
```

- **Paso 1.2** Ejecutamos docker-compose-vX.yml con X = 1. Cabe resaltar que X, toma un valor dependiendo del entorno que se quiere implementar 

```bash
sudo docker-compose -f docker-compose-v1.yml up -d
```

## HDFS

- **Paso 2**. Con la ejecución del paso anterior hemos implemetado un entorno HDFS, ahora ingresamos al **Namenode** para crear un directorio llamado **Datasets**  que va almacenar los archivos csv

```bash
sudo docker exec -it namenode bash
```
luego ejecutamos el siguietne comando 

```bash
sudo mkdir /home/Datasets
```
Es importante mencionar que cada archivo csv se encontrara en un subdirectorio que lleva su nombre por tanto se debe crear el directorio en question, por ejemplo, ejecutar el siguiente comando tantas veces sea necesario para canaldeventa, cliente, compra, data_nvo, empleado, gasto, producto, proveedor, sucursal, tipodegasto, tiposdegasto y venta.

```bash
sudo mkdir /home/Datasets/calendario
```

<p align="center">
    <img src="./imagenes/directorio_Dataset.png" alt="Clonando Repositorio"  />
</p>
	 
<b>Copiar los archivos ubicados en la carpeta Datasets, dentro del contenedor "namenode" ejecutando las sentencias</b></br>

<p>
docker cp ./gasto/Gasto.csv namenode:/home/Datasets/gasto</br>
docker cp ./venta/Venta.csv namenode:/home/Datasets/venta</br>
docker cp ./producto/Producto.csv namenode:/home/Datasets/producto</br>
docker cp ./canaldeventa/CanalDeVenta.csv namenode:/home/Datasets/canaldeventa</br>
docker cp ./tipodegasto/TiposDeGasto.csv namenode:/home/Datasets/tiposdegasto</br>
docker cp ./sucursal/Sucursal.csv namenode:/home/Datasets/sucursal</br>
docker cp ./cliente/Cliente.csv namenode:/home/Datasets/cliente</br>
docker cp ./empleado/Empleado.csv namenode:/home/Datasets/empleado</br>
docker cp ./proveedor/Proveedor.csv namenode:/home/Datasets/proveedor</br>
docker cp ./compra/Compra.csv namenode:/home/Datasets/compra</br>
docker cp ./data_nvo/Producto.csv namenode:/home/Datasets/data_nvo</br>
docker cp ./data_nvo/Empleado.csv namenode:/home/Datasets/data_nvo</br>
docker cp ./data_nvo/Cliente.csv namenode:/home/Datasets/data_nvo</br>
docker cp ./calendario/Calendario.csv namenode:/home/Datasets/calendario</br>
docker cp ./iris.csv namenode:/home/Datasets/./iris.csv</br>
docker cp ./personal.csv namenode:/home/Datasets/./personal.csv</br>
docker cp ./raw-flight-data.csv namenode:/home/Datasets/./raw-flight-data.csv</br>

</p><b>Nota</b>: Este proceso de copia de archivo se puede realizar a través de un archivo shell script</p>
</p>


<p><b>Paso 3</b>. Entrar al contenedor namenode</p>

<p>equipo/Proyecto-Integrador-Big-Data:$ sudo docker exec -it namenode bash<p>

<p>sudo docker exec -it namenode bash</p>	

<p><b>Paso 4</b>. Creamos un directorio en HDFS llamado "/data".</p>

<p>hdfs dfs -mkdir -p /data</p>

<p><b>Paso 5</b>. Copiamos los archivos csv contenidos en Datasets en el directorio provistos en HDFS:</p>

<p>hdfs dfs -put /home/Datasets/* /data</p>

<p><b>Nota</b>: Este proceso de creación de la carpeta data y copiado de los arhivos, debe poder ejecutarse desde un shell script.</p>

<p><b>Paso 5</b>. Ahora desde un navegador web escriba la dirección http://ip_servidor:9870 para entrar a Hadoop <p>

<p align="center">
    <img src="./imagenes/hadoop.png" alt="Clonando Repositorio"  />
</p>

<p>Haga clic en Utilities Configuration para entrar a la configuración <p>

<p align="center">
    <img src="./imagenes/hadoop_utilities.png" alt="Clonando Repositorio"  />
</p>

<p>Busque en esa página los valores que toman el tamaño del bloque y el factor de réplica:</p>

<p>dfs.blocksize</p> 

<p align="center">
    <img src="./imagenes/blocksize.png" alt="Clonando Repositorio"  />
</p>

<p>dfs.replication</p>

<p align="center">
    <img src="./imagenes/replication.png" alt="Clonando Repositorio"  />
</p>

Y puede también buscar otras configuraciones que necesite conocer del sistema Hadoop

<h2>2. HIVE</h2>

<p><b>Paso 6</b>. Creamos las tablas en Hive, a partir de los csv ingestados en HDFS. Para ello debemos copiar el archivo <b>Paso02.hql</b> en <b>/home</b> del contenedor <b>hive-server</b> ejecutamos el comando para copiar</p>

<p>docker cp Paso02.hql hive-server:/home/</p>

<p><b>Paso 7</b>. Ingresamos al nodo</p> 

<p>sudo docker exec -it hive-server bash</p>

<p>luego en el contendor ejecutamos </p>

<p>hive –f /home/Paso02.hql</p>

<p><b>Paso 8</b>. Ingresamos a Hive para verificar tablas y los datos</p>

<p>hive</p>

<p>Para las tablas, escribimos</p>

<p>hive>use integrador;</p>

<p>luego </p>

<p>hive>show tables;</p>

<p align="center">
    <img src="./imagenes/tablas.png" alt="Clonando Repositorio"  />
</p>

<p>Verifiquemos la inserccion de datos en las tablas, podemos utilizar un simple select o en conjuncion con la funcion coun(*)</p>

<p>SELECT * FROM canal_venta;</p>

<p align="center">
    <img src="./imagenes/canal_venta.png" alt="Clonando Repositorio"  />
</p>

<p>SELECT COUNT(*) FROM canal_venta;</p>

<p align="center">
    <img src="./imagenes/count_venta.png" alt="Clonando Repositorio"  />
</p>

 <h2>3. Formatos de Almacenamiento<h2>

 Las tablas creadas en el punto 2 a partir de archivos en formato csv, en este punto se utilizara en formato Parquet + Snappy, utilizando el script Paso03.hql para crearlas y configurarlas, aplicando el concepto de particionamiento sobre una de las tablas, Inicaimos este paso copiando el archivo al nodo hive-server

 <h2>4. SQL<h2>

## Glosario :

Ciertos términos se utilizan en Open MCT con significados o convenciones consistentes. Cualquier desviación de lo siguiente es un problema y debe abordarse (ya sea actualizando este glosario o cambiando el código para reflejar el uso correcto). Otra documentación para desarrolladores, particularmente la documentación en línea, puede presumir la comprensión de estos términos.


- **Big Data**: Conjunto de datos extremadamente grande y complejo que es difícil de procesar y analizar utilizando métodos tradicionales.

- **Herramientas de código abierto**: Software disponible gratuitamente para su uso, modificación y distribución.

- **MVP (Producto Mínimo Viable)**: Versión inicial de un producto con las características básicas necesarias para satisfacer a los primeros usuarios.

- **Docker**: Plataforma de virtualización de software que permite ejecutar aplicaciones en contenedores aislados.

- **Hadoop**: Marco de software de código abierto para el almacenamiento y procesamiento distribuido de grandes conjuntos de datos.

- **Spark**: Motor de procesamiento de datos distribuido de código abierto para el análisis de grandes conjuntos de datos.

- **Hive**: Almacén de datos distribuido que permite consultar y analizar datos almacenados en HDFS.

- **HBase**: Base de datos NoSQL distribuida para el almacenamiento de grandes conjuntos de datos estructurados.

- **MongoDB**: Base de datos NoSQL de código abierto para el almacenamiento de documentos JSON.

- **Neo4J**: Base de datos de grafos de código abierto para el almacenamiento y análisis de relaciones entre entidades.

- **Zeppelin**: Notebook interactivo para el análisis de datos que admite Spark, Hive y otras herramientas.

- **Kafka**: Plataforma de mensajería de código abierto para el manejo de flujos de datos en tiempo real.

- **HDFS (Hadoop Distributed File System)**: Sistema de archivos distribuido para el almacenamiento de grandes conjuntos de datos en múltiples nodos.

- **Data Lake**: Almacén centralizado de datos en bruto que puede almacenar cualquier tipo de dato sin necesidad de un esquema predefinido.

- **Datamart**: Subconjunto de un Data Lake que contiene datos estructurados y procesados para un análisis específico.

- **ETL (Extract, Transform, Load)**: Proceso de extracción de datos de una fuente, transformación de los datos para su análisis y carga de los datos en un destino.

- **Machine Learning**: Rama de la inteligencia artificial que permite a los sistemas aprender de los datos sin ser programados explícitamente.

- **Deep Learning**: Subconjunto de Machine Learning que utiliza redes neuronales artificiales para el aprendizaje de patrones complejos en los datos.

- **Inteligencia Artificial**: Rama de la informática que busca crear sistemas inteligentes que puedan razonar, aprender y actuar de forma autónoma.

- **Escalabilidad**: Capacidad de un sistema para aumentar o disminuir su capacidad de procesamiento o almacenamiento para adaptarse a la demanda.

- **Portabilidad**: Capacidad de un sistema para ejecutarse en diferentes entornos, como en la nube o en un servidor local.

- **Alta disponibilidad**: Capacidad de un sistema para estar disponible de forma continua y minimizar el tiempo de inactividad.

- **Seguridad**: Capacidad de un sistema para proteger los datos y recursos de accesos no autorizados.

- **Gobernanza de datos**: Conjunto de políticas y procesos para garantizar la calidad, integridad y seguridad de los datos.


## Recursos

https://github.com/sercasti/datalaketools

## Créditos

Copyright (c) 2024 [Ing. Jesús parra] parra.jesus@gmail.com