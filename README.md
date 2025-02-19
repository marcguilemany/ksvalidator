# KS Validator con Ansible y Podman

Este proyecto automatiza la validación de archivos Kickstart para RHEL (probado en RHEL9) utilizando un contenedor basado en imágenes UBI y un playbook de Ansible.
La validación se realiza ejecutando el comando `ksvalidator` (parte de las herramientas pykickstart) dentro del contenedor.
Además, el playbook se encarga de limpiar el entorno al finalizar la prueba.

## Uso del Playbook
  ansible-playbook -c local ks_validator.yml -e @vars/inputs_vars.yml -vv


## Características

- **Validación de parámetros de entrada:**  
  Se comprueba que la versión del sistema operativo esté definida y que el archivo Kickstart tenga la extensión correcta.

- **Montaje del Kickstart:**  
  El archivo Kickstart se monta en el contenedor en modo solo lectura para su validación.

- **Gestión del contenedor:**  
  Utiliza Podman para crear un contenedor con la imagen adecuada (según la variable `os_version`: 8 o 9 )
  Configura con opciones como `privileged` y `network_mode: host` para evitar problemas con cgroups y namespaces. #Comentado en el código para hacer uso de él.

- **Registro e instalación de herramientas (opcional):**  
  Permite registrar el contenedor con Red Hat Subscription Manager para acceder a repositorios e instalar paquetes necesarios (por ejemplo, `pykickstart` para disponer del comando `ksvalidator`).

- **Validación del Kickstart:**  
  Se ejecuta `ksvalidator` dentro del contenedor para comprobar la sintaxis del archivo Kickstart y se guarda el resultado.

- **Limpieza automática:**  
  Se destruye el contenedor y se detiene el servicio de Podman al finalizar la prueba.

## Requisitos

- **Ansible:** Se requiere usar una versión (2.11 o superior).  

Colección community.docker:
Instala la colección necesaria:
    ``` ansible-galaxy collection install community.docker

## Estructura del Proyecto

ksvalidator/
|---ks_validator.yml      # yml que emula al book y importa la collection, los host y las tasks/main.yml
├── tasks/
│   ├── main.yml          # Playbook principal que importa las demás tareas
│   ├── prerequisites.yml # Validación de variables de entrada (OS version, Kickstart file)
│   ├── mount_ks.yml      # Tareas para montar el archivo Kickstart
│   └── container.yml     # Tareas para gestionar el contenedor: creación, registro, validación, limpieza
├── vars/
│   └── inputs_vars.yml   # Archivo de variables de entrada (os_version, kickstart_file, etc.) # Posibilidad de cambiarlo por un survey en AAP
│   └── variables.yml     # Archivo de variables globales: **redhat_username**, **redhat_password**, tag_version, image_version
├── file/
│   └── archivo.ks        # Archivo Kickstart de ejemplo
└── README.md
