import supertablero.*
import wollok.game.*
import historia.*

object reloj {
  var property segundos = 200
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
      game.removeTickEvent("reloj")//termino el onTick()
      superTablero.desactivarObstaculo()
      pantallaFinal.finDeJuego(finDeJuegoSinTiempo)
      pantallaFinal.ejecutar()
    }
  }
  
  method solida() = false
}

