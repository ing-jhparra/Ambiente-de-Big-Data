#!/bin/bash
clear
echo
echo ===================================================================================================
echo "Se inica el proceso de carga de datos a namenode"
echo ===================================================================================================
echo

# Copiar "1_crear_directorios_datasets.sh" a  "namenode" 
echo "1. Copiando script '1_crear_directorios_datasets.sh' al contenedor namenode"
docker cp 1_crear_directorios_datasets.sh namenode:/home/1_crear_directorios_datasets.sh

# Crear directorio y subdirectorio 
echo "2. Se esta creando el directorio Datasets y subdirectorios en namenode"
docker exec -i namenode bash -c "cd /home; sh 1_crear_directorios_datasets.sh"

# Copiar archivos
echo "3. Se estan copiando archivos al directorio Datasets en namenode"
sh 3_copiar_archivos.sh

# Copiar  "4_crear_copiar_archivos_hdfs.sh" a "namenode"
echo "4. Copiando script '4_crear_copiar_archivos_hdfs.sh' al contenedor 'namenode'"
docker cp 4_crear_copiar_archivos_hdfs.sh namenode:/home/4_crear_copiar_archivos_hdfs.sh

# Crear directorio en HDFS del "namenode" 
echo "5. Se esta creando directorio y copiando archivos a HDFS en 'namenode'"
docker exec -i namenode bash -c "cd /home; sh 4_crear_copiar_archivos_hdfs.sh"


echo
echo ===================================================================================================
echo "Ha finalizado el proceso de carga de archivos a 'namenode', puede verificar en /home/Datasets"
echo ===================================================================================================
