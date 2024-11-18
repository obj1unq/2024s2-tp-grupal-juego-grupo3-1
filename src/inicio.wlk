import wollok.game.*
import supertablero.*


object inicio {
  var property estado = intro0
  method position() = game.at(0, 0)
  method image() = estado.image()
  
  method ejecutarInicio(){

    game.addVisual(self)
    keyboard.enter().onPressDo({self.cambiar()})
      
  }

  method cambiar() {
    if (estado.seguirMostrando()){
        estado = estado.siguiente()
    }
    else{
        superTablero.inicioDeJuego()
    }

  }
}

class Introduccion {
  const property image
  method siguiente()
  method seguirMostrando() = self.siguiente() != null 
}

// Imágenes de introducción
object intro0 inherits Introduccion (image = "portadaNuevoSize.png"){

  override method siguiente() = intro1
}

object intro1 inherits Introduccion(image = "00-intro.png"){  
  override method siguiente() = intro2
}

object intro2 inherits Introduccion (image = "01-rena.png") {
  
  override method siguiente() = intro3
  
}

object intro3 inherits Introduccion (image = "02-mile.png"){  
  override method siguiente() = intro4
  
}

object intro4 inherits Introduccion(image = "03-azu.png") {  
  override method siguiente() = intro5
  
}

object intro5 inherits Introduccion(image = "04-gonza.png") {  
  //override method siguiente() = intro6
    override method siguiente() = null // nos lo puso leo

  
}

// object intro6 inherits Introduccion(image = "controles.png") {  
//   override method siguiente() = null // nos lo puso leo
// }

//FALTA DEFINIR LA PANTALLA CON CONTROLES NUEVA
