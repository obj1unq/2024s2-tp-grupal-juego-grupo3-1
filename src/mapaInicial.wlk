
import supertablero.*
import wollok.game.*
import superMapa.*
import posiciones.*

object mapaInicial inherits SuperMapa{
  // cada mapa le tiene que decir al auto donde tiene que arrancar
  override method posicionAuto() = game.at(2,2)
  override method imagenAuto() = derecha.image()

  override method mapa() {
    return 
      [ [__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __],
        [__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __],
        [__, __, aa, __, __, v1, tu, v1, __, aa, __, aa, __, aa, __, aa, __, __, __, __],
        [__, __, __, h3, __, v1, c1, v1, v1, v1, v1, v1, v1, v1, v1, v1, v1, v1, v1, v1],
        [__, __, __, __, __, v1, c1, c1, c1, c1, c1, c1, c2, c1, c1, c1, c1, c2, c1, tr],
        [__, __, h1, __, aa, v1, c1, v1, v1, v1, v1, v1, v1, v1, v1, v1, v1, v1, v1, v1],
        [__, __, __, __, __, v1, c1, v1, __, __, __, __, __, __, __, __, __, __, __, __],
        [__, __, a1, a1, __, v1, c1, v1, a1, a1, h2, __, h2, __, aa, a1, __, h3, __, aa],
        [__, __, v1, v1, v1, v1, c1, v1, v1, v1, v1, v1, v1, v1, v1, v1, v1, v1, v1, v1],
        [__, __, c2, c1, c1, c1, c1, c1, c1, c1, c1, c1, c2, c1, c1, c1, c1, c2, c1, tr],
        [__, __, v1, v1, v1, v1, c1, v1, v1, v1, v1, v1, v1, v1, v1, v1, v1, v1, v1, v1],
        [es, __, aa, __, aa, v1, pp, v1, aa, __, aa, __, aa, __, __, __, __, __, __, __]
      ].reverse()
  }
  
}