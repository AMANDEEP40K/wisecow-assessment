# We will be using an ubuntu base image for our wisecow container
FROM ubuntu:latest

# Install necessary packages
# we need to install netcat-traditional as ubuntu has two different versions for netcat
RUN apt-get update && apt-get install -y cowsay fortune netcat-traditional

# Copy the script into the container
COPY wisecow.sh /app/wisecow.sh

# Set the working directory
WORKDIR /app

# Make the script executable
RUN chmod +x wisecow.sh

# We need to forward our port as localhost port insde the container is different from the host's localhost
EXPOSE 4499

# Set the startup command
CMD ["./wisecow.sh"]

# Set PATH environment variable
# need to set this otherwise our installed packages arent being read inside the container 
ENV PATH="/usr/games:${PATH}"
