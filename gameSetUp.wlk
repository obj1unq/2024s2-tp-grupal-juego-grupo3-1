import wollok.game.*
import mapas.*

object setUp {
  const mapas = #{barraSuperior, mapaInicial, mapa1, mapa2, mapa3, mapaFinal}
  
  method crearMapas() {
    mapas.forEach({mapaActual => self.crearMapa(mapaActual)})
  }

  method crearMapa(mapaActual){
    game.height(mapaActual.mapa().size())
    game.width(mapaActual.mapa().get(0).size())
    (0 .. (game.width() - 1)).forEach(
      { x => (0 .. (game.height() - 1)).forEach(
          { y => mapaActual.mapa().get(y).get(x).instanciarEn(mapaActual, game.at(x, y)) }
        ) }
    )
  }

}






