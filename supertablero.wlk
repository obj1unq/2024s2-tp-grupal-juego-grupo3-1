import wollok.game.*
import auto.*
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

  // method finDeJuego(){
  //   barraSuperior.dibujar()
  //   self.agregarObjetosAgarradosEnBarraSuperior()

  //   //mapaFinal.dibujar()
  //   //falta ver como terminar todo acá, mapa final - imagenes finales ganar/perder

  //   //por el momento, voy a hacer que tire el mensaje de fin de juego q tira cuando se acaba el tiempo!
  //   game.addVisual(finDeJuego)
  //   game.stop() 
  // }

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
    
    self.finalSiOlvidasteObjetoImportante()
    self.finalSiSeQuedoSinTiempo()
    self.finalSiGanaste()

  }

  method finalSiOlvidasteObjetoImportante(){
      if(self.teOlvidasteObjetoImportante()){
        game.addVisual(finDeJuegoNoAgarro)
        game.stop()
      }
  }

  method finalSiSeQuedoSinTiempo(){
      if(reloj.seQuedoSinTiempo()){
        game.addVisual(finDeJuegoSinTiempo)
        game.stop()

      }
  }

  method finalSiGanaste(){
      if(self.ganaste()){
        game.addVisual(finDeJuegogGano)
        game.stop()
      }
  }

  method teOlvidasteObjetoImportante(){
    return not objetosRecogidos.contains(mapaActual.objetoImportante())
  }

  method ganaste(){
    return self.recogioTodosLosObjetosimportantes() and not reloj.seQuedoSinTiempo()
  }

  method recogioTodosLosObjetosimportantes(){
    return objetosRecogidos.forEach()
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
  method crearEn(mapa, position){
  }
  
} 

//Objetos de la barra superior
object f1 { 
  method crearEn(mapa, position){
    frameManzanita.position(position)
    mapa.agregarElemento(frameManzanita)
  }

}
object f2 {
  method crearEn(mapa, position){
    frameBizcochitos.position(position)
    mapa.agregarElemento(frameBizcochitos)
  }
}
object f3 {
  method crearEn(mapa, position){
    framePalmeritas.position(position)
    mapa.agregarElemento(framePalmeritas)
  }
}
object f4 {
  method crearEn(mapa, position){
    frameFaso.position(position)
    mapa.agregarElemento(frameFaso)
  }
}
object f5 {
  method crearEn(mapa, position){
    frameMedialuna.position(position)
    mapa.agregarElemento(frameMedialuna)
  }
}
object ft {
  method crearEn(mapa, position){
    frameTermo.position(position)
    mapa.agregarElemento(frameTermo)
  }
}
object fy {
  method crearEn(mapa, position){
    frameYerba.position(position)
    mapa.agregarElemento(frameYerba)
  }
}
object fm {
  method crearEn(mapa, position){
    frameMate.position(position)
    mapa.agregarElemento(frameMate)
  }
}
object fa {
  method crearEn(mapa, position){
    frameAgua.position(position)
    mapa.agregarElemento(frameAgua)
  }
}
object fr {
  method crearEn(mapa, position){
    reloj.position(position)
    mapa.agregarElemento(reloj)
  }
} 

// Calles
object c1 {
  method crearEn(mapa, position){
    mapa.agregarElemento(new Calle(position = position))
  }
}

// Calle inicial
object c2 {
  method crearEn(mapa, position){
    mapa.agregarElemento(new Inicio(position = position))
  }

}
// Calle final
object c3 {
  method crearEn(mapa, position){
    mapa.agregarElemento(new Final(position = position))
  }
}

//Calles con objetos
object cm {
  method crearEn(mapa, position){
    mapa.agregarElemento(new Calle(position = position))
    mate.position(position)
    mapa.agregarElemento(mate)
  }
}

object cy {
  method crearEn(mapa, position){
    mapa.agregarElemento(new Calle(position = position))
    yerba.position(position)
    mapa.agregarElemento(yerba)
  }
}
object ct {
  method crearEn(mapa, position){
    mapa.agregarElemento(new Calle(position = position))
    termo.position(position)
    mapa.agregarElemento(termo)
  }
}
object ca {
  method crearEn(mapa, position){
    mapa.agregarElemento(new Calle(position = position))
    agua.position(position)
    mapa.agregarElemento(agua)
  }
}
object mc {
  method crearEn(mapa, position){
    mapa.agregarElemento(new Calle(position = position))
    mapa.agregarElemento(new Manzanita(position = position))
  }
}
object o2 {
  method crearEn(mapa, position){
    mapa.agregarElemento(new Calle(position = position))
    mapa.agregarElemento(new Bizcochitos(position = position))
  }
} 
object o3 {
  method crearEn(mapa, position){
    mapa.agregarElemento(new Calle(position = position))
    mapa.agregarElemento(new Palmeritas(position = position))
  }

} 
object o4 {
  method crearEn(mapa, position){
    mapa.agregarElemento(new Calle(position = position))
    mapa.agregarElemento(new Faso(position = position))
  }
} 
object o5 {
  method crearEn(mapa, position){
    mapa.agregarElemento(new Calle(position = position))
    mapa.agregarElemento(new Medialuna(position = position))
  }
}
object pp {
  method crearEn(mapa, position){
    mapa.agregarElemento(new Calle(position = position))
    mapa.agregarElemento(new Patrullero(position = position))
  }
} 
object cv {
  method crearEn(mapa, position){
    mapa.agregarElemento(new Calle(position = position))
    mapa.agregarElemento(new Pozo(position = position))
    mapa.agregarElemento(new Valla(position = position))
  }
} 

