
import caminos.*
import supertablero.*
import superMapa.*

object mapa2 inherits SuperMapa{
  
  override method mapa() {
    return 
      [ 
        [__, __, __, __, __, __, __, __, __, __],
        [__, __, v1, c6, v1, __, __, __, __, __],
        [v1, v1, v1, c6, v1, v1, v1, v1, v1, v1],
        [c5, c5, c5, cc, c5, c5, c5, c5, c5, c5],
        [v1, v1, v1, c6, v1, v1, v1, v1, v1, v1],
        [__, __, v1, c6, v1, __, __, h3, __, __],
        [h1, __, v1, c6, v1, __, __, __, h3, __],
        [v1, v1, v1, c6, v1, h1, __, __, __, __],
        [c2, c5, c5, c3, v1, __, __, __, __, __],
        [c6, v1, v1, v1, v1, __, __, a1, __, __]
      ]
  }
  
}