#!/bin/bash
docker cp 8_script_crear_estructura_formato_parquet.hql hive-server:/opt/8_script_crear_estructura_formato_parquet.hql
docker exec -i hive-server bash -c "cd /opt; hive -f 8_script_crear_estructura_formato_parquet.hql"
if [ $? -eq 0 ]; then
    echo ============================================================================
    echo "El script de creacion de base de datos y tablas se ejecutó correctamente."
    echo ============================================================================
else
    echo ============================================================================
    echo "Hubo un error al ejecutar el script de creacion de base de datos y tablas."
    echo ============================================================================
    exit 1
fi
