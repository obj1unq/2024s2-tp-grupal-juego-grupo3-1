import posiciones.*
import supertablero.*
import wollok.game.*
import superMapa.*
import obstaculoInteractivo.*
import auto.*
import reloj.*

object mapaPrueba inherits SuperMapa{
  override method posicionAuto() = game.at(0,0)
  override method imagenAuto() = arriba.image()

  override method mapa(){
    return 
     [  [__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __],
        [__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __],
        [__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __],
        [__, __, __, __, __, v1, v1, v1, v1, v1, v1, v1, v1, v1, v1, v1, __, __, __, __],
        [__, __, __, h2, __, v1, c1, c1, o4, c1, mc, c1, c1, cm, c1, v1, __, __, __, __],
        [__, h1, __, __, __, v1, c1, v1, v1, v1, v1, v1, v1, v1, c1, v1, a1, a1, __, __],
        [__, __, __, a1, __, v1, c1, v1, __, __, __, __, __, v1, c1, v1, __, __, __, __],
        [__, __, __, __, __, v1, ct, v1, __, __, __, __, __, v1, cp, v1, __, __, a1, __],
        [v1, v1, v1, v1, v1, v1, c1, v1, __, __, __, h1, __, v1, c1, v1, v1, v1, v1, v1],
        [c1, c1, cm, o2, c1, cy, c1, v1, __, __, __, __, a1, v1, o3, v1, c1, cv, c1, c1],
        [c1, v1, v1, v1, v1, v1, v1, v1, __, h3, __, __, __, v1, c1, v1, pp, v1, v1, v1],
        [c1, v1, __, __, __, __, __, __, __, __, __, h2, __, v1, o4, c1, c1, v1, h1, __]
      ].reverse()
  }
  
}

object mapaInicial inherits SuperMapa{
  override method posicionAuto() = game.at(2,2)
  override method imagenAuto() = derecha.image()

  override method mapa() {
    return 
      [ [__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __],
        [__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __],
        [__, __, aa, __, __, v1, tu, v1, __, aa, __, __, v1, tu, v1, aa, __, __, aa, aa],
        [__, __, __, h3, __, v1, c1, v1, v1, v1, v1, v1, v1, c1, v1, v1, v1, v1, v1, v1],
        [__, __, __, __, __, v1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, o3, c1, c1, tr],
        [__, __, h1, __, aa, v1, c1, v1, v1, v1, v1, v1, v1, c1, v1, v1, v1, v1, v1, v1],
        [__, __, __, __, __, v1, c1, v1, __, __, __, __, v1, c1, v1, __, __, __, __, __],
        [__, __, a1, a1, __, v1, c1, v1, a1, a1, __, aa, v1, c1, v1, h1, __, h2, __, a1],
        [__, __, v1, v1, v1, v1, c1, v1, __, __, __, __, v1, cy, v1, __, __, __, __, __],
        [__, __, c2, c1, c1, c1, c1, v1, h2, __, h3, __, v1, c1, v1, a1, a1, __, h3, __],
        [__, __, v1, v1, v1, v1, c1, v1, __, __, __, __, v1, c1, v1, __, __, __, __, __],
        [es, __, aa, __, aa, v1, pp, v1, h1, __, a1, __, v1, td, v1, h2, __, __, a1, a1]
      ].reverse()
  }
}

object mapaFinal inherits SuperMapa{
  override method posicionAuto() = game.at(19,7)
  override method imagenAuto() = izquierda.image()

  override method mapa() {
    return 
      [ [__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __],
        [__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __],
        [__, __, aa, __, __, v1, c2, v1, __, aa, __, __, v1, c2, v1, aa, __, __, aa, aa],
        [__, __, __, h3, __, v1, c1, v1, v1, v1, v1, v1, v1, c1, v1, v1, v1, v1, v1, v1],
        [__, __, __, __, __, v1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1],
        [__, __, h1, __, aa, v1, c1, v1, v1, v1, v1, v1, v1, c1, v1, v1, v1, v1, v1, v1],
        [__, __, __, __, __, v1, c1, v1, __, __, __, __, v1, c1, v1, __, __, __, __, __],
        [__, __, a1, a1, __, v1, c1, v1, a1, a1, __, aa, v1, c1, v1, h1, __, h2, __, a1],
        [__, __, v1, v1, v1, v1, c1, v1, __, __, __, __, v1, c1, v1, __, __, __, __, __],
        [__, __, c3, c1, c1, c1, c1, v1, h2, __, h3, __, v1, o5, v1, a1, a1, __, h3, __],
        [__, __, v1, v1, v1, v1, c1, v1, __, __, __, __, v1, c1, v1, __, __, __, __, __],
        [es, __, aa, __, aa, v1, pp, v1, h1, __, a1, __, v1, c2, v1, h2, __, __, a1, a1]
      ].reverse()
  }
}

//Gonza: ELEGIR UNO PARA CONSERVAR!

object mapa3 inherits SuperMapa{
  // cada mapa le tiene que decir al auto donde tiene que arrancar
  override method posicionAuto() = game.at(0,8)
  override method imagenAuto() = derecha.image()


