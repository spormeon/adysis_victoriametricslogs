#!/bin/sh
echo "Starting Victoria Metrics with custom configuration........."
echo "Checking if Victoria Metrics binary is present..."
which victoria-metrics

/victoria-metrics-prod \
  -loggerFormat=json \
  -storageDataPath=/vlogs \
  -syslog.listenAddr.tcp=0.0.0.0:514
