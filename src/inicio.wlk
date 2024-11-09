import supertablero.*
import wollok.game.*


object inicio {
  var property estado = intro0
  method position() = game.at(0, 0)
  method image() = estado.image()
  
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
  const property image = "intro-0.png"
  
  override method siguiente() = intro1
}

object intro1 inherits Introduccion {
  const property image = "intro_1.png"
  
  override method siguiente() = intro2
}

object intro2 inherits Introduccion {
  const property image = "intro_2.png"
  
  override method siguiente() = intro3
  
}

object intro3 inherits Introduccion {
  const property image = "intro_-3.png"
  
  override method siguiente() = intro4
  
}

object intro4 inherits Introduccion {
  const property image = "intro_4.png"
  
  override method siguiente() = intro5
  
}

object intro5 inherits Introduccion {
  const property image = "intro5.png"
  
  override method siguiente() = self
  
  override method seguirMostrando() = false
}