#version=RHEL9

# Idioma y configuración regional
lang en_US.UTF-8
keyboard us

# Zona horaria (ajusta la zona horaria según tu ubicación)
timezone America/New_York --isUtc --ntpservers=pool.ntp.org

# Configuración de red (ajusta el dispositivo, hostname y opciones según tu entorno)
network --bootproto=dhcp --device=eth0 --activate --hostname=rhel9.example.com

# Contraseña de root en texto plano (cámbiala por una más segura o utiliza una versión cifrada)
rootpw --plaintext changeme

# Configuración del arranque: ubicamos el cargador en el MBR del disco principal
bootloader --location=mbr --boot-drive=sda

# Limpiar la tabla de particiones existente
clearpart --all --initlabel

# Particionado automático usando LVM
autopart

# Reiniciar el sistema al finalizar la instalación
reboot

%packages
# Instala un entorno mínimo
@^minimal-environment
# Puedes agregar paquetes adicionales aquí, por ejemplo:
# vim
# wget
%end

%post --log=/root/ks-post.log
# Tareas post-instalación (opcional)
echo "Instalación completada en RHEL9" >> /root/install.log
%end
