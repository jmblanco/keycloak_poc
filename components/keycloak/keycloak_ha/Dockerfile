FROM jboss/keycloak

COPY ./universiaid_theme/universiaid /opt/jboss/keycloak/themes/universiaid

CMD ["-b", "0.0.0.0", "--server-config", "standalone-ha.xml"]