  override method mapa() {
    return 
      [ [__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __],
        [__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __],
        [v1, v1, v1, __, __, __, __, __, __, __, __, __, __, __, __, __, __, v1, v1, v1],
        [c1, c1, v1, __, __, v1, v1, v1, v1, v1, __, __, h3, __, v1, v1, v1, o4, c1, tr],
        [v1, c1, v1, h3, __, v1, c1, c1, ct, v1, __, __, __, __, v1, c1, c1, c1, v1, v1], 
        [v1, c1, v1, __, __, v1, c1, v1, c1, v1, a1, a1, __, __, v1, c1, v1, v1, __, __],
        [v1, c1, v1, a1, __, v1, c1, v1, c1, v1, v1, v1, v1, v1, v1, c1, v1, __, h2, __],
        [v1, c1, v1, v1, v1, v1, c1, v1, c1, c1, c1, c1, c1, c1, c1, c1, v1, __, __, __],
        [tl, c1, c1, c1, c1, c1, c1, cp, c1, v1, c1, v1, v1, v1, v1, c1, v1, h2, __, __],
        [v1, v1, v1, v1, v1, v1, v1, c1, v1, v1, c1, v1, __, __, v1, c1, v1, v1, v1, v1],
        [__, __, __, __, __, __, v1, c1, c1, c1, c1, v1, __, __, v1, c1, c1, c1, c1, tr],
        [h2, __, a1, __, h1, __, v1, v1, v1, v1, v1, v1, __, __, v1, v1, v1, v1, v1, v1]
      ].reverse()
  }
  
}


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



object viejita inherits ObstaculoInteractivo(image = "viejita.png", miRecorrido = recorridoDeViejita){
  
  override method casitigoPorAtraparlo(){
    
    game.say(self, " ME CHOCASTE!! SABANDIJA / 10 seg menos ")
    reloj.descontarTiempo(15) 
  }

  override method atrapoAuto(){
    return game.colliders(self).contains(auto)
  }
}

//Azu
object mapa5 inherits SuperMapa{
  // cada mapa le tiene que decir al auto donde tiene que arrancar
  override method posicionAuto() = game.at(0,3)
  override method imagenAuto() = derecha.image()
  override method obstaculo() = bondi



  override method mapa() {
    return 
      [ [__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __],
        [__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __],
        [__, aa, v1, tu, v1, aa, __, __, aa, aa, v1, tu, v1, __, aa, aa, __, __, __, aa],  
        [__, __, v1, c1, v1, __, __, v1, v1, v1, v1, c1, v1, v1, v1, v1, v1, v1, v1, v1],
        [a1, __, v1, mc, v1, a1, __, v1, c1, c1, c1, c1, c1, c1, c1, c1, c1, pp, c1, tr],
        [__, __, v1, c1, v1, __, __, v1, c1, v1, v1, v1, v1, v1, v1, c1, v1, v1, v1, v1],
        [h1, __, v1, c1, v1, h3, __, v1, c1, v1, aa, aa, aa, aa, v1, c1, v1, aa, aa, aa],
        [v1, v1, v1, c1, v1, v1, v1, v1, c1, v1, v1, v1, v1, v1, v1, c1, v1, v1, v1, v1],
        [c1, c1, c1, c1, c1, c1, c1, c1, cp, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, tr],
        [v1, v1, v1, cv, v1, v1, v1, v1, v1, v1, v1, v1, v1, v1, v1, c1, v1, v1, v1, v1],
        [__, __, v1, c1, v1, __, __, __, __, __, __, __, __, __, v1, c1, c1, ca, c1, tr],
        [h2, __, v1, td, v1, a1, __, aa, h1, __, h2, __, h1, __, v1, v1, v1, v1, v1, v1]
      ].reverse()
  }
  
}

object recorridoBondi inherits Recorrido{

  // No quiero que vuelva en reversa o, si vuelve en reversa habria que girar la imagen!
  override method camino() = self.ida()
  override method ida(){ 
        return  [game.at(2,3) , game.at(3,3) , game.at(4,3) ,
                 game.at(5,3) , game.at(6,3) , game.at(7,3) ,
                 game.at(8,3) , game.at(9,3) , game.at(10,3),
                 game.at(11,3), game.at(12,3), game.at(13,3),
                 game.at(14,3), game.at(15,3), game.at(16,3),
                 game.at(17,3), game.at(18,3), game.at(19,3)] 
}
}

object bondi inherits ObstaculoInteractivo(image = "324-.png",miRecorrido = recorridoBondi){
  
  override method casitigoPorAtraparlo(){
    
    game.say(self, "En el fondo hay lugar! Un pasito para atras asi nos vamos!")
    reloj.descontarTiempo(5) 
  }

  override method atrapoAuto(){
    return game.colliders(self).contains(auto)
  }
}

//Rena

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


object policia inherits ObstaculoInteractivo(miRecorrido = recorridoPoli, image = "elPoli.png"){
  // comportamiento: el poli va a hacer un camino de ida y vuelta, si el policia y el auto colisionan, 
  //se reduce el tiempo 10 segundos (a chequear cuanto segundos).
  // y manda al auto a la posicion inicial del mapa
  
  override method casitigoPorAtraparlo(){
    game.say(self, " TE ATRAPÉ!! ")
    reloj.descontarTiempo(10) //reveer
    auto.position(mapa7.posicionAuto()) //lo manda al principio del mapa
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


