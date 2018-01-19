# Keycloak PoC

## First Steps:

1º Generate smtp config for docker compose:
- cd components/smtp
- ./generate-config.sh

2º Launch docker-compose or use keycloak_poc.sh

## Keycloak_poc Script    

./keycloak_pok.sh ACTION"
  Where ATION:"
  - gen-smtp-config: Generate user data smtp configuration."
  - docker-compose: Launch docker-compose"
  - docker-compose-d: Launch docker-compose in detached mode"
  - stop-dockers: Stop all launch dockers"
  - start-dockers: Start all launch dockers"
  - prune-dockers: Prune all dockers and associated resoures"


Note:
To launch each elements by its self:
- docker run --name keycloak_db -e MYSQL_DATABASE=keycloak -e MYSQL_USER=keycloak -e MYSQL_PASSWORD=keycloak -e MYSQL_ROOT_PASSWORD=root_password -d mysql
- docker run --name keycloak -p 8080:8080 --link keycloak_db:mysql -e KEYCLOAK_USER=admin -e KEYCLOAK_PASSWORD=admin -e MYSQL_DATABASE=keycloak -e - MYSQL_USER=keycloak -e MYSQL_PASSWORD=keycloak jboss/keycloak
- docker-compose up ./components/smtp -d