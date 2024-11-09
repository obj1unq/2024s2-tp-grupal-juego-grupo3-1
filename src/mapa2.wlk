import wollok.game.*
import caminos.*
import supertablero.*
import superMapa.*

object mapa2 inherits SuperMapa{
  // cada mapa le tiene que decir al auto donde tiene que arrancar
  override method posicionAuto() = game.at(3, 1)
  override method mapa() {
    return 
      [ 
        [__, __, __, __, __, __, __, __, __, __],
        [__, __, v1, c6, v1, __, __, __, __, __],
        [v1, v1, v1, c6, v1, v1, v1, v1, v1, v1],
        [tl, c5, c5, cc, c5, c5, mc, c5, c5, tr],
        [v1, v1, v1, c6, v1, v1, v1, v1, v1, v1],
        [__, __, v1, c6, v1, __, __, h3, __, __],
        [h1, __, v1, c6, v1, __, __, __, h3, __],
        [v1, v1, v1, c6, v1, h1, __, __, __, __],
        [c2, c5, c5, c3, v1, __, __, __, __, __],
        [c6, v1, v1, v1, v1, __, __, a1, __, __]
      ].reverse()
  }
  
}