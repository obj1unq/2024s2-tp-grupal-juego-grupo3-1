import wollok.game.*

import supertablero.*
import superMapa.*

object barraSuperior inherits SuperMapa{
  override method posicionAuto() = game.at(0,0)
  override method mapa (){
   return 
    [
      [fr, __, f1, f2, f3, f4, fa, fm, fy, ft],
      [__, __, __, __, __, __, __, __, __, __],
      [__, __, __, __, __, __, __, __, __, __],
      [__, __, __, __, __, __, __, __, __, __],
      [__, __, __, __, __, __, __, __, __, __],
      [__, __, __, __, __, __, __, __, __, __],
      [__, __, __, __, __, __, __, __, __, __],
      [__, __, __, __, __, __, __, __, __, __],
      [__, __, __, __, __, __, __, __, __, __],
      [__, __, __, __, __, __, __, __, __, __]
    ].reverse()
  }

  

}
