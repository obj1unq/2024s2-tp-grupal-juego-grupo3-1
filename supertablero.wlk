import wollok.game.*
import auto.*
import cosas.*
import posiciones.*
import reloj.*
import elementosDelMapa.*
import mapas.*
import gameSetUp.*

object superTablero {

  const mapas = #{mapa1, mapa2, mapa3}

  var mapaActual = mapaInicial

  var property objetosRecogidos = #{}
  
  method inicioDeJuego(){
    self.iniciarComandos()
    self.inicializarMapa()
  }
  
  method iniciarComandos(){
    keyboard.a().onPressDo({ auto.agarrarObjeto() })

    keyboard.b().onPressDo({auto.tocarBocina()})
    
    keyboard.up().onPressDo({ auto.mover(arriba) })
    keyboard.left().onPressDo({ auto.mover(izquierda) })
    keyboard.down().onPressDo({ auto.mover(abajo) })
    keyboard.right().onPressDo({ auto.mover(derecha) })
  }

  method inicializarMapa(){
    self.removerTodasLasVisuales()
    barraSuperior.dibujar()
    mapaActual.dibujar()
    self.dibujarAuto()
    mapaActual.obstaculo().inicializar()
    self.agregarObjetosAgarradosEnBarraSuperior()
  }

  method finDeJuego(){
    barraSuperior.dibujar()
    self.agregarObjetosAgarradosEnBarraSuperior()

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
    self.finalizarSiEsElUltimoMapa()
    self.siguienteMapa()
    self.inicializarMapa()
  }

  method dibujarAuto() {
    auto.dibujar(mapaActual.posicionAuto(), mapaActual.imagenAuto())
  }

  method agregarARecogidos(cosa) {
    objetosRecogidos.add(cosa)
  }

  method agregarObjetosAgarradosEnBarraSuperior(){
    objetosRecogidos.forEach({obj => game.addVisual(obj)})
  }

  method finalizarSiEsElUltimoMapa() {
    if (mapas.size() == 0) self.finDeJuego()
  }

  method sePuedeTrasladarElAuto(){
    return game.colliders(auto).any({ objeto => objeto.meTraslada() })
  }

  method removerTodasLasVisuales() {
    game.allVisuals().forEach({v => game.removeVisual(v)})
  }

  method estaDentroDeLosLimites(position) = position.x().between(0, game.width() - 1) and position.y().between(0, game.height() - 3)
}

// Vacío
object __ {
  method dibujarEn(position) {
  }
  method instanciarEn(mapa, position){
  }
  
} 

//Objetos de la barra superior
object f1 { 
  method dibujarEn(position) {
    frameManzanita.position(position)
    game.addVisual(frameManzanita)
  }
  method instanciarEn(mapa, position){
    frameManzanita.position(position)
    mapa.agregarElemento(frameManzanita)
  }

}
object f2 {
  method dibujarEn(position) {
    frameBizcochitos.position(position)
    game.addVisual(frameBizcochitos)
  }
  method instanciarEn(mapa, position){
    frameBizcochitos.position(position)
    mapa.agregarElemento(frameBizcochitos)
  }
}
object f3 {
  method dibujarEn(position) {
    framePalmeritas.position(position)
    game.addVisual(framePalmeritas)
  }
  method instanciarEn(mapa, position){
    framePalmeritas.position(position)
    mapa.agregarElemento(framePalmeritas)
  }
}
object f4 {
  method dibujarEn(position) {
    frameFaso.position(position)
    game.addVisual(frameFaso)
  }
  method instanciarEn(mapa, position){
    frameFaso.position(position)
    mapa.agregarElemento(frameFaso)
  }
}
object f5 {
  method dibujarEn(position) {
    frameMedialuna.position(position)
    game.addVisual(frameMedialuna)
  }
  method instanciarEn(mapa, position){
    frameMedialuna.position(position)
    mapa.agregarElemento(frameMedialuna)
  }
}
object ft {
  method dibujarEn(position) {
    frameTermo.position(position)
    game.addVisual(frameTermo)
  }
  method instanciarEn(mapa, position){
    frameTermo.position(position)
    mapa.agregarElemento(frameTermo)
  }
}
object fy {
  method dibujarEn(position) {
    frameYerba.position(position)
    game.addVisual(frameYerba)
  }
  method instanciarEn(mapa, position){
    frameYerba.position(position)
    mapa.agregarElemento(frameYerba)
  }
}
object fm {
  method dibujarEn(position) {
    frameMate.position(position)
    game.addVisual(frameMate)
  }
  method instanciarEn(mapa, position){
    frameMate.position(position)
    mapa.agregarElemento(frameMate)
  }
}
object fa {
  method dibujarEn(position) {
    frameAgua.position(position)
    game.addVisual(frameAgua)
  }
  
