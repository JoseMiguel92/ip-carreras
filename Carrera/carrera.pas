{Practica Grupal. Autores: - Garcia Benayas, Jose Miguel - Martin Santamaria, Raul - Olmo Sauquillo, Carlos}
PROGRAM carrera;

CONST
	NCNOMBRE = 15; {numero caracteres nombre}
	NCIDENTIFICADOR = 4; {numero caracteres del identificador del equipo}
	MAXEQUIPOS = 24; {numero de equipos maximo de la carrera}
	KMINICIALESRECTAS = 1; {numero de km inicial de las rectas del circuito}
	KMINICIALESCURVAS = 1; {numero de km inicial de las curvas del circuito}
	MIN = 1;

TYPE
	tNombre = string[NCNOMBRE]; {Tipo para almacenar el nombre}
	tIdentificador = string[NCIDENTIFICADOR]; {Tipo para almacenar el identificador}
	tNumEquipo = MIN..MAXEQUIPOS; {Tipo para almacenar el indice de equipos}
	tPiloto = RECORD
		nombre: TNombre;
		nacionalidad: String;
		edad: integer;
	END;

	tMoto = RECORD
		velRecta, velCurva: real; {Velocidad de la moto en las rectas y en las curvas}
	END;

	tEquipo = RECORD
		identificador: tIdentificador; {Identificador del equipo}
		nombre: tNombre; {Nombre del equipo}
		piloto: tPiloto; {Información del piloto}
		tiempo: real; {tiempo empleado por el equipo en la carrera}
		moto: tMoto; {Informacion de la moto del equipo}
	END; 	{Registro de Articulos}

	tEquipos = ARRAY [tNumEquipo] OF tEquipo;

	tEquiposCarrera = RECORD
		equipos: tEquipos;
		numEquipos: integer;
	END; {Almacena los equipos inscritos en la carrera}

	tCircuito = RECORD
		kmRectas, kmCurvas: real;
	END;

	tFicheroEquipos = FILE OF tEquipo;

VAR
	quieroSalir:boolean;
	salir:char;
	fichero_clasificacion:text;
	datos_equipo:tEquipos;
	fichero:tFicheroEquipos;
	datos:tEquiposCarrera;

FUNCTION menu:char;{MENU}
	VAR
		opcion:char;
	BEGIN
		REPEAT
			writeln('A.- Dar alta un equipo.');
			writeln('B.- Dar baja un equipo.');
			writeln('C.- Modificar un equipo.');
			writeln('D.- Listado de equipos.');
			writeln('E.- Modificar circuito.');
			writeln('F.- Correr la carrera.');
			writeln('G.- Mostrar la clasificacion.');
			writeln('H.- Guardar datos de la clasificacion.');
			writeln('I.- Guardar los equipos.');
			writeln('J.- Cargar los equipos.');
			writeln('K.- Mostrar la clasificacion de una carrera almacenada en un archivo.');
			writeln('L.- Finalizar.');
			write('Introduzca la opcion deseada: ');
			readln(opcion);
			writeln();
			IF NOT (((opcion>='A')AND(opcion<='L'))OR((opcion>='a')AND(opcion<='l'))) THEN BEGIN
				writeln('La opcion introducida no es valida, vuelve a intentarlo');
			END;
		UNTIL (((opcion>='A') AND (opcion<='L')) OR ((opcion>='a') AND (opcion<='l')));
		menu:=opcion;
	END;{MENU}

PROCEDURE guardarClasi (sub_dat_equipo:tEquipos ; VAR fich_clasi:text); {Guardar clasi}
VAR{Guardar clasi}
	vari_nombre:string;
	vari_nombre_txt:string;
	i:integer;
BEGIN{Guardar clasi}
	writeln('Escriba el nombre del fichero de la clasificacion, sin extension:');
	readln(vari_nombre);
	vari_nombre_txt:=(vari_nombre + '.txt');
	assign(fich_clasi,vari_nombre_txt);
	rewrite(fich_clasi);
		write(fich_clasi,'Nombre equipo':15);
		write(fich_clasi,' ');
		write(fich_clasi,'Nombre piloto':15);
		write(fich_clasi,' ');
		write(fich_clasi,'Tiempo':15);
		writeln(fich_clasi,' ');
		FOR i:=1 TO MAXEQUIPOS DO BEGIN
			write(fich_clasi,sub_dat_equipo[i].nombre:5);
			write(fich_clasi,' ');
			write(fich_clasi,sub_dat_equipo[i].piloto.nombre:5);
			write(fich_clasi,' ');
			write(fich_clasi,sub_dat_equipo[i].tiempo:5);
			writeln(fich_clasi,' ');
		END;
	close(fich_clasi);
	readln;
