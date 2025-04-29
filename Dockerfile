# Use the official Victoria Metrics image as the base image
FROM victoriametrics/victoria-metrics:v1.115.0
# FROM adysis/victoriametrics:v1.9.5

# Switch to root user to ensure we can change file permissions
USER root

# Copy the custom configuration script into the container
COPY vm_metrics_config.sh /etc/vm/vm_metrics_config.sh

# Set execute permissions on the script
RUN chmod +x /etc/vm/vm_metrics_config.sh

# Verify the permissions of the script during the build process
RUN ls -l /etc/vm/vm_metrics_config.sh

# Other files and configurations
COPY prometheus.yml /etc/prometheus/prometheus.yml
COPY alertmanager.yml /etc/alertmanager/alertmanager.yml


# Default command to run the script along with other required flags
# Set the entrypoint to execute the shell script and then start the Victoria Metrics process
ENTRYPOINT ["/bin/sh", "-c", \
  "/etc/vm/vm_metrics_config.sh && \
  /victoria-metrics -httpListenAddr=0.0.0.0:8428 \
  /victorialogs -httpListenAddr=0.0.0.0:9428 \
  /alertmanager -httpListenAddr=0.0.0.0:9093 \
  /vector -httpListenAddr=0.0.0.0:8686 \
  -promscrape.config=/etc/prometheus/prometheus.yml"]
  
# ENTRYPOINT ["/bin/sh", "-c", "/etc/vm/vm_metrics_config.sh"]

# Ensure container runs as root if needed
USER root