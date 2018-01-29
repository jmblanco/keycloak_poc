# Keycloak PoC
This folder contains a POC of Keycloak for Santander Universidades

# Index

1. [Firts Steps](#first-steps)
2. [Supported Databases](#supported-databases)
3. [Usage](#usage)
3.1. [SQL Files](#sql-files)
3.2. [MariaDB](#mariadb)


# First Steps:
In order to generate required config for SMTP docker, is mandatory to execute this steps before start any docker:

##### 1. Generate smtp config:
```bash
cd components/smtp
./generate-config.sh
```
> ***Note:*** 
> In order to generate the users that are allowed to login in SMTP server, it's necesary to create a file into the folder components/smtp with the name users.dat (there is an example in the folder with file format)

##### 2. Launch docker-compose or use keycloak_poc.sh
```docker
docker-compose up
````
or
```bash
./keycloak_poc.sh <ACTION>
```

## Launcher script: keycloak_poc.sh
This script is located in de main folder of the project. Here we present the use mode:

```bash
./keycloak_pok.sh <ACTION>
Where ATION:
  - gen-smtp-config: Generate user data smtp configuration.
  - docker-compose: Launch docker-compose
  - docker-compose-d: Launch docker-compose in detached mode
  - stop-dockers: Stop all launch dockers
  - start-dockers: Start all launch dockers
  - prune-dockers: Prune all dockers and associated resoures
```

> ***Note:***
To launch each elements by its self:
> - docker run --name keycloak_db -e MYSQL_DATABASE=keycloak -e MYSQL_USER=keycloak -e MYSQL_PASSWORD=keycloak -e MYSQL_ROOT_PASSWORD=root_password -d mysql
> - docker run --name keycloak -p 8080:8080 --link keycloak_db:mysql -e KEYCLOAK_USER=admin -e KEYCLOAK_PASSWORD=admin -e MYSQL_DATABASE=keycloak -e - MYSQL_USER=keycloak -e MYSQL_PASSWORD=keycloak jboss/keycloak
>
> For SMTP server, see smtp dockerhub reference page:
> - [Docker Mail Server](https://hub.docker.com/r/tvial/docker-mailserver/)

