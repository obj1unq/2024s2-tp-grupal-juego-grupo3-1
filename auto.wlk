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

  method finalizaJuegoSiLlegoAMeta(){
    if(self.estaEnMeta()){
        superTablero.finalSiGanaste()
    }
  }

  method estaEnMeta(){
    return game.colliders(self).any({elem => elem.esMeta()})
  }

  method cambiarImagen(direccion){
    image = "autoHacia" + direccion.orientacion() + ".png"
  }

  method tocarBocina(){
    game.sound("bocina2.mp3").play()
  }

  method seTrasladaSiPuede(){
    if (superTablero.sePuedeTrasladarElAuto()){
       superTablero.cambiarMapa()
    }
  }
  method moverSiPuede(direccion, nuevaDireccion){
    if(self.sePuedeMover(nuevaDireccion) ){
        self.position(nuevaDireccion)
        self.cambiarImagen(direccion)
    }
  }
  method sePuedeMover(nuevaDireccion) {
    return superTablero.estaDentroDeLosLimites(nuevaDireccion)  and 
    not self.haySolido(nuevaDireccion) and reloj.sigueEnTiempo()
  }
  method haySolido(_position) = superTablero.haySolidoEn(_position)
 
  
  method agarrarObjeto() {
    if (self.hayAlgoAgarrable()){
      const cosa = self.objetoColisionadoAgarrable()
      superTablero.agregarARecogidos(cosa)
      cosa.esAgarrada()
    }
  }

  method objetosColisionados(){
    return game.colliders(self)
  }

  method objetoColisionadoAgarrable(){
    return self.objetosColisionados().find({ c => c.esAgarrable() })
  }

  method hayAlgoAgarrable() = self.objetosColisionados().any({ objeto => objeto.esAgarrable() })



  method dibujar(posicion, direccion){
    position = posicion
    game.addVisual(self)
    self.cambiarImagen(direccion)
  }
}


