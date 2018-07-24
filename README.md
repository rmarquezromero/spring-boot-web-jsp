# Spring boot web EXAMPLE

### Version
1.0.0

### Tecnologías y herramientas

Desarollado con STS IDE usando:

* [Java] - 8 
* [Spring] - spring-boot-starter
* [Maven] 
* [Tomcat]
* [JSP] 
* [JSON]
* [HTML] 
* [jQuery]
* [Bootstrap]
* [CSS]
* [Google Chrome]

### Guía de ejecución por consola como Spring boot app

```sh
Descarga spring-boot-web-jsp-1.0.war de la carpeta war del repositorio: https://github.com/rmarquezromero/spring-boot-web-jsp/blob/master/war/spring-boot-web-jsp-1.0.war y pégalo en una carpeta local. 
```
```sh
Descarga films.json de la carpeta war del repositorio: https://github.com/rmarquezromero/spring-boot-web-jsp/blob/master/war/films.json y pégalo en la misma ubicación que el war.
```
```sh
Abre una consola de comandos de Windows y sitúate en la carpeta del war
```
```sh
Ejecuta java -jar spring-boot-web-jsp-1.0.war
```
```sh
La aplicación web estará disponible en http://localhost:8080
```

### Guía de instalación en IDE STS y ejecución desde IDE.

```sh
Es necesario tener Tomcat 8 o superior instalado Y JDK 8.
```
```sh
Descargar proyecto del repositorio al workspace local.
```
```sh
Abrir STS e importar como "Existing projects into Workspace"
```
```sh
Abrir application.properties y cambiar el atributo app.environment por DEV
```
```sh
Ejecutar Maven > Update project
```
```sh
Hacer Clean & Build
```
```sh
Ejecutar Run as > Maven clean
```
```sh
Ejecutar Run as > Maven install
```
```sh
Ejecutar Run as > Spring boot app
```
```sh
La aplicación web estará disponible en http://localhost:8080
```