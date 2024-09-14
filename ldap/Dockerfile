FROM osixia/openldap:1.5.0

# Copy the initialization script into the container
COPY init_ldap.sh /container/service/slapd/assets/config/bootstrap/ldif/custom/init_ldap.sh

# Set execute permission on the script
RUN chmod +x /container/service/slapd/assets/config/bootstrap/ldif/custom/init_ldap.sh