END;{Guardar clasi}


PROCEDURE guardarEquipos (todos_equipos:tEquiposCarrera ; VAR fich_equipos_carrera:tFicheroEquipos);{Guardar Equipos de la carrera}
VAR
	i:integer;
BEGIN{Guardar Equipos de la carrera}
	rewrite(fich_equipos_carrera);
	FOR i:=MIN TO todos_equipos.numEquipos DO
		write (fich_equipos_carrera, todos_equipos.equipos[i]);
	close(fich_equipos_carrera);
END;{Guardar Equipos de la carrera}

PROCEDURE mostrarClasi;{mostrarClasi}{mostrar clasificacion a partir de archivo de texto}
VAR
	buscar_clasi:string;
	buscar_clasi_txt:string;
	clasi:string;
	fich_mostrar_clasi:text;
BEGIN{mostrar clasificacion a partir de archivo de texto}
	writeln('Escribe el nombre de la clasificacion a buscar, sin entension:');
	readln(buscar_clasi);
	buscar_clasi_txt:=(buscar_clasi + '.txt');
	assign(fich_mostrar_clasi,buscar_clasi_txt);
	{$I-}
		reset(fich_mostrar_clasi);
	{$I+}
	IF (IORESULT=0) THEN BEGIN
		WHILE NOT EOF (fich_mostrar_clasi) DO BEGIN
			readln(fich_mostrar_clasi , clasi);
			writeln(clasi);
		END;{WHILE}
	close(fich_mostrar_clasi);
	END{IF}
	ELSE
		writeln('Lo siento, el archivo ',buscar_clasi_txt,' no se ha encontrado.');
END;{mostrarClasi}{mostrar clasificacion a partir de archivo de texto}

PROCEDURE borrarTodos (VAR equipos_borrar:tEquiposCarrera);
VAR
	i:integer;
BEGIN
	IF (equipos_borrar.numEquipos>0) THEN BEGIN
		equipos_borrar.numEquipos:=equipos_borrar.numEquipos+1;
			FOR i:=equipos_borrar.numEquipos-1 DOWNTO 1 DO
				equipos_borrar.equipos[i+1]:=equipos_borrar.equipos[i];
	END;{IF}
END;{borrarTodos}


PROCEDURE cargarEquipos (VAR sub_fich_equipos:tFicheroEquipos ; VAR todos:tEquiposCarrera);
VAR
 i:integer;
 sEquipo:tEquipo;
BEGIN
	borrarTodos(todos);
	{$I-}
		reset(sub_fich_equipos);
	{$I+}
	IF (IORESULT=0) THEN BEGIN
			i:=MIN;
			WHILE NOT EOF (sub_fich_equipos) DO BEGIN
				read (sub_fich_equipos, sEquipo);
				todos.equipos[i]:=sEquipo;
				i:=i+1;
				todos.numEquipos:=i-1;
			END;{WHILE}
	close(sub_fich_equipos);
	END{IF}
	ELSE
		writeln('No se encontro el archivo.');
END;{cargarEquipos}

BEGIN {Programa Principal}
	quieroSalir:=FALSE;
	assign (fichero,'equipo.dat');
	REPEAT
	CASE menu OF
		'a','A': BEGIN
					writeln('opcion a');
				END;
		'b','B': BEGIN
					writeln('opcion b');
				END;
		'c','C': BEGIN
					writeln('opcion c');
				END;
		'd','D': BEGIN
					writeln('opcion d');
				END;
		'e','E': BEGIN
					writeln('opcion e');
				END;
		'f','F': BEGIN
					writeln('opcion f');
				END;
		'g','G': BEGIN
					writeln('opcion g');
				END;
		'h','H': BEGIN
					writeln('guardar clasi');{Se borra o cambia este writ e}
					guardarClasi(datos_equipo,fichero_clasificacion);

				END;
		'i','I': BEGIN
					writeln('guardar equipos');{Se borra o cambia este writ e}
					guardarEquipos (datos,fichero);
				END;
		'j','J': BEGIN
					cargarEquipos(fichero,datos);
				END;
		'k','K': BEGIN
					writeln('Mostrar clasificacion');{Se borra o cambia este writ e}
					mostrarClasi();
				END;
		'l','L': BEGIN
					writeln('Esta seguro que desea salir? Se borraran todos los datos no guardados');
					write('<s/n>:');
					readln(salir);
					IF ((salir='s') OR (salir='S')) THEN
						quieroSalir:=TRUE
					ELSE
						quieroSalir:=FALSE;
				END;
	ELSE{CASE}
		writeln('Opcion no valida.');
	END;{CASE}
	UNTIL quieroSalir;
	readln();
END.{Programa Principal}
