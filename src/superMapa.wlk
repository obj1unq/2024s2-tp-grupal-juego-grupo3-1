import wollok.game.*
import auto.*

class SuperMapa {

  method posicionAuto()
  method imagenAuto()
  method obstaculo() = obstaculoVacio
  
  method mapa()

  method dibujar() {
    game.height(self.mapa().size())
    game.width(self.mapa().get(0).size())
    (0 .. (game.width() - 1)).forEach(
      { x => (0 .. (game.height() - 1)).forEach(
          { y => self.mapa().get(y).get(x).dibujarEn(game.at(x, y)) }
        ) }
    )

    auto.position(self.posicionAuto())
  }
  
}

object obstaculoVacio{
  method inicializar(){

  }
}