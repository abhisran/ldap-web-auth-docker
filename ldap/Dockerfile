FROM osixia/openldap:1.5.0

# Copy the main bootstrap LDIF
COPY bootstrap.ldif /container/service/slapd/assets/config/bootstrap.ldif

# Copy the user addition LDIF file to the monitored directory
COPY add_user1.ldif /container/service/slapd/assets/config/bootstrap/ldif/custom/add_user1.ldif