  method instanciarEn(mapa, position){
    frameAgua.position(position)
    mapa.agregarElemento(frameAgua)
  }
}
object fr {
  method dibujarEn(position) {
    reloj.position(position)
    game.addVisual(reloj)
  }
  method instanciarEn(mapa, position){
    reloj.position(position)
    mapa.agregarElemento(reloj)
  }
} 

// Calles
object c1 {
  // method dibujarEn(elemento) {
  //   game.addVisual(elemento)
  // }

  method instanciarEn(mapa, position){
    mapa.agregarElemento(new Calle(position = position))
  }
}
// Calle inicial
object c2 {
  // method dibujarEn(position) {
  //   game.addVisual(new Inicio(position = position))
  // }

  method instanciarEn(mapa, position){
    mapa.agregarElemento(new Inicio(position = position))
  }

}
// Calle final
object c3 {
  // method dibujarEn (position) {
  //   game.addVisual(new Final(position = position))
  // }
  method instanciarEn(mapa, position){
    mapa.agregarElemento(new Final(position = position))
  }
}

//Calles con objetos
object cm {
  // method dibujarEn(position) {
  //   game.addVisual(new Calle(position = position))
  //   game.addVisual(new Mate(position = position))
  // }
  method instanciarEn(mapa, position){
    mapa.agregarElemento(new Calle(position = position))
    mapa.agregarElemento(new Mate(position = position))
  }
}

object cy {
  // method dibujarEn(position) {
  //   game.addVisual(new Calle(position = position))
  //   game.addVisual(new Yerba(position = position))
  // }
  method instanciarEn(mapa, position){
    mapa.agregarElemento(new Calle(position = position))
    mapa.agregarElemento(new Yerba(position = position))
  }
}
object ct {
  //Calle con termo
  // method dibujarEn(position) {
  //   game.addVisual(new Calle(position = position))
  //   game.addVisual(new Termo(position = position))
  // }
  method instanciarEn(mapa, position){
    mapa.agregarElemento(new Calle(position = position))
    mapa.agregarElemento(new Termo(position = position))
  }


}
object ca {
  //Calle con agua
  // method dibujarEn(position) {
  //   game.addVisual(new Calle(position = position))
  //   game.addVisual(new Agua(position = position))
  // }
  method instanciarEn(mapa, position){
    mapa.agregarElemento(new Calle(position = position))
    mapa.agregarElemento(new Agua(position = position))
  }
}
object mc {
  //Calle con manzanita
  // method dibujarEn(position) {
  //   game.addVisual(new Calle(position = position))
  //   game.addVisual(new Manzanita(position = position))
  // }
  method instanciarEn(mapa, position){
    mapa.agregarElemento(new Calle(position = position))
    mapa.agregarElemento(new Manzanita(position = position))
  }
}
object o2 {
  // method dibujarEn(position) {
  //   game.addVisual(new Calle(position = position))
  //   game.addVisual(new Bizcochitos (position = position))
  // }

  method instanciarEn(mapa, position){
    mapa.agregarElemento(new Calle(position = position))
    mapa.agregarElemento(new Bizcochitos(position = position))
  }
} 
object o3 {
  // method dibujarEn(position) {
  //   game.addVisual(new Calle(position = position))
  //   game.addVisual(new Palmeritas (position = position))
  // }

