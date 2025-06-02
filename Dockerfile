# Use the official Victoria Metrics image as the base image
FROM victoriametrics/victoria-logs:v1.23.2-victorialogs

# # Copy the custom config script into the container
# COPY ./vm_metrics_config.sh /etc/vm/vm_metrics_config.sh

# # Ensure the script is executable
# RUN chmod 755 /etc/vm/vm_metrics_config.sh

# # Ensure the file is owned by root
# RUN chown root:root /etc/vm/vm_metrics_config.sh

# # Set the user to root
# USER root

# # Test: only run the script and see if it outputs the echo statements correctly
# CMD ["/bin/sh", "-c", "/etc/vm/vm_metrics_config.sh"]







