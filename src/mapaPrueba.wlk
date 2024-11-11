import wollok.game.*
import supertablero.*
import superMapa.*

object mapa1 inherits SuperMapa{
  override method posicionAuto() = game.at(0,0)
  override method imagenAuto() = "autoHaciaArriba.png"

  override method mapa(){
    return 
    [
      [__, __, __, __, __, __, __, __, __, __],
      [__, __, v1, tu, v1, __, __, __, __, __],
      [h1, __, v1, c6, v1, __, h1, __, __, a1],
      [__, __, v1, c6, v1, __, __, __, h2, __],
      [h1, __, v1, c6, v1, __, __, __, __, __],
      [__, __, v1, cm, v1, __, __, h3, __, __],
      [h1, __, v1, c6, v1, __, __, __, h3, __],
      [v1, v1, v1, c6, v1, h1, __, __, __, __],
      [c2, c5, c5, c3, v1, __, __, __, __, __],
      [c6, v1, v1, v1, v1, __, __, a1, __, __]
    ].reverse()
  }
  
}