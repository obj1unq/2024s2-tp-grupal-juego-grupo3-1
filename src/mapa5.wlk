import supertablero.*
import supertablero.*
import supertablero.*
import wollok.game.*
import superMapa.*
import posiciones.*

object mapa5 inherits SuperMapa{
  // cada mapa le tiene que decir al auto donde tiene que arrancar
  override method posicionAuto() = game.at(0,4)
  override method imagenAuto() = derecha.image()


  override method mapa() {
    return 
      [ [__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __],
        [__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __],
        [__, __, v1, tu, v1, __, __, __, __, __, v1, tu, v1, __, __, __, __, __, __, __],  
        [__, __, v1, c1, v1, a1, __, v1, v1, v1, v1, c1, v1, v1, v1, v1, v1, v1, v1, v1],
        [__, __, v1, mc, v1, __, __, v1, c1, c1, c1, c1, c1, c1, c1, c1, c1, pp, c1, tr],
        [h1, __, v1, c1, v1, h3, __, v1, c1, v1, v1, v1, v1, v1, v1, c1, v1, v1, v1, v1],
        [v1, v1, v1, c1, v1, v1, v1, v1, c1, v1, __, __, __, __, v1, c1, v1, __, __, __],
        [c1, c1, c1, c1, c1, c1, c1, c1, cp, v1, __, __, a1, __, v1, c1, v1, __, __, __],
        [v1, v1, v1, c1, v1, v1, v1, v1, v1, v1, a1, __, __, __, v1, ca, v1, h3, a1, __],
        [__, __, v1, cv, v1, __, __, __, __, __, __, __, h1, __, v1, c1, v1, v1, v1, v1],
        [__, __, v1, c1, v1, __, a1, __, __, __, h2, __, __, __, v1, c1, c1, c1, c1, tr],
        [h2, __, v1, td, v1, a1, __, __, h1, __, __, __, h1, __, v1, v1, v1, v1, v1, v1]
      ].reverse()
  }
  
}

