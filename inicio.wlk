import wollok.game.*
import supertablero.*

class Historia {
  method position() = game.at(0, 0)
  
  method ejecutar() {
    game.addVisual(self)
  }
}

object inicio inherits Historia {
  var orden = 0
  
  method image() = ("0" + orden.toString()) + "-intro.png"
  
  override method ejecutar() {
    super()
    keyboard.enter().onPressDo({ self.cambiar() })
  }
  
  method seguirMostrando() = orden < 5
  
  method cambiar() {
    if (self.seguirMostrando()) {
      orden += 1
    } else {
      superTablero.inicioDeJuego()
    }
  }
} //Leo

object finDeJuegoNoAgarro inherits Historia {
  method image() = "04-fin-Leo.png"
  
  override method ejecutar() {
    super()
    game.stop()
  }
} //Deby

object finDeJuegoSinTiempo inherits Historia{
  method image() = "04-fin-Leo.png"
} 

//Pablo y Ami

object finDeJuegogGano inherits Historia{
  method image() = "04-fin-Leo.png"
}