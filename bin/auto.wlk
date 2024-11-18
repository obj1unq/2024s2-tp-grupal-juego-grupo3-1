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
    

    // En caso de querer que se cambie el mapa en cuanto toca la flecha poner el metodo dsps del movimiento.
    // self.seTrasladaSiPuede()// en cuanto se mueve, se fija si se puede trasladar,
                            // si puede, en cuanto pisa la flecha se cambia el mapa
    
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
        self.image(direccion.image())
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
    self.validarAgarrar()
    const objeto = game.colliders(self).find({ objeto => objeto.esAgarrable() })
    superTablero.objetosRecogidos().add(objeto) // para poder volver a dibujarlos cuando se cambie de mapa

    objeto.cosaALaBarra() // self.verSiGane()
    
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
  method validarAgarrar() {
    if (not self.hayObjeto()) self.error("No nada para agarrar!")
  }
  
  method hayObjeto() = game.colliders(self).any(
    { objeto => objeto.esAgarrable() }
  )

  method dibujar(posicion, imagen){
    position = posicion
    image = imagen
    game.addVisual(self)
  }
}

object ganeJuego {
  const property position = game.at(0, 0)
  const property image = "ganeJuego.png"
}