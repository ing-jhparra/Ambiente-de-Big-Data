#!/bin/bash
docker cp 6_script_creacion_db_y_tablas.hql hive-server:/opt/6_script_creacion_db_y_tablas.hql
docker exec -i hive-server bash -c "cd /opt; hive -f 6_script_creacion_db_y_tablas.hql"
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
