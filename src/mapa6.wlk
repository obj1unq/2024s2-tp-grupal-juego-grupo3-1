import supertablero.*
import traslador.*
import wollok.game.*
import superMapa.*
import posiciones.*


object mapa6 inherits SuperMapa{
  // cada mapa le tiene que decir al auto donde tiene que arrancar
  override method posicionAuto() = game.at(10,0)
  override method imagenAuto() = arriba.image()


  override method mapa() {
    return 
      [ [__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __],
        [__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __],
        [v1, tu, v1, __, v1, tu, v1, __, v1, tu, v1, __, __, v1, tu, v1, __, __, __, __],  // a partir de aca 
        [v1, mc, v1, v1, v1, mc, v1, v1, v1, mc, v1, v1, v1, v1, ca, v1, h1, a1, __, __],
        [tl, c1, c1, c1, c1, c1, c1, c1, c1, c1, cp, c1, c1, c1, c1, v1, __, __, h3, a1],
        [v1, v1, v1, c1, v1, c1, v1, v1, v1, v1, c1, v1, v1, v1, c1, v1, __, __, __, __],
        [__, __, v1, c1, v1, cp, v1, __, __, v1, c1, v1, __, v1, c1, v1, h2, a1, a1, __],
        [__, __, v1, c1, v1, c1, v1, h2, __, v1, c1, v1, __, v1, c1, v1, v1, v1, v1, v1],
        [h1, __, v1, c1, c1, c1, v1, __, __, v1, c1, v1, __, v1, c1, c1, c1, cv, c1, tr],
        [v1, v1, v1, pp, v1, v1, v1, __, __, v1, c1, v1, __, v1, v1, v1, v1, v1, v1, v1],
        [tl, c1, c1, c1, v1, __, __, a1, __, v1, c1, v1, __, __, __, __, __, __, __, __],
        [v1, v1, v1, v1, v1, h3, a1, __, __, v1, c1, v1, h1, __, a1, a1, __, h3, a1, a1]
      ].reverse()
  }
  
}