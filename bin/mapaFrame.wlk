import wollok.game.*
import posiciones.*
import supertablero.*
import superMapa.*

object barraSuperior inherits SuperMapa{
  override method posicionAuto() = game.at(0,0)
  override method imagenAuto() = arriba.image()

  override method mapa (){
   return 
     [  
        [__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __],
        [__, fr, __, __, f4, __, f3, __, f2, __, f1, __, fa, __, fm, __, fy, __, ft, __],
        [__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __],
        [__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __],
        [__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __],
        [__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __],
        [__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __],
        [__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __],
        [__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __],
        [__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __],
        [__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __],
        [__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __]
      ].reverse()
  }

  

}
