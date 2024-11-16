
import supertablero.*
import wollok.game.*
import superMapa.*
import posiciones.*

object mapa2 inherits SuperMapa{
  // cada mapa le tiene que decir al auto donde tiene que arrancar
  override method posicionAuto() = game.at(19,8)
  override method imagenAuto() = izquierda.image()

  override method mapa() {
    return 
      [ [__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __],
        [__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __],
        [__, __, __, __, __, __, __, __, __, aa, v1, cv, v1, v1, v1, v1, v1, v1, v1, v1],
        [v1, v1, v1, v1, v1, v1, v1, v1, v1, v1, v1, c1, c1, c1, c1, c1, c1, c1, c1, c1],
        [tl, o3, c1, c1, cy, c1, c1, c1, c1, c1, c1, c1, v1, v1, v1, v1, v1, v1, v1, v1],
        [v1, v1, v1, c1, v1, v1, v1, v1, v1, v1, v1, c1, v1, aa, __, __, __, __, __, aa],
        [__, aa, v1, c1, v1, __, __, __, __, aa, v1, c1, v1, __, __, __, __, __, __, __],
        [__, __, v1, c1, v1, h2, __, h1, __, __, v1, c1, v1, h1, __, __, a1, a1, a1, __],
        [a1, __, v1, c1, v1, __, __, __, __, __, v1, c1, v1, v1, v1, v1, v1, v1, __, __],
        [__, __, v1, o4, v1, a1, a1, __, __, __, v1, c1, o2, c1, c1, c1, c1, v1, h2, __],
        [a1, __, v1, c1, v1, __, __, a1, a1, __, v1, v1, v1, v1, v1, v1, c1, v1, __, __],
        [__, __, v1, td, v1, h3, aa, __, __, __, aa, __, aa, __, __, v1, cv, v1, h3, __]
      ].reverse()
  }
  
}