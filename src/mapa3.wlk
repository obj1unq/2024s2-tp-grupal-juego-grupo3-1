import supertablero.*
import wollok.game.*
import superMapa.*
import posiciones.*

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