//Veredas
object v1 {
  method crearEn(mapa, position){
    mapa.agregarElemento(new Vereda(position = position))
  }
} 

//Módulos de casas
object m1{
  method crearEn(mapa, position){
    mapa.agregarElemento(new ModuloCasas1(position = position))
  }
}
object m2{
  method crearEn(mapa, position){
    mapa.agregarElemento(new ModuloCasas2(position = position))
  }

}
object m3{
  method crearEn(mapa, position){
    mapa.agregarElemento(new ModuloCasas3(position = position))
  }
}
object m4{
  method crearEn(mapa, position){
    mapa.agregarElemento(new ModuloCasas4(position = position))
  }
}
object m5{
  method crearEn(mapa, position){
    mapa.agregarElemento(new ModuloCasas5(position = position))
  }
}
object m6{
  method crearEn(mapa, position){
    mapa.agregarElemento(new ModuloCasas6(position = position))
  }
}
object m7{
  method crearEn(mapa, position){
    mapa.agregarElemento(new ModuloCasas7(position = position))
  }
}
object m8{
  method crearEn(mapa, position){
    mapa.agregarElemento(new ModuloCasas8(position = position))
  }
}
object m9{
  method crearEn(mapa, position){
    mapa.agregarElemento(new ModuloCasas9(position = position))
  }
}
object m0{
  method crearEn(mapa, position){
    mapa.agregarElemento(new ModuloCasas0(position = position))
  }
}
object n1{
  method crearEn(mapa, position){
    mapa.agregarElemento(new ModuloCasas10(position = position))
  }
}
object n2{
  method crearEn(mapa, position){
    mapa.agregarElemento(new ModuloCasas11(position = position))
  }
}
object n3{
  method crearEn(mapa, position){
    mapa.agregarElemento(new ModuloCasas12(position = position))
  }
}
object n4{
  method crearEn(mapa, position){
    mapa.agregarElemento(new ModuloCasas13(position = position))
  }
}
object n5{
  method crearEn(mapa, position){
    mapa.agregarElemento(new ModuloCasas14(position = position))
  }
}
object n6{
  method crearEn(mapa, position){
    mapa.agregarElemento(new ModuloCasas15(position = position))
  }
}
object n7{
  method crearEn(mapa, position){
    mapa.agregarElemento(new ModuloCasas16(position = position))
  }
}
object n8{
  method crearEn(mapa, position){
    mapa.agregarElemento(new ModuloCasas17(position = position))
  }
}
object n9{
  method crearEn(mapa, position){
    mapa.agregarElemento(new ModuloCasas18(position = position))
  }
}

//Árbol y arbusto
object a1 {
  method crearEn(mapa, position){
    mapa.agregarElemento(new Arbol(position = position))
  }
}
object aa {
  method crearEn(mapa, position){
    mapa.agregarElemento(new Arbusto2(position = position))
  }
}

//Trasladores
object tu {
  method crearEn(mapa, position){
    mapa.agregarElemento(new TrasladorArriba(position = position))
  }
}
object td {
  method crearEn(mapa, position){
    mapa.agregarElemento(new TrasladorAbajo(position = position))
  }
}
object tl {
  method crearEn(mapa, position){
    mapa.agregarElemento(new TrasladorIzquierda(position = position))
  }

}
object tr {
  method crearEn(mapa, position){
    mapa.agregarElemento(new TrasladorDerecha(position = position))
  }
}
object ef {
  method crearEn(mapa, position){
    extraFrame.position(position)
    mapa.agregarElemento(extraFrame)
  }
  
}
object es {
  method crearEn(mapa, position){
    mapa.agregarElemento(new Estacionamiento(position = position))
  }
}

object termo inherits Termo(image = "termo--.png"){}
object yerba inherits Yerba (image =  "yerba--.png"){}
object agua inherits Agua (image =  "agua--.png") {}
object mate inherits Mate (image =  "mate--.png"){}