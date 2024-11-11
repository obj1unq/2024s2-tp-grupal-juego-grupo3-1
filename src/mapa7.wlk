import wollok.game.*
import caminos.*
import supertablero.*
import superMapa.*
import elementos.*
import reloj.*
import auto.*

object mapa7 inherits SuperMapa{
  // cada mapa le tiene que decir al auto donde tiene que arrancar
  override method posicionAuto() = game.at(0,7)
  override method imagenAuto() = "autoHaciaDerecha.png"
  
  override method obstaculo() = policia

  override method mapa() {
    return 
      [ 
        [__, __, __, __, __, __, __, __, __, __],
        [v1, v1, v1, v1, v1, v1, v1, v1, v1, v1],
        [c5, c5, cc, c5, c5, c5, c5, c5, c5, cc],
        [v1, v1, c6, v1, v1, v1, v1, v1, v1, c6],
        [__, v1, c6, v1, __, __, __, __, v1, c6],
        [__, v1, c6, v1, h1, __, __, __, v1, c6],
        [__, v1, ct, v1, __, __, h2, __, v1, c6],
        [v1, v1, pp, v1, v1, v1, v1, v1, v1, c6],
        [tl, c5, cc, c5, c5, c5, c5, c5, c5, cc],
        [v1, v1, v1, v1, v1, v1, v1, v1, v1, v1]

      ].reverse()
  }

  
}


object policia inherits Elemento(position = game.at(2,3)){
  // comportamiento: el poli va a hacer un camino de ida y vuelta, si el policia y el auto colisionan, 
  //se reduce el tiempo 10 segundos (a chequear cuanto segundos).
  // y manda al auto a la posicion inicial del mapa
  override method image() = "bizcochitos_.png"
  override method solida() = false
  override method esAgarrable() = false 
  override method esTraslador() = false 

  
  var property recorrido = new Recorrido()

  method caminar(){
    self.verSiAtrapoAuto()

    self.crearNuevoRecorridoSiLlegueAlfin() //cambiar de un poli a otro
    
    self.siguientePosicion()
  }

  method siguientePosicion(){
    position = recorrido.siguientePosicion()

    recorrido.borrarPosicion(position)
  }

  method inicializar(){
    game.addVisual(self)
    game.onTick(500, "poli", {self.caminar()})
  }

  method verSiAtrapoAuto(){
    if(self.atrapoAuto()){
      game.say(self, " TE ATRAPÉ!! ")
      reloj.descontarTiempo(10) //reveer
      auto.position(game.at(0,7)) //lo manda al principio del mapa
    }
  }

  method crearNuevoRecorridoSiLlegueAlfin(){
    if (recorrido.seTerminoElCamino()){ //
      recorrido = new Recorrido()
    }
  }

  method atrapoAuto(){
    return game.colliders(self).contains(auto)
  }
  
}


class Recorrido{
  const property ida = [ /*calle izquierda*/ game.at(2,3), game.at(2,4), game.at(2,5), game.at(2,6), game.at(2,7),
                          /*calle arriba*/ game.at(3,7), game.at(4,7), game.at(5,7),  game.at(6,7), game.at(7,7), game.at(8,7), game.at(9,7), 
                          /*calle derecha*/  game.at(9,6), game.at(9,5), game.at(9,4), game.at(9,3), game.at(9,2), game.at(9,1),
                          /*calle abajo*/ game.at(8,1), game.at(7,1), game.at(6,1),game.at(5,1), game.at(4,1), game.at(3,1)
                        ] 
  const property vuelta = ida.reverse() 

  var property camino = ida + vuelta

  method seTerminoElCamino(){
    return camino.isEmpty()
  }

  method borrarPosicion(position){
    camino.remove(position)
  }

  method siguientePosicion(){
    return camino.first()
  }
}