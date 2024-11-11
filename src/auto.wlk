import wollok.game.*
import supertablero.*

import reloj.*
import posiciones.*


object auto {
  var property position = null
  var property image = null
  
  // const objetosARecoger = [termo, yerba, bizcochitos, dispenser, agua, manzanita, mate]
  method mover(direccion) {
    const nuevaDireccion = direccion.siguiente(position)

    //superTablero.validarMovimiento(nuevaDireccion)
    if (self.sePuedeMover(nuevaDireccion)){
        // self.validarAtravesables(nuevaDireccion)
        // reloj.validarContinuarJuego()

        self.trasladarOMover(nuevaDireccion, direccion)
    }
  }


  method sePuedeMover(nuevaDireccion) {
    return superTablero.estaDentroDeLosLimites(nuevaDireccion)  and 
    not self.haySolido(nuevaDireccion) and reloj.sigueEnTiempo()
  }

  method trasladarOMover(nuevaDireccion, direccion) {
    if (superTablero.sePuedeTrasladarElAuto()){
       superTablero.cambiarMapa()
    }
    else {
         self.position(nuevaDireccion)
         self.image(direccion.image())
    }
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