  method instanciarEn(mapa, position){
    mapa.agregarElemento(new Calle(position = position))
    mapa.agregarElemento(new Palmeritas(position = position))
  }

} 
object o4 {
  // method dibujarEn(position) {
  //   game.addVisual(new Calle(position = position))
  //   game.addVisual(new Faso (position = position))
  // }

  method instanciarEn(mapa, position){
    mapa.agregarElemento(new Calle(position = position))
    mapa.agregarElemento(new Yerba(position = position))
  }
} 
object o5 {
  // method dibujarEn(position) {
  //   game.addVisual(new Calle(position = position))
  //   game.addVisual (new Medialuna(position = position))
  // }

  method instanciarEn(mapa, position){
    mapa.agregarElemento(new Calle(position = position))
    mapa.agregarElemento(new Medialuna(position = position))
  }
}
object pp {
  // method dibujarEn(position) {
  //   game.addVisual(new Calle(position = position))
  //   game.addVisual(new Patrullero (position = position))
  // }

  method instanciarEn(mapa, position){
    mapa.agregarElemento(new Calle(position = position))
    mapa.agregarElemento(new Patrullero(position = position))
  }
} 
object cv {
  // method dibujarEn(position) {
  //   game.addVisual(new Calle(position = position))
  //   game.addVisual(new Pozo (position = position))
  //   game.addVisual(new Valla (position = position))
  // }

  method instanciarEn(mapa, position){
    mapa.agregarElemento(new Calle(position = position))
    mapa.agregarElemento(new Pozo(position = position))
    mapa.agregarElemento(new Valla(position = position))
  }
} 

//Veredas
object v1 {
  // method dibujarEn(position) {
  //   game.addVisual(new Vereda(position = position))
  // }

  method instanciarEn(mapa, position){
    mapa.agregarElemento(new Vereda(position = position))
  }
} 

//Módulos de casas
object m1{
  // method dibujarEn(position) {
  //   game.addVisual(new ModuloCasas1(position = position))
  // }

  method instanciarEn(mapa, position){
    mapa.agregarElemento(new ModuloCasas1(position = position))
  }
}
object m2{
  method dibujarEn(position) {
    game.addVisual(new ModuloCasas2(position = position))
  }
  method instanciarEn(mapa, position){
    mapa.agregarElemento(new ModuloCasas2(position = position))
  }

}
object m3{
  method dibujarEn(position) {
    game.addVisual(new ModuloCasas3(position = position))
  }
  method instanciarEn(mapa, position){
    mapa.agregarElemento(new ModuloCasas3(position = position))
  }
}
object m4{
  method dibujarEn(position) {
    game.addVisual(new ModuloCasas4(position = position))
  }
  method instanciarEn(mapa, position){
    mapa.agregarElemento(new ModuloCasas4(position = position))
  }
}
object m5{
  method dibujarEn(position) {
    game.addVisual(new ModuloCasas5(position = position))
  }
  method instanciarEn(mapa, position){
    mapa.agregarElemento(new ModuloCasas5(position = position))
  }
}
object m6{
  method dibujarEn(position) {
    game.addVisual(new ModuloCasas6(position = position))
  }
  method instanciarEn(mapa, position){
    mapa.agregarElemento(new ModuloCasas6(position = position))
  }
}
object m7{
  method dibujarEn(position) {
    game.addVisual(new ModuloCasas7(position = position))
  }
  method instanciarEn(mapa, position){
    mapa.agregarElemento(new ModuloCasas7(position = position))
  }
}
object m8{
  method dibujarEn(position) {
    game.addVisual(new ModuloCasas8(position = position))
  }
  method instanciarEn(mapa, position){
    mapa.agregarElemento(new ModuloCasas8(position = position))
  }
}
object m9{
  method dibujarEn(position) {
    game.addVisual(new ModuloCasas9(position = position))
  }
  method instanciarEn(mapa, position){
    mapa.agregarElemento(new ModuloCasas9(position = position))
  }
}
object m0{
  method dibujarEn(position) {
    game.addVisual(new ModuloCasas0(position = position))
  }

