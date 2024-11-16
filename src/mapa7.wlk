import obstaculoInteractivo.*
import wollok.game.*
import supertablero.*
import superMapa.*
import reloj.*
import auto.*
import posiciones.*


object mapa7 inherits SuperMapa{
  // cada mapa le tiene que decir al auto donde tiene que arrancar
  override method posicionAuto() = game.at(0,8)
  override method imagenAuto() = derecha.image()
  override method obstaculo() = policia

/*

*/
  override method mapa() {
    return 
      [ [__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __],
        [__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __],
        [v1, v1, v1, v1, v1, v1, v1, v1, v1, v1, v1, v1, v1, v1, v1, __, __, __, __, __],
        [c1, c1, c1, c1, c1, c1, c1, c1, cp, c1, c1, c1, c1, c1, v1, __, a1, __, __, __],
        [v1, v1, c1, v1, v1, v1, v1, v1, v1, v1, v1, v1, v1, c1, v1, __, __, __, h1, __],
        [__, v1, c1, v1, __, __, __, __, __, __, __, __, v1, c1, v1, __, __, __, __, __],
        [__, v1, c1, v1, __, __, __, __, __, __, __, __, v1, c1, v1, v1, v1, v1, v1, v1],
        [__, v1, c1, v1, h1, __, __, __, __, __, __, __, v1, c1, c1, c1, c1, c1, c1, tr],
        [__, v1, o2, v1, __, __, __, __, h2, __, a1, __, v1, c1, v1, v1, v1, v1, v1, v1],
        [v1, v1, pp, v1, v1, v1, v1, v1, v1, v1, v1, v1, v1, c1, v1, __, __, __, __, __],
        [tl, c1, c1, c1, cp, c1, cm, c1, c1, c1, c1, c1, c1, c1, v1, __, __, a1, __, __],
        [v1, v1, v1, v1, v1, v1, v1, v1, v1, v1, v1, v1, v1, v1, v1, a1, __, __, __, __]
      ].reverse()
  }
  
}




object policia inherits ObstaculoInteractivo(position = game.at(2,3), image = "elPoli.png", miRecorrido = recorridoPoli){
  // comportamiento: el poli va a hacer un camino de ida y vuelta, si el policia y el auto colisionan, 
  //se reduce el tiempo 10 segundos (a chequear cuanto segundos).
  // y manda al auto a la posicion inicial del mapa
  
  override method casitigoPorAtraparlo(){
    game.say(self, " TE ATRAPÉ!! ")
    reloj.descontarTiempo(10) //reveer
    auto.position(game.at(0,8)) //lo manda al principio del mapa
  } 

  override method atrapoAuto(){
    return self.elAutoEstaEnMismaPosicion() or self.elAutoEstaAdelante() or self.elAutoEstaAtras() 
  }
  
}



object recorridoPoli inherits Recorrido{
 override method ida(){ 
        return  [ /*calle izquierda*/ game.at(2,3), game.at(2,4), game.at(2,5), game.at(2,6), game.at(2,7), game.at(2,8),
                  /*calle arriba */   game.at(3,8), game.at(4,8), game.at(5,8),  game.at(6,8), game.at(7,8), game.at(8,8), game.at(9,8), game.at(10,8), game.at(11,8), game.at(12,8), game.at(13,8),
                  /*calle derecha */  game.at(13,7), game.at(13,6), game.at(13,5), game.at(13,4), game.at(13,3), game.at(13,2), game.at(13,1),
                  /*calle abajo */    game.at(12,1), game.at(11,1), game.at(10,1), game.at(9,1), game.at(8,1), game.at(7,1), game.at(6,1), game.at(5,1), game.at(4,1), game.at(3,1), game.at(2,1)
                ] 
}


}
