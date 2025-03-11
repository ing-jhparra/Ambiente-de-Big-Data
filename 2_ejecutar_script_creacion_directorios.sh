#!/bin/bash
docker cp 1_crear_directorios_datasets.sh namenode:/home/1_crear_directorios_datasets.sh
docker exec -i namenode bash -c "cd /home; sh 1_crear_directorios_datasets.sh"