  method instanciarEn(mapa, position){
    mapa.agregarElemento(new ModuloCasas0(position = position))
  }
}
object n1{
  method dibujarEn(position) {
    game.addVisual(new ModuloCasas10(position = position))
  }

  method instanciarEn(mapa, position){
    mapa.agregarElemento(new ModuloCasas10(position = position))
  }
}
object n2{
  method dibujarEn(position) {
    game.addVisual(new ModuloCasas11(position = position))
  }
  method instanciarEn(mapa, position){
    mapa.agregarElemento(new ModuloCasas11(position = position))
  }
}
object n3{
  method dibujarEn(position) {
    game.addVisual(new ModuloCasas12(position = position))
  }
  method instanciarEn(mapa, position){
    mapa.agregarElemento(new ModuloCasas12(position = position))
  }
}
object n4{
  method dibujarEn(position) {
    game.addVisual(new ModuloCasas13(position = position))
  }
  method instanciarEn(mapa, position){
    mapa.agregarElemento(new ModuloCasas13(position = position))
  }
}
object n5{
  method dibujarEn(position) {
    game.addVisual(new ModuloCasas14(position = position))
  }
  method instanciarEn(mapa, position){
    mapa.agregarElemento(new ModuloCasas14(position = position))
  }
}
object n6{
  method dibujarEn(position) {
    game.addVisual(new ModuloCasas15(position = position))
  }
  method instanciarEn(mapa, position){
    mapa.agregarElemento(new ModuloCasas15(position = position))
  }
}
object n7{
  method dibujarEn(position) {
    game.addVisual(new ModuloCasas16(position = position))
  }
  method instanciarEn(mapa, position){
    mapa.agregarElemento(new ModuloCasas16(position = position))
  }
}
object n8{
  method dibujarEn(position) {
    game.addVisual(new ModuloCasas17(position = position))
  }
  method instanciarEn(mapa, position){
    mapa.agregarElemento(new ModuloCasas17(position = position))
  }
}
object n9{
  method dibujarEn(position) {
    game.addVisual(new ModuloCasas18(position = position))
  }
  method instanciarEn(mapa, position){
    mapa.agregarElemento(new ModuloCasas18(position = position))
  }
}

//Árbol y arbusto
object a1 {
  method dibujarEn(position) {
    game.addVisual(new Arbol(position = position))
  }
  method instanciarEn(mapa, position){
    mapa.agregarElemento(new Arbol(position = position))
  }
}
object aa {
  method dibujarEn(position) {
    game.addVisual(new Arbusto2(position = position))
  }
  method instanciarEn(mapa, position){
    mapa.agregarElemento(new Arbusto2(position = position))
  }
}

//Trasladores
object tu {
  method dibujarEn(position) {
    game.addVisual(new TrasladorArriba(position = position))
  }
  method instanciarEn(mapa, position){
    mapa.agregarElemento(new TrasladorArriba(position = position))
  }
}
object td {
  method dibujarEn(position) {
    game.addVisual(new TrasladorAbajo(position = position))
  }
  method instanciarEn(mapa, position){
    mapa.agregarElemento(new TrasladorAbajo(position = position))
  }
}
object tl {
  method dibujarEn(position) {
    game.addVisual(new TrasladorIzquierda(position = position))
  }
  method instanciarEn(mapa, position){
    mapa.agregarElemento(new TrasladorIzquierda(position = position))
  }

}
object tr {
  method dibujarEn(position) {
    game.addVisual(new TrasladorDerecha(position = position))
  }
  method instanciarEn(mapa, position){
    mapa.agregarElemento(new TrasladorDerecha(position = position))
  }
}
object ef {
  method dibujarEn(position) {
    extraFrame.position(position)
    game.addVisual(extraFrame)
  }
  method instanciarEn(mapa, position){
    extraFrame.position(position)
    mapa.agregarElemento(extraFrame)
  }
  
}
object es {
  method dibujarEn(position) {
    game.addVisual(new Estacionamiento(position = position))
  }
  method instanciarEn(mapa, position){
    mapa.agregarElemento(new Estacionamiento(position = position))
  }
}