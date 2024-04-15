<h1><strong>Viaje hacia la analítica avanzada con Big Data: La clave del exito.</strong></h1>
<p align="center">
    <img src="./imagenes/bigdata.jpeg" alt="Imagen de MongoDB y Docker"  />
</p>

<h1>Introducción</h1> 

<h3>Aprovechando el poder del Big Data con herramientas de código abierto</h3>

<p>En la era actual, donde la información es poder, las empresas que buscan mantenerse a la vanguardia necesitan herramientas que les permitan procesar y analizar grandes volúmenes de datos de manera eficiente. El Big Data ofrece una solución innovadora para extraer información valiosa de estos conjuntos de datos, lo que permite tomar decisiones más acertadas y optimizar procesos.</p>

<p>Sin embargo, la implementación de soluciones de Big Data puede generar dudas, especialmente en lo que respecta a los costos. En este caso, la propuesta de construir un MVP (Producto Mínimo Viable) de un entorno de Big Data utilizando Docker presenta una oportunidad única para demostrar las ventajas de esta tecnología sin necesidad de grandes inversiones.</p>

<h3>A continuación, se detallan algunos de los beneficios de utilizar herramientas de Big Data:</h3>

<ul>
	<li>
	<b>Mejora en la toma de decisiones</b>: El análisis de grandes volúmenes de datos permite identificar patrones y tendencias que de otra manera serían invisibles. Esta información puede ser utilizada para tomar decisiones estratégicas más informadas que conduzcan al éxito del negocio.
	</li>
	<li>
	<b>Optimización de procesos</b>: El Big Data puede ayudar a identificar áreas de ineficiencia en los procesos operativos y desarrollar soluciones para mejorarlos. Esto puede conducir a ahorros significativos en costos y a una mayor productividad.
	</li>
	<li>
	<b>Ventaja competitiva</b>: Las empresas que adoptan el Big Data se encuentran a la vanguardia de la innovación y pueden diferenciarse de sus competidores. Esto puede conducir a una mayor cuota de mercado y a un mayor crecimiento.
	</li>
</ul>

<h3>La implementación de un MVP de Big Data utilizando Docker ofrece las siguientes ventajas:</h3>


<ul>
<li>
<b>Bajo costo</b>: Docker es una plataforma de código abierto que no requiere de licencias costosas. Esto permite implementar un entorno de Big Data de manera económica.
</li>
<li>
<b>Escalabilidad</b>: Docker permite escalar fácilmente el entorno de Big Data para adaptarse a las necesidades del negocio.
</li>
<li>
<b>Flexibilidad</b>: Docker permite desarrollar e implementar aplicaciones de Big Data de manera rápida y sencilla.
</li>
<li>
<b> Portabilidad</b>: Docker permite implementar aplicaciones de Big Data en cualquier entorno, ya sea en la nube o en un servidor local.
</li>
</ul>

<P>
En resumen, la implementación de un MVP de Big Data utilizando Docker es una excelente manera de demostrar el valor de esta tecnología a la gerencia de infraestructura. Esta iniciativa puede conducir a la adopción de soluciones de Big Data en toda la empresa, lo que puede generar importantes beneficios para el negocio.</P>

<h2>Entorno Docker con Hadoop, Spark y Hive</h2>
<h2>Se pesenta un entorno Docker con Hadoop (HDFS) y la implementación de:</h2>
<ul>
<li>Spark</li>
<li>Hive</li>
<li>HBase</li>
<li>MongoDB</li>
<li>Neo4J</li>
<li>Zeppelin</li>
<li>Kafka</li>
</ul>


<p>La implementación completa de este proyecto requiere de un entorno con recursos considerables, podemos adaptar la propuesta para ajustarla a las capacidades del equipo que servira para tal fin. Para ello, se plantearán pasos prácticos en entornos reducidos, cuidadosamente seleccionados en función de las herramientas utilizadas. De esta manera, podrán familiarizarse con las funcionalidades y el potencial del proyecto sin sobrecargar los recursos informáticos. </p>

<b>Paso 0. Verificación de interface de Red</b>. Ejecute los siguientes comando en la terminal de linux :

equipo$ sudo docker network ls

<p>Se mostrara una lista de interfaces, tome nota de la interface relacionada</p>

<p align="center">
    <img src="./imagenes/network_docker.png" alt="Lista de redes"  />
</p>

<p>Hagamos una inspeccion para encontrar la IP en la que se publican las intefaces de hadoop</p>

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


<p><b>Paso 1</b>. Para implementar el entorno ejecute los siguientes comando</p>

<p> .: Clonamos el repositorio</p>
<p>equipo$ git clone https://github.com/ing-jhparra/Proyecto-Integrador-Big-Data.git</p>

<p align="center">
    <img src="./imagenes/clonando_repositorio.png" alt="Clonando Repositorio"  />
</p>

<p> .: Cambiamos al directorio del repositorio creado</p>

<p>equipo$ cd Proyecto-Integrador-Big-Data</p>

<p> .: Ejecutamos el docker-compose-v(x).yml con x = 1. Cabe resaltar que x, tomara los valores 1,2,3,4 </p>

<p>equipo/Proyecto-Integrador-Big-Data:$ sudo docker-compose -f docker-compose-v1.yml up -d</p> 

<h2>1. HDFS</h2>

<p><b>Paso 2</b>. En este paso ejecute el entorno docker-compose-v1.yml, dentro del directorio Proyecto-Integrador-Big-Data, luego
                  en el nodo recien creado <b>namenode</b> se debe crear un directorio en /home llamado Datasets que tambien tendra otros subdirectorios, cuyo nombres estan relacionado a cada nombre dearchivo csv</p>

<p>equipo/Proyecto-Integrador-Big-Data:$ sudo docker exec -it namenode bash<p>

<p>root@e3f7cef0fa9d:# cd /home</p>

<p>root@e3f7cef0fa9d:/home# mkdir Datasets</p>

<p>root@e3f7cef0fa9d:/home/Datasets# mkdir calendario</p>

<p>Continue ejecutando para crear los subdirectorios : canaldeventa, cliente, compra, data_nvo, empleado, gasto, producto, proveedor, sucursal, tipodegasto, tiposdegasto, venta. Quedando de esta manera</p>

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

<p><b>Paso 8</b>. Escribimos<p>

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






https://github.com/sercasti/datalaketools
