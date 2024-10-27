import barraSuperior.*
import wollok.game.*
import auto.*
import tablero.*
import cosas.*
import posiciones.*
import reloj.*
import inicio.*
import mapaPrueba.*
import caminos.*
import mapa2.*


object superTablero {
    //En un futuro mapa va a ser un randomizer de la lista de mapas y va a tener q borrar ese mapa de la lista para q no salga repetido el mapa
    const frame = [fr, fp, fp, fp, fp, fp, fa, fm, fy, ft]
    const tablero = ([frame] + tab1).reverse()
    //const mapas = [mapa1, mapa2, mapa3, mapa4, mapa5, mapa6, mapa7, mapa8]
    var mapa = mapa1  //para querer probar nuestros mapas, cambiar mapa1 por el nombre de tu mapa
    var tab1 = mapa.tablero()
 
  
  method dibujar() {
    game.height(tablero.size())
    game.width(tablero.get(0).size())
    (0 .. (game.width() - 1)).forEach(
      { x => (0 .. (game.height() - 1)).forEach(
          { y => tablero.get(y).get(x).dibujarEn(game.at(x, y)) }
        ) }
    )
    //mapa.ponerObjetos()
    game.addVisual(auto)

  }

  method cambiarMapa(){
    mapa = mapa2
    mapa.dibujar()
  }
} 


object fp {
    method dibujarEn(position) {
        game.addVisual(new FramePregunta(position = position))

    }
}
object ft{
    method dibujarEn(position) {
        frameTermo.position(position)
        game.addVisual(frameTermo)
    }
}
object fy{
    method dibujarEn(position) {
        frameYerba.position(position)
        game.addVisual(frameYerba)
    }
}
object fm{
    method dibujarEn(position) {
        frameMate.position(position)
        game.addVisual(frameMate)
    }
}
object fa{
    method dibujarEn(position) {
        frameAgua.position(position)
        game.addVisual(frameAgua)
    }
}
object fr{
    method dibujarEn(position) {
        reloj.position(position)
        game.addVisual(reloj)
    }
}
object __ {
  method dibujarEn(position) {
  }
}
object c1 {
  method dibujarEn(position) {
    game.addVisual(new Esquina1(position = position))
  }
}
object c2 {
  method dibujarEn(position) {
    game.addVisual(new Esquina2(position = position))
  }
}
object c3 {
  method dibujarEn(position) {
    game.addVisual(new Esquina3(position = position))
  }
}
object c4 {
  method dibujarEn(position) {
    game.addVisual(new Esquina4(position = position))
  }
}
object c5 {
  method dibujarEn(position) {
    game.addVisual(new CalleHorizontal(position = position))
  }
}
object c6 {
  method dibujarEn(position) {
    game.addVisual(new CalleVertical(position = position))
  }
}
object v1 {
  method dibujarEn(position) {
    game.addVisual(new Vereda(position = position))
  }
}
object cc{
    method dibujarEn(position) {
        game.addVisual(new Cruce(position = position))
  }
}
object h1 {
   method dibujarEn(position) {
    game.addVisual(new Casa1(position = position))
  }
}
object h2 {
   method dibujarEn(position) {
    game.addVisual(new Casa2(position = position))
  }
}
object h3 {
   method dibujarEn(position) {
    game.addVisual(new Casa3(position = position))
  }
}
object a1{
   method dibujarEn(position) {
    game.addVisual(new Arbol(position = position))
  }
}






