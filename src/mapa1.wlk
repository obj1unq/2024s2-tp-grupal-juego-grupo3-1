import posiciones.*
import supertablero.*
import wollok.game.*
import superMapa.*

object mapa1 inherits SuperMapa{
  // cada mapa le tiene que decir al auto donde tiene que arrancar
  override method posicionAuto() = game.at(18,5)
  override method imagenAuto() = izquierda.image()

  override method mapa() {
    return 
      [ [__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __],
        [__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __],
        [__, __, __, __, __, aa, v1, tu, v1, aa, __, __, __, __, __, __, __, __, __, __],
        [aa, __, __, __, __, __, v1, c1, v1, __, __, __, __, __, __, __, __, __, __, aa],
        [__, a1, a1, __, h3, __, v1, c1, v1, a1, a1, __, h1, __, h2, __, a1, h2, __, __],
        [v1, v1, v1, v1, v1, v1, v1, c1, v1, v1, v1, v1, v1, v1, v1, v1, v1, v1, v1, v1],
        [pp, c1, c1, c1, c1, c2, c1, c1, c1, c1, c1, c1, mc, c1, c2, c1, c1, c1, c1, c1],
        [v1, v1, v1, v1, v1, v1, v1, c1, v1, v1, v1, v1, v1, v1, v1, v1, v1, v1, v1, v1],
        [__, __, __, __, __, __, v1, c1, v1, __, __, __, __, __, __, __, __, __, __, aa],
        [a1, a1, h1, __, a1, __, v1, mc, v1, h1, __, a1, a1, __, h2, __, h3, __, a1, __],
        [__, __, __, __, __, aa, v1, c1, v1, v1, v1, v1, v1, v1, v1, v1, v1, v1, v1, v1],
        [__, aa, __, h2, __, __, v1, c1, c1, c1, c1, c1, c1, c1, c2, c1, c1, c1, c1, tr]
      ].reverse()
  }
  
}
