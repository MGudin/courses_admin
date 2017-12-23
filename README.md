# Courses Admin

Este es el trabajo integrador de la materia Taller de Tecnologias de
Software opcion ruby.

Son requisitos para correr la aplicacion:

- ruby ~> 2.4.1
- rails ~> 5.1.4
- bundler 
- base de datos MySql

**gemas:**
- simple_form
- mysql2
- devise

Para correr la aplicacion:

- Bajar o clonar el repositorio a una carpeta

``` shell
$ git@github.com:chudix/courses_admin.git <carpeta>
```
- Instalar dependencias con bundler:

``` shell
$ bundle 
```

- crear el archivo un archivo /config/secrets.yml donde se pondran los
  datos de acceso a la base de datos:
  
``` shell
$ touch config/secrets.yml
```
*config/secrets.yml*

``` yaml
shared:
  database_user: <usuario_db>
  database_psswd: <passwd_db>
```
- Crear y sedear la base de datos ejecutando:

``` shell
bundle exec rails db:setup
```

- opcinalmente ejecutar los test:

``` shell
bundle exec rails test 
```

- Finalmente: 

``` shell
bundle exec rails server
```

Deberia levantar la aplicacion en localhost:3000.


