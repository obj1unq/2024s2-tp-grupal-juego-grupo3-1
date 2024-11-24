import wollok.game.*
import inicio.*

object reloj {
  var property segundos = 100
  var property position = null
  
  method text() = if (self.sigueEnTiempo()) segundos.toString() else ""
  
  method textColor() = "FFFF00FF"

  method descontarTiempo(_segundos){
    segundos -= _segundos
  }
  method agregarTiempo(_segundos){
    segundos += _segundos
  }
  
  method sigueEnTiempo(){
    return segundos > 0
  } 

  method seQuedoSinTiempo(){
    return not self.sigueEnTiempo()
  }
  
  method tick() {
    self.validarContinuarJuego()
    
    if (not inicio.seguirMostrando()) {
      segundos = (segundos - 1) % 1000
    }
  }
  
  method validarContinuarJuego() {
    if (not self.sigueEnTiempo()) {
      game.addVisual(finDeJuegoSinTiempo )
      game.stop()
    }
  }
  
  method solida() = false
}

object finDeJuegoNoAgarro {
  const property position = game.at(0,0)
  const property image = "finDelJuego.png"
}

object finDeJuegoSinTiempo {
  const property position = game.at(5,5)
  const property image = "finDelJuego.png"
}

object finDeJuegogGano {
  const property position = game.at(0,0)
  const property image = "ganeJuego.png"
}

