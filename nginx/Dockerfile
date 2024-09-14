FROM tiredofit/nginx-ldap

# Copy the NGINX config
COPY nginx.conf /etc/nginx/nginx.conf

# Copy the HTML page to be served
COPY index.html /usr/share/nginx/html/index.html

# Copy the monitoring script into the container
COPY monitor.sh /usr/local/bin/monitor.sh

# Make the monitoring script executable
RUN chmod +x /usr/local/bin/monitor.sh

# Create the log directory
RUN mkdir -p /var/log/monitoring
