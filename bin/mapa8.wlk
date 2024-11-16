import supertablero.*
import wollok.game.*
import superMapa.*
import posiciones.*

object mapa8 inherits SuperMapa{
  // cada mapa le tiene que decir al auto donde tiene que arrancar
  override method posicionAuto() = game.at(1,9)
  override method imagenAuto() = abajo.image()


  override method mapa() {
    return 
      [ [__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __],
        [__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __],
        [v1, c1, v1, __, v1, v1, v1, v1, v1, v1, __, __, v1, tu, v1, __, v1, tu, v1, __],
        [v1, c1, v1, __, v1, c1, c1, c1, o2, v1, __, __, v1, c1, v1, __, v1, c1, v1, __],
        [v1, c1, v1, v1, v1, c1, v1, v1, v1, v1, a1, __, v1, c1, v1, __, v1, c1, v1, __],
        [v1, c1, c1, c1, c1, c1, v1, __, __, __, v1, v1, v1, c1, v1, v1, v1, c1, v1, v1],
        [v1, v1, v1, v1, v1, c1, v1, __, h3, __, v1, c1, c1, c1, c1, cv, c1, c1, o3, c1],
        [__, __, __, __, v1, c1, v1, __, __, __, v1, c1, v1, v1, v1, v1, v1, v1, v1, c1],
        [__, h2, __, __, v1, c1, v1, h1, __, __, v1, c1, v1, __, __, __, __, __, v1, c1],
        [v1, v1, v1, v1, v1, c1, v1, v1, v1, v1, v1, c1, v1, v1, v1, v1, v1, v1, v1, c1],
        [tl, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1],
        [v1, v1, v1, v1, v1, td, v1, v1, v1, v1, v1, td, v1, v1, v1, v1, v1, v1, v1, v1]
      ].reverse()
  }
  
}
