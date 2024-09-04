# Use the official Python 3 image based on Alpine Linux
# Reference: https://hub.docker.com/_/python
FROM python:3-alpine3.18

# Create a non-root user for improved security
RUN addgroup --gid 10001 --system veeder \
 && adduser --uid 10000 --system --ingroup veeder --home /home/veeder veeder

# Set the working directory inside the container
WORKDIR /veeder

# Create a log directory and set permissions
RUN chown veeder:veeder /veeder
RUN mkdir -p /var/log \
	&& chown veeder:veeder /var/log
# Expose the port on which GasPot will listen
EXPOSE 10001

# Copy the application files, including the config.ini.dist file, to the container
COPY config.ini.dist /veeder/config.ini
COPY GasPot.py /veeder/GasPot.py

# Switch to the non-root user to run the application
USER veeder

# Define the entry point for the container
CMD ["/bin/sh","-c", "python3 -u GasPot.py >> /var/log/gas.log"]
# Add a health check
HEALTHCHECK --interval=30s --timeout=10s --retries=3 CMD nc -z localhost 10001
