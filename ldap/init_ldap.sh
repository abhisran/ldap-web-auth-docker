#!/bin/bash

# Wait for the LDAP server to start
sleep 5

# Create the LDIF content and add the user using ldapadd
echo -e "dn: uid=user1,dc=master-ldap,dc=com\nobjectClass: inetOrgPerson\nobjectClass: posixAccount\nobjectClass: top\ncn: User1\nsn: 1\nuid: user1\nuidNumber: 1001\ngidNumber: 1001\nhomeDirectory: /home/user1\nuserPassword: {SSHA}LyU4qnVQeS08mfnSOM24CMZE45MDCw1F" > /tmp/add_user1.ldif

# Add the user to LDAP
ldapadd -x -D "cn=admin,dc=master-ldap,dc=com" -w adminpassword -f /tmp/add_user1.ldif