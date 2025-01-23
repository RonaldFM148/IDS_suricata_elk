# Base image
FROM ubuntu:22.04

# Actualizar e instalar herramientas necesarias
RUN apt-get update && apt-get install -y \
    iproute2 \
    net-tools \
    vim \
    tcpreplay \
    software-properties-common \
    curl \
    wget \
	iputils-ping \
    && apt-get clean

# Crear directorios para persistencia de logs y reglas
RUN mkdir -p /home/user/data

# Establecer el directorio de trabajo
WORKDIR /home/user


# Configurar el contenedor para permitir instalación futura de paquetes
RUN echo "deb http://archive.ubuntu.com/ubuntu focal main universe" >> /etc/apt/sources.list

# Configurar bash como shell predeterminado
CMD ["/bin/bash"]
