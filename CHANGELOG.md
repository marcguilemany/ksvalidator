# CHANGELOG

Todos los cambios notables en este proyecto se documentarán en este archivo.

Este proyecto sigue el formato de [Keep a Changelog](https://keepachangelog.com/en/1.0.0/) y se adhiere a [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]
### Added
- Añadir solucion al mal formateo de kicstart (dos2unix)
- Desregistrar el container de RedHat antes de finalizar
- Añadir Vault para password.

### Changed
- (Cambios en curso.)

### Fixed


## [1.0.0] - 2025-02-18
### Added
- Versión inicial del proyecto.
- Implementación de validación sintáctica del Kickstart mediante `ksvalidator`.
- Ejecución de validación dentro de un contenedor basado en UBI.
- Registro opcional con Red Hat Subscription Manager.
- Limpieza automática del entorno tras la ejecución.
- Documentación básica en README.md.
- Integración inicial de ksvalidator con Ansible y Podman.
- Validación de parámetros de entrada (versión de S.O y archivo Kickstart).
- Montaje del archivo Kickstart en el contenedor.
- Creación, registro y limpieza del contenedor.
- Ajustes en la configuración de cgroups y namespaces para contenedores en entornos rootless.
- Actualización de tareas para soportar múltiples imágenes (UBI8, UBI9, UBI10).
