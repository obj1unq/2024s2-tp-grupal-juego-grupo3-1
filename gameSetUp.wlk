import wollok.game.*
import mapas.*
import historia.*
import reloj.*

object setUp {
  const mapas = #{barraSuperior, mapaInicial, mapa1, mapa2, mapa3, mapaFinal}
  
  method crearMapas() {
    mapas.forEach({ mapaActual => self.crearMapa(mapaActual) })
  }
  
  method crearMapa(mapaActual) {
    game.height(mapaActual.mapa().size())
    game.width(mapaActual.mapa().get(0).size())
    (0 .. (game.width() - 1)).forEach(
      { x => (0 .. (game.height() - 1)).forEach(
          { y => mapaActual.mapa().get(y).get(x).crearEn(
              mapaActual,
              game.at(x, y)
            ) }
        ) }
    )
  }
  
  method iniciarJuego() {
    self.iniciarBoard()
    self.crearMapas()
    game.start()
    self.sonarMusica()
    
    inicio.ejecutar()
    game.onTick(1000, "reloj", { reloj.tick() })
  }
  
  method iniciarBoard() {
    game.title("Aventura del Mate")
    game.height(12)
    game.width(20)
    game.cellSize(50)
    game.boardGround("boardGame.png")
  }
  
  method sonarMusica() {
    game.schedule(0, { game.sound("TokyoDriftVolumenBajo.mp3").play() })
  }
}




