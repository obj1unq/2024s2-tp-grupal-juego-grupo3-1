import wollok.game.*
import supertablero.*

class Historia {
  method position() = game.at(0, 0)
  method image()
  method ejecutar() {
    game.addVisual(self)
  }

}

object inicio inherits Historia {
  var orden = 0
  var ejecutandoInicio = true // xq el game.clear no funciona, por lo que no podemos borrar la ejecucion de 
  
  override method image() = ("0" + orden.toString()) + "-intro.png"
  
  override method ejecutar() {
    super()
    keyboard.enter().onPressDo({if (ejecutandoInicio) self.cambiar()})
  }
  
  method seguirMostrando() = orden < 6
  
  method cambiar() {
  if (self.seguirMostrando()) {
      orden += 1
    } else {
      ejecutandoInicio = false
      superTablero.inicioDeJuego()
    }
  }

} 

object pantallaFinal inherits Historia{
  var orden = 1
  override method image() = "0" + orden.toString()  + "-fin.png"
  var finDeJuego = null // = finDeJuegoSinTiempo o finDeJuegoGano

  method seguirMostrando() = orden < finDeJuego.limiteDeMuestra()

  method cambiar() {
    if(orden == 1){ // primera slide
      orden = finDeJuego.ordenInicial()
    }else{
        if (self.seguirMostrando()) {
        orden += 1        
      } else {
        console.println(finDeJuego.mensaje())
        game.stop()
      }
    }
  }

  method finDeJuego(final){
    finDeJuego = final
  }

  override method ejecutar() {
    super()
    keyboard.enter().onPressDo({ self.cambiar() })
  }

}

//Leo
object finDeJuegoNoAgarro inherits Historia {
  override method image() = "00-fin.png"
  
  override method ejecutar() {
    super()
    console.println("Fin del juego sin recoger objeto.")
    game.stop()
  }
} 



//Deby
object finDeJuegoSinTiempo{
  method ordenInicial() = 2
  const property mensaje = "Fin del juego sin Tiempo."
  method limiteDeMuestra() = 2
} 

//Pablo y Ami
object finDeJuegoGano{
  const property mensaje = "Fin del juego GANASTE."
  method ordenInicial() = 3
  method limiteDeMuestra() = 4
} 
