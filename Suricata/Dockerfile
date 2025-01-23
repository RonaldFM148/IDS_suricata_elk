# Usar la última versión de AlmaLinux como base de SO
FROM almalinux:latest

# Instalar actualizaciones y dependencias necesarias
RUN dnf update -y && \
    dnf install -y epel-release && \
    dnf install -y suricata wget nano tar tcpdump net-tools && \
    dnf clean all

# Crear directorios para persistencia de logs y reglas
RUN mkdir -p /etc/suricata/custom_config/rules /var/log/suricata

#COPY ./config/suricata.yaml /etc/suricata/suricata.yaml

# Establecer el directorio de trabajo
WORKDIR /etc/suricata

# Exponer el puerto para tráfico de red
EXPOSE 3000

# Comando para iniciar Suricata
CMD ["suricata", "-c", "/etc/suricata/suricata.yaml", "-i", "eth0"]
