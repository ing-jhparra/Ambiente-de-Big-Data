#!/bin/bash

# Ruta del directorio en HDFS
ruta_hdfs="/data"

# Verificar si la ruta existe
if hdfs dfs -test -e "$ruta_hdfs"; then
  echo "            La ruta $ruta_hdfs existe. Eliminando"
  hdfs dfs -rm -r -skipTrash /data | while IFS= read -r line; do
  echo "            $line"
  done
  # hdfs dfs -rm -r -skipTrash "$ruta_hdfs"
  echo "            La ruta $ruta_hdfs ha sido eliminada."
else
  echo "            La ruta $ruta_hdfs no existe. No se requiere eliminación."
fi

# Crear el directorio en HDFS
echo "            Creando el directorio $ruta_hdfs en HDFS"
hdfs dfs -mkdir -p "$ruta_hdfs"

# Verificar si el directorio se creó correctamente
if hdfs dfs -test -d "$ruta_hdfs"; then
  echo "            El directorio $ruta_hdfs se ha creado correctamente."
else
  echo "            Error: No se pudo crear el directorio $ruta_hdfs."
fi

log_file="/home/archivo.log"
# Copiar archivos al directorio de HDFS
echo "            Se estan copiando archivos"
hdfs dfs -put /home/Datasets/* /data 2>> "$log_file" 
echo "            Los archivos fueron copiados al HDFS"

# Verificar si hubo errores
if [ $? -ne 0 ]; then
  echo "Advertencia: Ocurrieron errores durante la copia. Verifica el archivo de log: $log_file"
fi
