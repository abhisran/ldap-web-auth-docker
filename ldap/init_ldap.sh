#!/bin/bash

# Wait for the LDAP server to start
sleep 5

# Add users
ldapadd -x -D "cn=admin,dc=example,dc=com" -w admin_password <<EOF
dn: ou=users,dc=example,dc=com
objectClass: organizationalUnit
ou: users

dn: uid=user1,ou=users,dc=example,dc=com
objectClass: inetOrgPerson
cn: User One
sn: One
uid: user1
userPassword: {SSHA}LyU4qnVQeS08mfnSOM24CMZE45MDCw1F

EOF
