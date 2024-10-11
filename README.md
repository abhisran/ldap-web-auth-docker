
# LDAP Web Authentication with Docker

This project demonstrates how to set up web authentication using LDAP and Docker. It includes Docker configurations for setting up an LDAP server and an Nginx web server to authenticate users via LDAP.

## Project Structure

```
ldap-web-auth-docker/
│
├── docker-compose.yml            # Docker Compose file to run the services
├── ldap/
│   ├── add_user1.ldif            # LDIF file to add a user to the LDAP directory
│   ├── bootstrap.ldif            # LDIF file to bootstrap the LDAP directory
│   └── Dockerfile                # Dockerfile for LDAP server setup
├── nginx/
│   ├── index.html                # Web page to be served by Nginx
│   ├── Dockerfile                # Dockerfile for Nginx server setup
│   ├── monitor.sh                # Script for monitoring Nginx
│   └── nginx.conf                # Configuration file for Nginx
└── .gitignore                    # Git ignore file
```

## Prerequisites

- Docker
- Docker Compose

## Getting Started

### Clone the Repository

```bash
git clone https://github.com/abhisran/ldap-web-auth-docker.git
cd ldap-web-auth-docker
```

### Running the Services

Use Docker Compose to build and start the LDAP and Nginx services.

```bash
docker-compose up --build
```

### Accessing the Web Interface

Once the services are up and running, access the web interface through your web browser:

```
http://localhost:8080
```

## User Creation and Authentication

The default username and password for LDAP authentication are handled automatically using the `add_user1.ldif` file. By default, a user with the following credentials is created:

- **Username**: `user1`
- **Password**: `user1` (stored in hashed format)

### Password Hashing

Passwords in the `add_user1.ldif` file must be in a hashed format for security reasons. You can generate a hashed password using the `slappasswd` utility:

```bash
slappasswd
```

This command will prompt you to enter a password and will return the hashed version. Replace the password in the `add_user1.ldif` file with the generated hash.

These credentials are required for accessing the secured webpage and are also utilized in the monitoring script (`monitor.sh`) to verify access.

### Adding Additional Users to LDAP

You can add new users to the LDAP directory by modifying the `add_user1.ldif` file in the `ldap/` directory. Ensure the password is hashed using `slappasswd` before applying it:

```bash
ldapadd -x -D "cn=admin,dc=master-ldap,dc=com" -W -f ldap/add_user1.ldif
```

## LDAP Server Default Configurations

The LDAP server is configured with the following default values:

- **LDAP_ORGANISATION**: "Example Org"
- **LDAP_DOMAIN**: "master-ldap.com"
- **LDAP_ADMIN_PASSWORD**: "adminpassword"

These values are set within the Docker environment and can be customized as needed. To change these values, update the environment variables in the `docker-compose.yml` file or within the LDAP server's configuration files.

The LDAP server is further configured using the `bootstrap.ldif` file, which sets up the base domain and schema. Ensure that any changes to the server configuration in this file are reflected across the LDAP clients and the monitoring setup.

## Monitoring and Logs

The Nginx monitoring script `monitor.sh` is provided in the `nginx/` directory to check the status of the Nginx server. It uses the default LDAP credentials (`user1`/`user1`) to perform monitoring checks.

## Clean Up

To stop and remove the services, run:

```bash
docker-compose down
```

## License

This project is licensed under the MIT License.
