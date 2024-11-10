import wollok.game.*
import caminos.*
import supertablero.*
import superMapa.*

object mapa7 inherits SuperMapa{
  // cada mapa le tiene que decir al auto donde tiene que arrancar
  override method posicionAuto() = game.at(3, 1)
  override method mapa() {
    return 
      [ 
        [__, __, __, __, __, __, __, __, __, __],
        [v1, v1, v1, v1, v1, v1, v1, v1, v1, __],
        [c5, c5, c5, __, c5, c5, c5, c5, v1, __],
        [v1, v1, v1, c6, v1, v1, v1, v1, v1, __],
        [__, __, __, c6, __, __, __, __, __, __],
        [__, __, __, __, __, __, __, __, __, __],
        [__, __, __, __, __, __, __, __, __, __],
        [__, __, __, __, __, __, __, __, __, __],
        [__, __, __, __, __, __, __, __, __, __],
        [__, __, __, __, __, __, __, __, __, __]
      ].reverse()
  }
  
}