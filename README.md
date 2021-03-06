<p align="center">
<strong>Introducción a la Programación<br>
PRÁCTICA OBLIGATORIA GRUPAL<br>
Carrera de motociclismo<br>
2014 Carlos, Raul, Jose Miguel.<br>
</strong>
</p>
<p align="justify">
Los organizadores de la carrera de motociclismo quieren realizar un nuevo programa
para simular la gestión y la realización de una carrera. Se sabe que el número de equipos
que disputan las carreras puede cambiar, pero como máximo corren 24 equipos. De cada
equipo se guarda información sobre la moto y sobre el piloto (ver tipos de datos al final
del enunciado). La carrera se disputa en un circuito, que inicialmente tiene un kilómetro
de rectas y un kilómetro de curvas. El tiempo que tarda cada equipo en completar una
vuelta depende de las velocidades de las motos que usan. El tiempo se inicializará a 0
segundos.<br>
Se desea poder simular una carrera y mostrar la clasificación final. Las opciones que
debe incluir el nuevo programa serán:<br>
<br>
<strong>A</strong>. Dar alta un equipo. Esta opción permite dar de alta a un nuevo equipo. Para<
ello, si no está lleno el cupo, el sistema preguntará por todos los datos. El
identificador del equipo no puede estar repetido.<br>
<br>
<strong>B</strong>. Dar de baja un equipo. Para dar de baja a un equipo bastará con indicar el<
identificador del equipo. El sistema mostrará los datos del equipo (si existe) y
pedirá la confirmación de la baja. Si es correcta, el sistema procederá a eliminar
el equipo del mundial.<br>
<br>
<strong>C.</strong> Modificar un equipo. Para modificar cualquier campo de los datos de un
equipo, bastará con su identificador. El sistema mostrará los datos del equipo y
mediante un menú, preguntará el campo a modificar (se pueden modificar todos<br>
los datos excepto el identificador). El usuario introducirá el nuevo dato y volverá
a mostrar los datos hasta que el usuario este conforme con la información. En
ese momento se almacenaran los nuevos datos del equipo.<br>
<br>
<strong>D</strong>. Listado de equipos. Con esta opción se mostrará un listado de todos los
equipos, con toda su información.<br>
<br>
<strong>E</strong>. Modificar circuito. Esta funcionalidad mostrara por pantalla los datos del
circuito actual y permite cambiar la distancia de rectas y curvas del circuito. Hay
que tener en cuenta que las distancias no pueden ser negativas.<br>
<br>
<strong>F</strong>. Correr la carrera. Al elegir está opción, el programa simulará la disputa de la
carrera. Para ello, consultará el circuito, calculará y actualizará los tiempos de
cada equipo. Para calcular el tiempo, deberá usar la velocidad de la moto en las
rectas y el número de kilómetros de rectas del circuito, así como la velocidad de
la moto en las curvas y el número de kilómetros de curvas del circuito. No se
muestra nada por pantalla.<br>
<br>
<strong>G</strong>. Mostrar la clasificación. Con esta opción se mostrará por pantalla la
clasificación de la carrera. Para ello debe ordenar los equipos por el tiempo
empleado en la carrera y posteriormente mostrarlos.<br>
<br>
<strong>H</strong>. Guardar datos de la clasificación. En esta opción se escribirá en un fichero de
texto, cuyo nombre se preguntará al usuario, una línea por cada equipo, con el
nombre del equipo, el nombre del piloto y el tiempo dado.<br>
<br>
<strong>I</strong>. Guardar los equipos. Esta opción permite almacenar la información de todos
los equipos de carrera en un fichero binario, denominado necesariamente<
“equipo.dat”. Se debe almacenar únicamente los datos del equipo (solo los
equipos existentes en la carrera).<br>
<br>
<strong>J</strong>. Cargar los equipos. Esta opción permite cargar los equipos almacenados en el
fichero binario denominado “equipo.dat”. Los equipos pre-existentes en el
sistema se eliminarán. Si el fichero no existe, se mostrará un mensaje por
pantalla.<br>
<br>
<strong>K</strong>. Mostrar la clasificación de una carrera almacenada en un archivo. Esta
opción permitirá al usuario elegir el nombre de un archivo de texto y mostrará su
contenido por pantalla. Si el archivo no existe, mostrará un mensaje por pantalla.
</p>
