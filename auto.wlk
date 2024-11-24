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
  method haySolido(_position) = game.getObjectsIn(_position).any({ cosa => cosa.solida() })
  
  method validarAtravesables(_position) {
    if (self.haySolido(_position)) superTablero.error("No puedo ir ahí")
  }
  
  method agarrarObjeto() {
    if (self.hayAlgo()){
      const cosa = game.colliders(self).find({ c => c.esAgarrable() })
      superTablero.agregarARecogidos(cosa)
      cosa.esAgarrada()
    }
  }

  method hayAlgo() = game.colliders(self).any(
    { objeto => objeto.esAgarrable() }
  )

  method dibujar(posicion, direccion){
    position = posicion
    game.addVisual(self)
    self.cambiarImagen(direccion)
  }
}

object ganeJuego {
  const property position = game.at(0, 0)
  const property image = "ganeJuego.png"
}

  
  // method verSiGane(){
  //   if (self.recogiTodosLosObjetos()){
  //     game.addVisual(ganeJuego)
  //     game.stop()
  //   }
  // }
  // method recogiTodosLosObjetos(){
  //   return objetosARecoger.all({objeto => objeto.recogido()})
  // }