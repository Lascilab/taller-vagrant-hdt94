# Práctica de Vagrant

En esta tarea el estudiante deberá evienciar sus habilidades en el uso de la herramienta [Vagrant](https://vagrantup.com). 
En cada una de las actividades el estudiante deberá proveer lo siguiente:

* Un video colgado en la plataforma [asciinema](https://asciinema.org/) donde se de evidencie que se llevó a cabo la tarea requerida. Elementos a considerar:
  * Evidencia de las máquinas existentes. `VBoxManage list vms`
  * Ejecución del comando para la creación de la máquina. `vagrant up`
  * Evidenciar que la máquina creada cuenta con las características requeridas. `VBoxManage showvminfo`
  * Breve descripción del archivo `Vagrantfile`
  * Enlace al archivo `Vagrantfile` construido para llevar a cabo la actividad requerida.

* En cada uno de los ítems se hace referencia a un archivo `Vagrantfile-nn`. El `01` para la actividad `01`, el `02` para la actividad `02` y así sucesivamente.

* Los videos no deberían tener una duración superior a 3 minutos.

**Opcional para quienes no puedan mostrar video**

Para quien no pueda hacer uso de la plataforma `asciinema` entonces deberá proveer una imagen con la evidencia de que se completó la tarea requerida. 
Trabajos que entreguen imágenes (*screenshots*) se calificarán sobre **4.0**.

![](screenshot.jpg)

---

> **_IMPORTANTE:_** Por favor no subir su tarea a [GitHub](https://github.com) hasta tanto usted no la haya completado. 
> Por tanto, se sugiere que cree `branches` de la tarea y una vez un ítem este listo entonces hace el corresponiente `merge` del `branch`. 
> Una vez usted sube sus cambios a GitHub el profesor podrá comentar sus cambios. 
> Cualquier **adición** al código que no se haya discutido con el profesor no será **considerado** para la nota final de la asignación y dicha adición será considerada como entregada fuera de tiempo. 

---

# Actividades

A continuación se presentan las diferentes actividades que el estudiante deberá llevar a cabo.

* [Creacion de maquina virtual](#creacion-de-maquina-virtual)
* [Personalizando maquina virtual](#personalizando-maquina-virtual)
* [Aprovisionando maquina virtual](#aprovisionando-maquina-virtual)
* [Redireccion de puertos](#redireccion-de-puertos-de-red)
* [Directorios compartidos](#directorios-compartidos)
* [Multiples maquinas](#multiples-maquinas)
* [Despliegue HAProxy](#despliegue-haproxy)

---

## Creacion de maquina virtual

En esta actividad usted deberá evidenciar que ha sido capaz de: 

* Crear una máquina virtual
* Instalar el servidor web Apache2
* Permitir el acceso desde el *host* al servidor web que corre en el *guest*. **Tip** Habilitar el *port forwarding* en la máquina virtual.

**Respuesta**

Muestre evidencia que logró cumplir con lo planteado en los siguientes enlaces:

* [**ENLACE A VIDEO EN ASCIINEMA**](https://asciinema.org)
* [**ENLACE A VAGRANTFILE**](Vagrantfile-01)

---

## Personalizando maquina virtual

En esta actividad se debe llevar a cabo la tarea de personalizar una máquina virtual **ya creada** y personalizar otra a través del comando `vagrant` mientras esta se está creando.  
La máquina ya creada, que puede ser la del [punto anterior](#creacion-de-maquina-virtual), se debe personalizar con el comando `VBoxManage`. 

A continuación los ítems que debe modificar en la máquina virtual:

* Nombre de la máquina virtual. Esta deberá llamarse `maquina-punto2.local`.
* Número de CPUs asignadas a la máquina virtual a **4 CPUs**.
* Tamaño de la memoria RAM a **720 MB**.
* Asignar solo el 75% de la capacidad del procesador del *host* al *guest*.

Usando el comando `VBoxManage` habilite el *port forwarding* de modo que el puerto `8080` del *host* sea redireccionado al puerto `80` del *guest*.

**Respuesta**

Muestre evidencia que logró cumplir con lo planteado en los siguientes enlaces:

* [**ENLACE A VIDEO EN ASCIINEMA CON VBOXMANAGE**](https://asciinema.org)
* [**ENLACE A VIDEO EN ASCIINEMA CON VAGRANTIFLE**](https://asciinema.org)
* [**ENLACE A VAGRANTFILE**](Vagrantfile-02)

---

## Aprovisionando maquina virtual

Una de las características de Vagrant es que no solo permite la fácil creación de máquinas virtuales sino que también permite su aprovisionamiento.
Con aprovisionamiento, en este contexto, se hace referencia al hecho de que después de que la máquina virtual ha sido creada pero antes que termine la ejecución del comando `vagrant up` se lleva a cabo la instalación de software requerido por la máquina virtual.

Usando como base el `Vagrantfile` del punto ['Creacion de maquina virtual'](#creacion-de-maquina-virtual) adicione las líneas necesarias para que esta máquina tenga instalada, después de la terminación del comando `vagrant up`, el servidor web Apache. 
Validar que efectivamente el servidor web fue instalado exitósamente.

**Respuesta**

Muestre evidencia que logró cumplir con lo planteado en los siguientes enlaces:

* [**ENLACE A VIDEO EN ASCIINEMA**](https://asciinema.org)
* [**ENLACE A VAGRANTFILE**](Vagrantfile-03)
* [**ENLACE A SCRIPT DE INSTALACIÓN**](install-apache.sh)

--- 

## Redireccion de puertos de red

Construya un `Vagrantfile` que al ser invocado cree una máquina virtual con las siguientes características:

* Configuración de la máquina:
  * Un procesador
  * 512 MB de memoria RAM
  * Nombre `apache-server`
* Servidor web instalado
* El puerto `8000` del *host* apunta al puerto `80` del *guest*.

**Respuesta**

Muestre evidencia que logró cumplir con lo planteado en los siguientes enlaces:

* [**ENLACE A VIDEO EN ASCIINEMA**](https://asciinema.org)
* [**ENLACE A VAGRANTFILE**](Vagrantfile-04)
* [**ENLACE A SCRIPT DE INSTALACIÓN**](install-apache.sh)

---

## Directorios compartidos

Tome como base el archivo de `Vagrantfile` anterior e incorpore las instrucciones que permitan asociar un directorio del *host* con un directorio del *guest*. 
El directorio del *host*, que es provisto en este repositorio y se llama `html`, se debe poder acceder por el servidor web que corre en el *guest*.
Una vez se aprovisione la máquina virtual, desde el *host*, ejecute el comando `wget http://localhost:8000/` y se deberá obtener un archivo `index.html` que contiene lo siguiente:

```
<html>
<body>
Hola mundo
</body>
</html>
```

**Respuesta**

Muestre evidencia que logró cumplir con lo planteado en los siguientes enlaces:

* [**ENLACE A VIDEO EN ASCIINEMA**](https://asciinema.org)
* [**ENLACE A VAGRANTFILE**](Vagrantfile-05)

---

## Multiples maquinas 

En este ejercicio usted deberá crear dos máquinas virtuales las cuales despliegan el servidor web de Apache.
Las máquinas se deberán poder crear al tiempo usando el comando `vagrant up`. 
Las máquinas también se deberán poder crear de forma individual con el comando `vagrant up web1` o `vagrant up web2` para crear las máquinas virtuales `web1` o `web2`, respectivamente.
La máquina `web1` deberá escuchar por el puerto `8000` y la máquina `web2` por el puerto `8008`. 
La máquina `web1` deberá accedr al directorio `html` del *host* y la máquina `web2` deberá acceder al directorio `www` del *host*.

**Respuesta**

Muestre evidencia que logró cumplir con lo planteado en los siguientes enlaces:

* [**ENLACE A VIDEO EN ASCIINEMA**](https://asciinema.org)
* [**ENLACE A VAGRANTFILE**](Vagrantfile-06)

---

## Despliegue HAProxy

En la última clase se presentó el despliegue de HAProxy.
HAProxy es un servicio de red que permite el balanceo de carga en una granja de servidores, particularmente servidores web.
Sin embargo, HAProxy ha sido usado para balancear la carga de otro tipo de servicios basados en TCP. 

En este caso usted usará los siguientes archivos para llevar a cabo el despliegue de este servicio HAProxy.

* [Vagrantfile](Vagrantfile-07) este `Vagrantfile` provee muchas cosas ya realizadas:

  * Definición de las tres máquinas: `web01`, `web02`, `haproxy`.

  * Asignación de IPs para cada una de las máquinas: `web01: 192.168.200.3`, `web02: 192.168.200.4`, `haproxy: 192.168.200.5`. 

  * Creación de directorios compartidos para cada uno de los servidores web: `web01: ./web01`, `web02: ./web02`. **Asegúrese que a la hora de usar este Vagrantfile para el despliegue los directorios** `./web01` y `./web02` **estén creados**.

    * En el directorio `./web01` debe ir [este archivo `index.html`](index.html.01). Este archivo debe ser renombrado como `index.html`.

    * En el directorio `./web02` debe ir [este archivo `index.html`](index.html.02). Este archivo debe ser renombrado como `index.html`.

  * El script para el despliegue de Apache2 es provisto.

* [web.sh](web.sh) script para el despliegue de servicios Apache2.

### Su trabajo consiste en...

**Su tarea es crear el archivo** `haproxy.sh` **que se invoca a la hora de crear la máquina virtual** `haproxy`. El `haproxy.sh` contiene los pasos que permiten el despliegue del servicio HAProxy y que se describen en este [artículo](https://www.howtoforge.com/tutorial/ubuntu-load-balancer-haproxy/).


**Respuesta**

Muestre evidencia que logró cumplir con lo planteado en los siguientes enlaces:

* [**ENLACE A VIDEO EN ASCIINEMA**](https://asciinema.org)
* [**ENLACE A `haproxy.sh`**](haproxy.sh)
