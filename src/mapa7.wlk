import wollok.game.*
import supertablero.*
import superMapa.*
import reloj.*
import auto.*
import posiciones.*
/*
object mapa7 inherits SuperMapa{
  // cada mapa le tiene que decir al auto donde tiene que arrancar
  override method posicionAuto() = game.at(0,7)
  override method imagenAuto() = "autoHaciaDerecha.png"
  
  override method obstaculo() = policia

  override method mapa() {
    return 
      [ 
        [__, __, __, __, __, __, __, __, __, __],
        [v1, v1, v1, v1, v1, v1, v1, v1, v1, v1],
        [c5, c5, cc, c5, c5, c5, c5, c5, c5, cc],
        [v1, v1, c6, v1, v1, v1, v1, v1, v1, c6],
        [__, v1, c6, v1, __, __, __, __, v1, c6],
        [__, v1, c6, v1, h1, __, __, __, v1, c6],
        [__, v1, ct, v1, __, __, h2, __, v1, c6],
        [v1, v1, pp, v1, v1, v1, v1, v1, v1, c6],
        [tl, c5, cc, c5, c5, c5, c5, c5, c5, cc],
        [v1, v1, v1, v1, v1, v1, v1, v1, v1, v1]

      ].reverse()
  }

  
}


object policia inherits Elemento(position = game.at(2,3)){
  // comportamiento: el poli va a hacer un camino de ida y vuelta, si el policia y el auto colisionan, 
  //se reduce el tiempo 10 segundos (a chequear cuanto segundos).
  // y manda al auto a la posicion inicial del mapa
  override method image() = "bizcochitos_.png"
  override method solida() = false
  override method esAgarrable() = false 
  override method meTraslada() = false 

  
  var property instanciaRecorrido = 0

  method caminar(){
    self.siguientePosicion()
    
    self.verSiAtrapoAuto()
  }

  method siguientePosicion(){
    self.asignarInstancia(instanciaRecorrido)

    position = recorrido.camino().get(instanciaRecorrido)
  }

  method asignarInstancia(nro){
    if(recorrido.estasAlFnalDelCamino(instanciaRecorrido)){
      instanciaRecorrido = 0
    }else{
      instanciaRecorrido += 1 
    }
  }

  method inicializar(){
    game.addVisual(self)
    game.onTick(500, "poli", {self.caminar()})
  }

  method verSiAtrapoAuto(){
    if(self.atrapoAuto()){
      game.say(self, " TE ATRAPÉ!! ")
      reloj.descontarTiempo(10) //reveer
      auto.position(game.at(0,7)) //lo manda al principio del mapa
    }
  }

  

  method atrapoAuto(){
    return self.elAutoEstaEnMismaPosicion() or self.elAutoEstaAdelante() or self.elAutoEstaAtras() 
  }

  method elAutoEstaEnMismaPosicion(){
    return game.colliders(self).contains(auto)
  }

  method elAutoEstaAdelante(){
    return game.getObjectsIn(recorrido.posicionSiguiente(instanciaRecorrido)).contains(auto)
  }

  method elAutoEstaAtras(){
    return game.getObjectsIn(recorrido.posicionAnterior(instanciaRecorrido)).contains(auto)

  }



  
}


*/
///*
//object recorrido{
//  const property ida = [ /*calle izquierda*/ game.at(2,3), game.at(2,4), game.at(2,5), game.at(2,6), game.at(2,7),
//                          /*calle arriba*/ game.at(3,7), game.at(4,7), game.at(5,7),  game.at(6,7), game.at(7,7), game.at(8,7), game.at(9,7), 
//                          /*calle derecha*/  game.at(9,6), game.at(9,5), game.at(9,4), game.at(9,3), game.at(9,2), game.at(9,1),
//                          /*calle abajo*/ game.at(8,1), game.at(7,1), game.at(6,1),game.at(5,1), game.at(4,1), game.at(3,1)
//                        ] 
//  const property vuelta = ida.reverse() 
//
//  var property camino = ida + vuelta
//
//
//  method estasAlFnalDelCamino(nro){
//    return nro == 46 // son 23 posiciones * 2
//  }
//
//  method posicionAnteriorA(posicion){
//    return
//  }
//  method posicionSiguienteA(posicion){
//    return
//  }
//
//  method posicionSiguiente(instancia) {
//    return if(instancia+1>=0 and instancia+1 <= 46){
//            camino.get(instancia+1)
//          }else{
//            camino.get(instancia) // tiene que devolver algo, así q que devuelva la posicion en la que esta parado el policia
//          }
//  }
//  method posicionAnterior(instancia){
//    return if(instancia-1 >= 0 and instancia-1 <= 46){
//            camino.get(instancia-1)
//          }else{
//            camino.get(instancia) // tiene que devolver algo, así q que devuelva la posicion en la que esta parado el policia
//          }
//  }
//}
//