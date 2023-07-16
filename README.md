# SnakeGamePD
Este juego está hecho utilizando Haskell y en concreto, utilizando el paquete CodeWorld.
Para ejecutarlo, en primer luegar será necesario abrir el terminal, escribit "ghci" para ejecutar la consola, y en segundo lugar cargar el fichero del juego con ":l  JuegoMain", una vez hecho esto escribiendo "main" en la consola nos indicará la url donde se está ejecutando el juego.
![image](https://github.com/Antoniiosc7/SnakeGamePD/assets/67718811/28f8bd84-d741-489e-a3ee-4b44c61d6385)

Si da errores por falta de paquetes: 
cabal update
cabal install QuickCheck
cabal install array vector matrix multiset
cabal install primes data-default csv aeson
cabal install codeworld-api (puede ser necesario añadir --force-reinstalls)
cabal install gnuplot parallel monad-par
