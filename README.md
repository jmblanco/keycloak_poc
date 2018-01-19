Steps:

1º Generate smtp config for docker compose:
- cd components/smtp
- ./generate-config.sh

2º Launch docker-compose
- docker-compose up [-d]


Note:
To launch each elements by its self:
- docker run --name keycloak_db -e MYSQL_DATABASE=keycloak -e MYSQL_USER=keycloak -e MYSQL_PASSWORD=keycloak -e MYSQL_ROOT_PASSWORD=root_password -d mysql
- docker run --name keycloak -p 8080:8080 --link keycloak_db:mysql -e KEYCLOAK_USER=admin -e KEYCLOAK_PASSWORD=admin -e MYSQL_DATABASE=keycloak -e - MYSQL_USER=keycloak -e MYSQL_PASSWORD=keycloak jboss/keycloak
docker-compose up ./smtp -d