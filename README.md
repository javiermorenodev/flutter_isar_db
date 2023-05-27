# FLUTTER ISAR DB

En esta ocacición les traigo un paquete muy interesante para almacenar informacion en local storage del dispositivo movil, esto hablando de https://isar.dev/es/ una base de datos super rapida, multiplataforma para flutter con mucahs ventajas y sobre todo de Código abierto.

## Install ISAR

isar_version: &isar_version 3.1.0 # define the version to be used

dependencies:
  isar: *isar_version
  isar_flutter_libs: *isar_version # contains Isar Core

dev_dependencies:
  isar_generator: *isar_version
  build_runner: any