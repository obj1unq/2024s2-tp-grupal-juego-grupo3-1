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
import mapa2.* //ver
import mapaFrame.*
import traslador.*

object superTablero {

  const mapas = #{mapa2} //faltan todos los demás
  var mapaActual = mapa1 // inicializar como mapa inicio 
  var property objetosRecogidos = #{} //el tablero se tiene q acordar a quienes ya fueron agarrados para poder dibujarlos en el frame!!


  
  method inicioDeJuego(){
    self.iniciarComandos()

    game.removeVisual(inicio)
    barraSuperior.dibujar()
    mapaActual.dibujar()

    auto.position(mapaActual.posicionAuto())
    game.addVisual(auto)
  }
  

  method iniciarComandos(){
    keyboard.a().onPressDo({ auto.agarrarObjeto() })
    
    keyboard.up().onPressDo({ auto.mover(arriba) })
    keyboard.left().onPressDo({ auto.mover(izquierda) })
    keyboard.down().onPressDo({ auto.mover(abajo) })
    keyboard.right().onPressDo({ auto.mover(derecha) })
  }

  method finDeJuego(){
    barraSuperior.dibujar()
    self.agregarObjetosAgarradosEnBarraSuperior() // solo para ver si agrega todos, dsps hay q borrarlo

    //mapaFinal.dibujar()
    //falta ver como terminar todo acá, mapa final - imagenes finales ganar/perder



    //por el momento, voy a hacer que tire el mensaje de fin de juego q tira cuando se acaba el tiempo!
    game.addVisual(finDeJuego)
    game.stop() 
  }

  method siguienteMapa() {    
    mapaActual = mapas.anyOne()
    mapas.remove(mapaActual)
  }  

  method cambiarMapa() {
    
    self.removerTodasLasVisuales()

    self.finalizarSiEsElUltimoMapa()
    self.siguienteMapa()
    barraSuperior.dibujar()
    mapaActual.dibujar()
    
    auto.position(mapaActual.posicionAuto())
    game.addVisual(auto)

    self.agregarObjetosAgarradosEnBarraSuperior()

  }

  method agregarObjetosAgarradosEnBarraSuperior(){
    objetosRecogidos.forEach({obj => game.addVisual(obj)})
  }

  method finalizarSiEsElUltimoMapa() {
    if (mapas.size() == 0) self.finDeJuego()
  }

  method removerTodasLasVisuales() {
    game.allVisuals().forEach({v => game.removeVisual(v)})
  }

}

object __ {
  method dibujarEn(position) {
  }
} 

//FRAME
object f1 { //frame preg manzanita
  method dibujarEn(position) {
    frameManzanita.position(position)
    game.addVisual(frameManzanita)
  }
}
object f2 {
  method dibujarEn(position) {
    frameBizcochitos.position(position)
    game.addVisual(frameBizcochitos)
  }
}

object f3 {
  method dibujarEn(position) {
    framePalmeritas.position(position)
    game.addVisual(framePalmeritas)
  }
}

object f4 {
  method dibujarEn(position) {
    frameFaso.position(position)
    game.addVisual(frameFaso)
  }
}

object ft {
  method dibujarEn(position) {
    frameTermo.position(position)
    game.addVisual(frameTermo)
  }
}

object fy {
  method dibujarEn(position) {
    frameYerba.position(position)
    game.addVisual(frameYerba)
  }
}

object fm {
  method dibujarEn(position) {
    frameMate.position(position)
    game.addVisual(frameMate)
  }
}

object fa {
  method dibujarEn(position) {
    frameAgua.position(position)
    game.addVisual(frameAgua)
  }
}

object fr {
  method dibujarEn(position) {
    reloj.position(position)
    game.addVisual(reloj)
  }
} 

//CALLES
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

object cc {
  method dibujarEn(position) {
    game.addVisual(new Cruce(position = position))
  }
} //CALLES CON OBJETOS

object cm {
  //Calle con mate
  method dibujarEn(position) {
    game.addVisual(new CalleVertical(position = position))
    game.addVisual(new Mate(position = position))
  }
}

object cy {
  //Calle con yerba
  method dibujarEn(position) {
    game.addVisual(new CalleHorizontal(position = position))
    game.addVisual(new Yerba(position = position))
  }
}

object ct {
  //Calle con termo
  method dibujarEn(position) {
    game.addVisual(new CalleVertical(position = position))
    game.addVisual(new Termo(position = position))
  }
}

object cd {
  //Calle con dispenser
  method dibujarEn(position) {
    game.addVisual(new CalleVertical(position = position))
    game.addVisual(new Dispenser(position = position))
  }
}

object mc {
  //Calle con manzanita
  method dibujarEn(position) {
    game.addVisual(new CalleHorizontal(position = position))
    game.addVisual(new Manzanita(position = position))
  }
}

object cb {
  //Calle con mate
  method dibujarEn(position) {
    game.addVisual(new CalleHorizontal(position = position))
    game.addVisual(new Mate(position = position))
  }
}

object cp {
  //Calle con mate
  method dibujarEn(position) {
    game.addVisual(new CalleVertical(position = position))
    game.addVisual(new Mate(position = position))
  }
} //VEREDAS

object v1 {
  method dibujarEn(position) {
    game.addVisual(new Vereda(position = position))
  }
} //CASAS

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
} //ARBOL

object a1 {
  method dibujarEn(position) {
    game.addVisual(new Arbol(position = position))
  }
}

//TRASLADORES

object tu {
  method dibujarEn(position) {
    game.addVisual(new TrasladorArriba(position = position))
  }
}

object td {
  method dibujarEn(position) {
    game.addVisual(new TrasladorAbajo(position = position))
  }
}

object tl {
  method dibujarEn(position) {
    game.addVisual(new TrasladorIzquierda(position = position))
  }
}

object tr {
  method dibujarEn(position) {
    game.addVisual(new TrasladorDerecha(position = position))
  }
}
