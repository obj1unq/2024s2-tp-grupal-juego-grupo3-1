import elementosDelMapa.*
import obstaculoInteractivo.*
import wollok.game.*
import supertablero.*
import superMapa.*
import reloj.*
import auto.*
import posiciones.*

object mapa4 inherits SuperMapa{
  // cada mapa le tiene que decir al auto donde tiene que arrancar
  override method posicionAuto() = game.at(1,0)
  override method imagenAuto() = arriba.image()
  override method obstaculo() = viejita 


  override method mapa() {
    return 
      [ [__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __], 
        [__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __], 
        [__, __, __, v1, v1, v1, v1, v1, __, __, v1, v1, v1, v1, v1, v1, v1, v1, v1, v1], 
        [a1, __, __, v1, c1, c1, c1, v1, a1, __, v1, c1, c1, c1, c1, v1, o4, c1, c1, v1], 
        [__, __, __, v1, c1, v1, c1, v1, __, __, v1, c1, v1, v1, c1, v1, c1, v1, c1, v1], 
        [__, h3, __, v1, c1, v1, c1, v1, v1, __, v1, c1, pp, c1, c1, c1, c1, c1, c1, tr], 
        [v1, v1, v1, c1, c1, v1, c1, c1, v1, v1, v1, c1, v1, v1, v1, v1, v1, v1, v1, v1], 
        [v1, c1, c1, c1, v1, v1, v1, c1, c1, c1, c1, c1, c1, v1, v1, v1, v1, v1, v1, v1], 
        [v1, c1, v1, v1, __, __, v1, c1, v1, v1, v1, v1, c1, c1, c1, c1, c1, c1, c1, tr], 
        [v1, c1, v1, __, h1, __, v1, c1, v1, v1, v1, v1, c1, v1, v1, v1, v1, v1, v1, v1], 
        [v1, c1, v1, __, __, __, v1, c1, c1, cp, c1, c1, c1, c1, c1, o4, c1, v1, __, __], 
        [v1, c1, v1, __, h1, __, v1, v1, v1, v1, td, v1, v1, v1, v1, v1, td, v1, a1, __]
      ].reverse()v1
  }
  
}


object recorridoDeViejita inherits Recorrido{
  override method ida(){ 
        return  [game.at(3,3), game.at(3,4), game.at(4,5)] 
}
}



object viejita inherits ObstaculoInteractivo(position = game.at(3,4), image = "viejita.png",miRecorrido = recorridoDeViejita){
  
  override method casitigoPorAtraparlo(){
    
    game.say(self, " ME CHOCASTE!! SABANDIJA / 10 seg menos ")
    reloj.descontarTiempo(15) 
  }

  override method atrapoAuto(){
    return game.colliders(self).contains(auto)
  }
}