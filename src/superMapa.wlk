import wollok.game.*
import tablero.*

class SuperMapa {
  
  method mapa

  method dibujar() {
    game.height(self.mapa().size())
    game.width(self.mapa().get(0).size())
    (0 .. (game.width() - 1)).forEach(
      { x => (0 .. (game.height() - 1)).forEach(
          { y => self.mapa()(y).get(x).dibujarEn(game.at(x, y)) }
        ) }
    )
    //game.addVisual(auto) ver si va acá
  }
  
}