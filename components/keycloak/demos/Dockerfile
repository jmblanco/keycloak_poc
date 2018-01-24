FROM jboss/wildfly

USER root

COPY adapters/* /opt/jboss/wildfly/

RUN cd /opt/jboss/wildfly \
    && unzip keycloak-wildfly-adapter-dist-3.4.3.Final.zip \
    && ./bin/jboss-cli.sh --file=bin/adapter-elytron-install-offline.cli

COPY examples/* /opt/jboss/wildfly/standalone/deployments/