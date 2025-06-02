#!/bin/sh
echo "Debug: Starting VictoriaLogs with custom configuration..."
echo "Debug: Checking if VictoriaLogs binary is present..."

# Check if the victoria-logs binary is available
which victoria-logs-prod 

echo "Debug: Starting VictoriaLogs with syslog configuration..."

# Start VictoriaLogs with syslog listen configuration and log output to file
/victoria-logs-prod \
  -syslog.listenAddr.tcp=0.0.0.0:514 \
  -syslog.listenAddr.udp=0.0.0.0:514 \
  -syslog.compressMethod.tcp=gzip