import wollok.game.*
import supertablero.*
import superMapa.*
import posiciones.*


object mapaPrueba inherits SuperMapa{
  override method posicionAuto() = game.at(0,0)
  override method imagenAuto() = arriba.image()

  override method mapa(){
    return 
     [  [__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __],
        [__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __],
        [__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __],
        [__, __, __, __, __, v1, v1, v1, v1, v1, v1, v1, v1, v1, v1, v1, __, __, __, __],
        [__, __, __, h2, __, v1, c1, c1, o4, c1, mc, c1, c1, cm, c1, v1, __, __, __, __],
        [__, h1, __, __, __, v1, c1, v1, v1, v1, v1, v1, v1, v1, c1, v1, a1, a1, __, __],
        [__, __, __, a1, __, v1, c1, v1, __, __, __, __, __, v1, c1, v1, __, __, __, __],
        [__, __, __, __, __, v1, ct, v1, __, __, __, __, __, v1, cp, v1, __, __, a1, __],
        [v1, v1, v1, v1, v1, v1, c1, v1, __, __, __, h1, __, v1, c1, v1, v1, v1, v1, v1],
        [c1, c1, cm, o2, c1, cy, c1, v1, __, __, __, __, a1, v1, o3, v1, c1, cv, c1, c1],
        [c1, v1, v1, v1, v1, v1, v1, v1, __, h3, __, __, __, v1, c1, v1, pp, v1, v1, v1],
        [c1, v1, __, __, __, __, __, __, __, __, __, h2, __, v1, o4, c1, c1, v1, h1, __]
      ].reverse()
  }
  
}