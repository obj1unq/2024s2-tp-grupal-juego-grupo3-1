import wollok.game.*
import auto.*
import cosas.*
import reloj.*
import barraSuperior.*
import caminos.*
import supertablero.*

object mapa2 {
  const property tablero = [
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
  
  method dibujar() {
    game.height(tablero.size())
    game.width(tablero.get(0).size())
    (0 .. (game.width() - 1)).forEach(
      { x => (0 .. (game.height() - 1)).forEach(
          { y => tablero.get(y).get(x).dibujarEn(game.at(x, y)) }
        ) }
    )
    
    self.ponerObjetos()
  }
  
  method ponerObjetos() {
    //los objetos que nos toque poner en nuestro mapa
    game.addVisual(new Flecha(position = game.at(3, 8)))
    game.addVisual(new Pozo(position = game.at(3, 4)))
    auto.position(game.at(0, 0))
    game.addVisual(new Mate(position = game.at(3, 1)))
    
    game.addVisual(new Valla(position = game.at(3, 7)))
    game.addVisual(new Patrullero(position = game.at(3, 6)))
  }
}