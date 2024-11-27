import wollok.game.*
import supertablero.*
import reloj.*
import posiciones.*

object auto {
  var property position = null
  var property image = null
  
  method mover(direccion) {
    const nuevaDireccion = direccion.siguiente(position)
    
    self.seTrasladaSiPuede()
    self.moverSiPuede(direccion, nuevaDireccion)
    self.finalizaJuegoSiLlegoAMeta()
  }
  
  method finalizaJuegoSiLlegoAMeta() {
    if (self.estaEnMeta()) superTablero.finalSiGanaste()
  }
  
  method estaEnPosicion(posicion) = position == posicion
  
  method estaEnMeta() = superTablero.hayMetaEnPosicionDelAuto()
  
  method cambiarImagen(direccion) {
    image = ("autoHacia" + direccion.orientacion()) + ".png"
  }
  
  method tocarBocina() {
    game.sound("bocina2.mp3").play()
  }
  
  method seTrasladaSiPuede() {
    if (superTablero.sePuedeTrasladarElAuto()) superTablero.cambiarMapa()
  }
  
  method moverSiPuede(direccion, nuevaDireccion) {
    if (self.sePuedeMover(nuevaDireccion)) {
      self.position(nuevaDireccion)
      self.cambiarImagen(direccion)
    }
  }
  
  method sePuedeMover(nuevaDireccion) = (superTablero.estaDentroDeLosLimites(
    nuevaDireccion
  ) and (not superTablero.haySolidoEn(
    nuevaDireccion
  ))) and reloj.sigueEnTiempo()
  
  method agarrarObjeto() {
    if (superTablero.hayAlgoAgarrableCon(self)) {
      const cosa = self.objetoColisionadoAgarrable()
      superTablero.agregarARecogidos(cosa)
      cosa.esAgarrada()
    }
  }
  
  method objetoColisionadoAgarrable() = superTablero.cosasCon(self).find(
    { cosa => cosa.esAgarrable() }
  )
  
  method dibujar(posicion, direccion) {
    position = posicion
    self.cambiarImagen(direccion)
    game.addVisual(self)
  }
}
