                                            Introducción a la Programación<br>
                                            PRÁCTICA OBLIGATORIA GRUPAL<br>
                                            Carrera de motociclismo<br>
                                            Practica IP 2014 Carlos, Raul, Jose Miguel.<br>
Los organizadores de la carrera de motociclismo quieren realizar un nuevo programa<br>
para simular la gestión y la realización de una carrera. Se sabe que el número de equipos<br>
que disputan las carreras puede cambiar, pero como máximo corren 24 equipos. De cada<br>
equipo se guarda información sobre la moto y sobre el piloto (ver tipos de datos al final<br>
del enunciado). La carrera se disputa en un circuito, que inicialmente tiene un kilómetro<br>
de rectas y un kilómetro de curvas. El tiempo que tarda cada equipo en completar una<br>
vuelta depende de las velocidades de las motos que usan. El tiempo se inicializará a 0<br>
segundos.<br>
Se desea poder simular una carrera y mostrar la clasificación final. Las opciones que<br>
debe incluir el nuevo programa serán:<br>
<strong>A</strong>. Dar alta un equipo. Esta opción permite dar de alta a un nuevo equipo. Para<br>
ello, si no está lleno el cupo, el sistema preguntará por todos los datos. El<br>
identificador del equipo no puede estar repetido.<br>
<strong>B</strong>. Dar de baja un equipo. Para dar de baja a un equipo bastará con indicar el<br>
identificador del equipo. El sistema mostrará los datos del equipo (si existe) y<br>
pedirá la confirmación de la baja. Si es correcta, el sistema procederá a eliminar<br>
el equipo del mundial.<br>
<strong>C.</strong> Modificar un equipo. Para modificar cualquier campo de los datos de un<br>
equipo, bastará con su identificador. El sistema mostrará los datos del equipo y<br>
mediante un menú, preguntará el campo a modificar (se pueden modificar todos<br>
los datos excepto el identificador). El usuario introducirá el nuevo dato y volverá<br>
a mostrar los datos hasta que el usuario este conforme con la información. En<br>
ese momento se almacenaran los nuevos datos del equipo.<br>
<strong>D</strong>. Listado de equipos. Con esta opción se mostrará un listado de todos los<br>
equipos, con toda su información.<br>
<strong>E</strong>. Modificar circuito. Esta funcionalidad mostrara por pantalla los datos del<br>
circuito actual y permite cambiar la distancia de rectas y curvas del circuito. Hay<br>
que tener en cuenta que las distancias no pueden ser negativas.<br>
<strong>F</strong>. Correr la carrera. Al elegir está opción, el programa simulará la disputa de la<br>
carrera. Para ello, consultará el circuito, calculará y actualizará los tiempos de<br>
cada equipo. Para calcular el tiempo, deberá usar la velocidad de la moto en las<br>
rectas y el número de kilómetros de rectas del circuito, así como la velocidad de<br>
la moto en las curvas y el número de kilómetros de curvas del circuito. No se<br>
muestra nada por pantalla.<br>
<strong>G</strong>. Mostrar la clasificación. Con esta opción se mostrará por pantalla la<br>
clasificación de la carrera. Para ello debe ordenar los equipos por el tiempo<br>
empleado en la carrera y posteriormente mostrarlos.<br>
<strong>H</strong>. Guardar datos de la clasificación. En esta opción se escribirá en un fichero de<br>
texto, cuyo nombre se preguntará al usuario, una línea por cada equipo, con el<br>
nombre del equipo, el nombre del piloto y el tiempo dado.<br>
<strong>I</strong>. Guardar los equipos. Esta opción permite almacenar la información de todos<br>
los equipos de carrera en un fichero binario, denominado necesariamente<br>
“equipo.dat”. Se debe almacenar únicamente los datos del equipo (solo los<br>
equipos existentes en la carrera).<br>
<strong>J</strong>. Cargar los equipos. Esta opción permite cargar los equipos almacenados en el<br>
fichero binario denominado “equipo.dat”. Los equipos pre-existentes en el<br>
sistema se eliminarán. Si el fichero no existe, se mostrará un mensaje por<br>
pantalla.<br>
<strong>K</strong>. Mostrar la clasificación de una carrera almacenada en un archivo. Esta<br>
opción permitirá al usuario elegir el nombre de un archivo de texto y mostrará su<br>
contenido por pantalla. Si el archivo no existe, mostrará un mensaje por pantalla.
