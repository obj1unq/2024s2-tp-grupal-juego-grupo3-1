import supertablero.*
import wollok.game.*
import superMapa.*
import posiciones.*

object mapa4 inherits SuperMapa{
  // cada mapa le tiene que decir al auto donde tiene que arrancar
  override method posicionAuto() = game.at(1,0)
  override method imagenAuto() = arriba.image()


  override method mapa() {
    return 
      [ [__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __], 
        [__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __], 
        [__, __, __, v1, v1, v1, v1, v1, __, __, v1, v1, v1, v1, v1, v1, v1, v1, v1, v1], 
        [a1, __, __, v1, c1, c1, c1, v1, a1, __, v1, c1, c1, c1, c1, v1, o4, c1, c1, v1], 
        [__, __, __, v1, c1, v1, c1, v1, __, __, v1, c1, v1, v1, c1, v1, c1, v1, c1, v1], 
        [__, h3, __, v1, c1, v1, c1, v1, v1, __, v1, c1, pp, c1, c1, c1, c1, c1, c1, tr], 
        [v1, v1, v1, c1, c1, v1, c1, c1, v1, v1, v1, c1, v1, v1, v1, v1, v1, v1, v1, v1], 
        [v1, c1, c1, c1, v1, v1, v1, c1, c1, c1, c1, c1, c1, v1, v1, v1, v1, v1, v1, v1], 
        [v1, c1, v1, v1, __, __, v1, c1, v1, v1, v1, v1, c1, c1, c1, c1, c1, c1, c1, tr], 
        [v1, c1, v1, __, h1, __, v1, c1, v1, v1, v1, v1, c1, v1, v1, v1, v1, v1, v1, v1], 
        [v1, c1, v1, __, __, __, v1, c1, c1, cp, c1, c1, c1, c1, c1, o4, c1, v1, __, __], 
        [v1, c1, v1, __, h1, __, v1, v1, v1, v1, td, v1, v1, v1, v1, v1, td, v1, a1, __]
      ].reverse()v1
  }
  
}// calle : c1
// vereda : v1
// calle con manzana : mc
// calle con agua : ca
// casa : h1 h2 h3
// arbol : a1 o4
// valla : cv
// pozo : cp
// patrullero: pp
// trasladores : tu td tl tr
