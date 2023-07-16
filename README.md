# SnakeGamePD

## Descripción del proyecto
Este juego está hecho utilizando Haskell y en concreto, utilizando el paquete CodeWorld. El juego consiste en mover "la serpiente" a través del tablero sin tocar ningún muro y tratar de comerte la manzana (el punto rojo) el mayor número de veces. El juego acabará cuando se haya comida la manzana un total de 10 veces. Tiene dos dificultades se podrá usar una u otra según los controles que se utilicen. El modo fácil se podrá usar si movemos la serpiente con las "flechas" del teclado ("↑", "←", "→", "↓") y el modo dificil se ejecutará si movemos la serpiente con los números "1", "2", "3", y "5". La dificultad extra del modo dificil, es que los bloques intermedios se moverán de sitio con cada movimiento de la serpiente.

Es una recreación del clásico juego de la serpiente que tiene que comer manzanas evitando chocarse tanto con los bordes como con los obstáculos intermedios. Para ello, hemos decidido generar un tablero con diferentes estados definidos, cada vez que se pulsa una tecla de movimiento se genera un nuevo estado. Para ello hemos usado un función que maneja cada evento posible y verifica si en el nuevo estado se ha tocado alguno de los bloques prohibidos, es decir, los bloques del borde o los bloques que hacen de obstáculo, o bien si se avanza a una casilla permitida o se come la manzana. El juego consta de dos dificultades, la dificultad “fácil” es aquella que se activa al usar el juego con las teclas “←”, “↑”, “→” y “↓”, en este modo los bloques intermedios permanecen en una posición fija desde el inicio hasta que se come la manzana, sin embargo el modo “difícil” se activa al usar el juego con las teclas “1”, “5”, “3” y “2”, la diferencia con el modo “fácil” es que en cada movimiento los bloques intermedios se generan en una nueva posición aleatoria.

En cuanto se toca o bien un bloque que forma el borde o bien un bloque intermedio la serpiente queda encerrada en una cárcel que representa que se ha perdido, para salir de la
cárcel es necesario recargar la página y volver a empezar el juego. Cuando se acumulan 10 manzanas sin perder la serpiente es encerrada en una cárcel de color dorado que
representa haber ganado el juego.

![image](https://github.com/Antoniiosc7/SnakeGamePD/assets/67718811/2c29bd07-fdcc-4205-9b85-43d247f45e93)

## Cómo ejecutarlo

Para ejecutarlo, en primer luegar será necesario abrir el terminal, escribir en la consola: 

- "ghci":    Para ejecutar la consola.
- ":l  JuegoMain":    Para cargar el fichero del juego.
- "main":    Tras esto, la consola nos indicará la url donde se está ejecutando el juego.

## Instalación de paquetes

Si da errores por falta de paquetes: 

- cabal update
- cabal install QuickCheck
- cabal install array vector matrix multiset
- cabal install primes data-default csv aeson
- cabal install codeworld-api (puede ser necesario añadir --force-reinstalls)
- cabal install gnuplot parallel monad-par
