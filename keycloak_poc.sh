#!/bin/bash

NUM_ARGS=$#
if [ $NUM_ARGS -ne 1 ]; then
    echo "`date '+%Y-%m-%d %H:%M:%S'` [WARN]: Use mode:"
    echo "./keycloak_poc.sh ACTION"
    echo "  Where ATION:"
    echo "  - gen-smtp-config: Generate user data smtp configuration."
    echo "  - docker-compose: Launch docker-compose"
    echo "  - docker-compose-d: Launch docker-compose in detached mode"
    echo "  - stop-dockers: Stop all launch dockers"
    echo "  - start-dockers: Start all launch dockers"
    echo "  - prune-dockers: Prune all dockers and associated resoures"
    exit -1;
fi

OPTION=$1

case "$OPTION" in
    ("gen-smtp-config")
        echo "`date '+%Y-%m-%d %H:%M:%S'` [INFO]: Generating user data smtp configuration..."
        . components/smtp/generate-config.sh
    ;;
    ("docker-compose")
        echo "`date '+%Y-%m-%d %H:%M:%S'` [INFO]: Launching docker compose..."
        docker-compose up
    ;;
    ("docker-compose-d")
        echo "`date '+%Y-%m-%d %H:%M:%S'` [INFO]: Launching docker compose in detached mode..."
        docker-compose up -d
    ;;
    ("stop-dockers")
        echo "`date '+%Y-%m-%d %H:%M:%S'` [INFO]: Stop all keycloak_pok launched dockers"
        docker stop keycloak smtpserver keycloak_db
    ;;
    ("start-dockers")
        echo "`date '+%Y-%m-%d %H:%M:%S'` [INFO]: Start all keycloak_pok dockers"
        docker start keycloak smtpserver keycloak_db
    ;;
    ("prune-dockers")
        echo "`date '+%Y-%m-%d %H:%M:%S'` [INFO]: Prune all keycloak_pok dockers and associated resources"
        docker stop keycloak smtpserver keycloak_db
        docker rm keycloak smtpserver keycloak_db
        docker volume prune
        docker network prune
    ;;
    (*)
        echo "`date '+%Y-%m-%d %H:%M:%S'` [ERROR]: Invalid action"
    
    ;;
esac
