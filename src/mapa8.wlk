import wollok.game.*
import caminos.*
import supertablero.*
import superMapa.*

object mapa8 inherits SuperMapa{
  // cada mapa le tiene que decir al auto donde tiene que arrancar
  override method posicionAuto() = game.at(3, 1)
  override method mapa() {
    return 
      [ 
        [__, __, __, __, __, __, __, __, __, __],
        [__, __, __, __, __, __, __, __, __, __],
        [__, __, __, __, __, __, __, __, __, __],
        [__, __, __, __, __, __, __, __, __, __],
        [__, __, __, __, __, __, __, __, __, __],
        [__, __, __, __, __, __, __, __, __, __],
        [__, __, __, __, __, __, __, __, __, __],
        [__, __, __, __, __, __, __, __, __, __],
        [__, __, __, __, __, __, __, __, __, __],
        [__, __, __, __, __, __, __, __, __, __]
      ].reverse()
  }
  
}