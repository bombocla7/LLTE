\# "Lanzando lanzando… triunfé escalando" Documento de diseño



\## Dinámica







\### Incentivos de Gameplay



\### Estrategias 



\*Sistemas:\*







\## Gameplay



\### Objetivo del juego



El juego tiene objetivos a largo y corto plazo. El objetivo del juego es conseguir escalar hasta el final del nivel. 

Para conseguir este objetivo ha de haberse mantenido cumpliendo otros objetivos a corto plazo:



\*Corto plazo:\* Llegar a la siguiente plataforma o lugar de descanso.



\### Core loop 



El bucle de juego es el siguiente: 

1. El jugador lanza la flecha 
2. La flecha acierta su objetivo o falla
3. En función de si ha acertado o ha fallado, avanza hasta el siguiente obstáculo o retrocede uno o más obstáculos



\### Personajes



Hay tanto personajes jugables como no jugables (NPCs)



Solo hay un personaje jugable.



\*Personaje principal: \* 

Es el personaje que controla el jugador.

El personaje principal no tiene nombre. 

Su mecánica principal es el arco. 

\*\*Parámetros: \*\* Velocidad de movimiento (ud/s), Velocidad en la cuerda (ud/s), Tiempo de recuperación tras caída (s), Velocidad de caída (ud/s)



\*NPCs: \*



No existen en el juego personajes que sean estrictamente "enemigos del jugador", aunque el murciélago si lo obstaculiza.



-Facundo

Facundo es el caracol de LAG. El jugador puede interactuar con facundo al acercarse a él. Cuando interactúa con Facundo, se activa un diálogo. 

\*\*Parámetros: \*\* Diálogo, Distancia de interacción (ud)



-Murciégalos

Oscilan de izquierda a derecha en línea recta. Colisionan con el personaje principal, y al tocarlo, el personaje principal suelta la cuerda y cae. 

\*\*Parámetros: \*\* Rango de oscilamiento (ud), Velocidad de movimiento (ud/s)



\### Controles



-Teclado/Ratón:

A: Mover izquierda

D: Mover derecha

Espacio: Salto movimiento

Hover del ratón: Dirección de apuntado del arco

Click izquierdo (pulsar): comenzar carga del arco

Click izquierdo (mantener): cargar arco

Click izquierdo (soltar): disparar flecha

Click izquierdo (dentro de un diálogo): saltar diálogo

Esc: Menú/Pausar

E: Interactuar



\### Mecánicas 



\*\*\*Movimiento: \*\*\*

El jugador se puede mover en un plano bidimensional. Con las flechas ad puede moverse a la izquierda y a la derecha, como se explica en los controles, y con la barra espaciadora tiene un pequeño salto. Para poder moverse verticalmente tiene que utilizar el arco. El arco dispara una flecha con una cuerda, que al impactar se tensa y por la que escala el personaje principal a la siguiente plataforma o zona. Si el jugador no consigue clavar la flecha, ésta arrastrará al jugador con ella.

-Arco: 

El arco requiere un tiempo de carga, haciendo que la flecha salga con una potencia proporcional a la carga.

\*\*Parámetros: \*\* Tiempo de carga máxima del arco (s)

El arco dispara una flecha.



-Flecha: 

La flecha sale disparada del arco en la dirección en la que estaba apuntando el jugador. La flecha se ve "afectada por la gravedad" y tiene caída. Además tiene una velocidad que va en función de la carga del arco. La flecha lleva una cuerda atada.

\*\*Parámetros: \*\* Caída de flecha (uds/s)(constante), Velocidad (uds/s)(depende de la carga del arco)

Al impactar en una superficie "impactable", la cuerda atada a la flecha se tensa y el personaje va andando por la cuerda hasta la flecha.



-Cuerda: La cuerda va "atada" a la flecha, y cuando la flecha se clava, se tensa en línea recta desde el punto de impacto hasta el jugador. Entonces, el jugador anda sobre la cuerda hasta el punto de impacto. Si la flecha falla, cuando llega al límite de su longitud arrastra al jugador en la dirección de la flecha. 

\*\*Parámetros: \*\* Longitud máxima de la cuerda (ud) 



\## Mundo del juego

El mundo del juego es un mundo de ambientación medieval.



\## Interfaz



\### Cámara

La cámara es fija en cada pantalla, viéndose toda la pantalla a la vez. Al cambiar de pantalla el jugador, la cámara sube (la mayoría de las veces, al ser vertical el mapa) y pasa a verse entera la siguiente pantalla. Lo mismo ocurre al caer el jugador entre pantallas o excepcionalmente al moverse por los lados entre pantallas. El juego no se detiene al pasar la cámara de una pantalla a otra.



\### HUD

El único elemento de la HUD es el tiempo transcurrido desde que se comenzó la partida. Se ubica en la esquina superior derecha y es de tamaño pequeño. No hay más HUD.



\### Menús

-Menú inicial: dos opciones, jugar y salir

-Menú de pausa: dos, continuar y salir al menú principal

-Menú de estadísticas (menú final): tres, tiempo, número de lanzamientos y puntuación (en función de las anteriores)



\## Estética y contenido



\### Arte 

Los fondos del nivel están hechos a acuarela, mientras que los elementos del nivel y los personajes están dibujados, editados y animados a mano en digital.



\### Música



\### Efectos visuales









