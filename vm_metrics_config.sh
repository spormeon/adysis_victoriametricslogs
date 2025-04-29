#!/bin/sh
echo "Starting Victoria Metrics with custom configuration........."
echo "Checking if Victoria Metrics binary is present..."
which victoria-metrics

/victoria-metrics-prod \
  -storageDataPath=/storage \
  -retentionPeriod=60d \
  -memory.allowedPercent=75 \
  -promscrape.config=/etc/prometheus/prometheus.yml \
  -memory.allowedBytes=10737418240 \
  -search.maxPointsPerTimeseries=100000 \
  -enableTCP6=true
