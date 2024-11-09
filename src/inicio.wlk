import supertablero.*
import wollok.game.*


object inicio {
  var property estado = intro0
  method position() = game.at(0, 0)
  method image() = estado.image()
  
  method ejecutarInicio(){

    game.addVisual(self)
    keyboard.enter().onPressDo({self.cambiar()})
      
  }






  method cambiar() {
    estado = estado.siguiente()
    self.iniciarJuegoSiTermino()
  }

  method iniciarJuegoSiTermino() {
    if (not estado.seguirMostrando()) superTablero.inicioDeJuego()
  }
}

class Introduccion {
  method image() 
  method siguiente()
  method seguirMostrando() = true
}

// Imágenes de introducción
object intro0 inherits Introduccion {
  const property image = "portadaEnter.png"
  
  override method siguiente() = intro1
}

object intro1 inherits Introduccion {
  const property image = "introEnter1.png"
  
  override method siguiente() = intro2
}

object intro2 inherits Introduccion {
  const property image = "introEnter2.png"
  
  override method siguiente() = intro3
  
}

object intro3 inherits Introduccion {
  const property image = "introEnter3.png"
  
  override method siguiente() = intro4
  
}

object intro4 inherits Introduccion {
  const property image = "introEnter4.png"
  
  override method siguiente() = intro5
  
}

object intro5 inherits Introduccion {
  const property image = "controles.png"
  
  override method siguiente() = intro6
  
}


//Este objeto es necesario para que se muestre la pantalla de controles!! Sino pasa directamente al mapa y la saltea.
object intro6 inherits Introduccion {
  const property image = "controles.png"
  
  override method siguiente() = self
  
  override method seguirMostrando() = false
}