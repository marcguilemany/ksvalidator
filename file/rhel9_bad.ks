#version=RHEL9
instal                           # ERROR: Debe ser "install", falta una "l"
lang en_US.UT8                   # ERROR: Debe ser "UTF-8" en lugar de "UT8"
keyboard us

timezone America/New_York        # ERROR: Falta la opción --isUtc y --ntp (u otra configuración adicional)

# ERROR: El parámetro "--active" en lugar de "--activate"
network --bootproto=dhcp --device=eth0 --active --hostname=RHEL9Example

# ERROR: Falta "--plaintext" y la sintaxis correcta para definir la contraseña de root
rootpw plaintext changeme

# ERROR: La opción de bootloader debe especificarse en minúsculas ("mbr") y puede faltar algún parámetro
bootloader --location=MBR --boot-drive=sda

# ERROR: Comando mal escrito, debe ser "clearpart" y no "clearpt"
clearpt --all

autopart

reboot

%packages
# ERROR: Grupo mal escrito: debe ser "@^minimal-environment"
@^minimal-environmnt
vim
%end

%post
echo "Instalación completada en RHEL9" >> /root/install.log
# ERROR: Falta la etiqueta de cierre del bloque post, es decir, "%end"
