import wollok.game.*
import inicio.*

object reloj {
  var property segundos = 100
  var property position = null
  
  method text() = if (self.sigueEnTiempo()) segundos.toString() else ""
  
  method textColor() = "FFFF00FF"

  method descontarTiempo(segs){
    segundos -= segs
  }
  
  method sigueEnTiempo(){
    return segundos > 0
 } 
  method tick() {
    self.validarContinuarJuego()
    
    if (not inicio.estado().seguirMostrando()) {
      segundos = (segundos - 1) % 1000
    }
  }
  
  method validarContinuarJuego() {
    if (not self.sigueEnTiempo()) {
      game.addVisual(finDeJuego)
      game.stop()
    }
  }
  
  method solida() = false
}

object finDeJuego {
  var property position = game.at(0, 0)
  var property image = "finDelJuego.png"
}