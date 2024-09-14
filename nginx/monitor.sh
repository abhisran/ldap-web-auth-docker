#!/bin/bash

# URL of the web application to monitor
URL="http://localhost:80"  # Update this if the application runs on a different port inside the container
LOG_DIR="/var/log/monitoring"  # Log directory
LOG_FILE="$LOG_DIR/webapp_monitor.log"  # Log file to store the monitoring logs
INTERVAL=60  # Time interval in seconds to check the application's status

# LDAP credentials for authentication
USERNAME="user1"  # Replace with a valid LDAP username
PASSWORD="user1"  # Replace with the corresponding password

# Create the log directory and file if they don't exist
mkdir -p $LOG_DIR
touch $LOG_FILE

# Function to monitor the web application
monitor() {
  while true; do
    # Check if the application is up by sending a request with basic auth
    if curl -s --head -u "$USERNAME:$PASSWORD" "$URL" | grep "200 OK" > /dev/null; then
      echo "$(date): Web application is up." >> "$LOG_FILE"
    else
      echo "$(date): Web application is down!" >> "$LOG_FILE"
      # Add alerting logic here if needed (e.g., send an email or trigger a webhook)
    fi
    sleep $INTERVAL
  done
}

# Start monitoring
monitor
