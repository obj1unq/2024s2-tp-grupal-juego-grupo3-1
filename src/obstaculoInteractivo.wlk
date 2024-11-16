//import elementosDelMapa.*
import wollok.game.*
import auto.*
import reloj.*
class Elemento {
  var property image
  var property position
  
  method solida() = false
  
  method esAgarrable() = false
  
  method meTraslada() = false

  method meLlevaAlLago() = false
}
class ObstaculoInteractivo inherits Elemento(){


  var instanciaRecorrido = 0 //contador para recorrer la lista de posiciones del recorrido
  const miRecorrido // cuando instancias tu objeto obstaculo, creas tambien el objeto recorrido desde la clase recorrido, poniendole las posiciones que vayas a usar
    
  

  method caminar(){
    self.siguientePosicion()
    
    self.verificarSiChocoConAuto()
  }

  method verificarSiChocoConAuto(){
    if(self.atrapoAuto()){
      self.casitigoPorAtraparlo()
    }
  }
  method casitigoPorAtraparlo()

  method siguientePosicion(){
    self.asignarInstancia()

    position = miRecorrido.camino().get(instanciaRecorrido)
  }

  method asignarInstancia(){
    if(miRecorrido.tieneQueReiniciarRecorrido(instanciaRecorrido)){
      instanciaRecorrido = 0
    }else{
      instanciaRecorrido += 1 
    }
  }

  method inicializar(){
    game.addVisual(self)
    game.onTick(600, "object", {self.caminar()})
  }

  method atrapoAuto()
    //return game.colliders(self).contains(auto) 


/*
Los uso en policia y en fidel:
*/
  method elAutoEstaEnMismaPosicion(){
        return game.colliders(self).contains(auto)
    }

  method elAutoEstaAdelante(){
        return game.getObjectsIn(miRecorrido.posicionSiguienteEnLista(instanciaRecorrido)).contains(auto)
    }

  method elAutoEstaAtras(){
        return game.getObjectsIn(miRecorrido.posicionAnteriorEnLista(instanciaRecorrido)).contains(auto)

    }

}




class Recorrido{
 method ida() // declaras el camino de ida, y el objeto te crea el camino completo (lo hice así xq mi poli tenia como 50 posiciones, y era un montón ponerlas todas)

 var property camino = self.ida() + self.ida().reverse()

 method largoCamino() = camino.size()

 method tieneQueReiniciarRecorrido(nro){
   return nro == self.largoCamino()-1 // xq las posiciones en la lista el el largo-1
 }

 method posicionSiguienteEnLista(instancia) {
    //Precondicion: la instancia pasada por parametro es una posicion válida de la lista (entre 0 y largo-1)
    //devuelve la posicion que sigue en la lista, y en caso de no existir, osea q está al final de la lista,
    // devuelve el elemento de la posicion pasada por parametro, ya que debe devolver algo.
   return if(instancia+1 < self.largoCamino()){
           camino.get(instancia+1)
         }else{
           camino.get(instancia)
         }
 }
 method posicionAnteriorEnLista(instancia){
    //Precondicion: la instancia pasada por parametro es una posicion válida de la lista (entre 0 y largo-1)
    //devuelve la posicion que sigue en la lista, y en caso de no existir, osea q está al principio de la lista,
    //devuelve el elemento de la posicion pasada por parametro, ya que debe devolver algo.
   return if(instancia-1 >= 0){
           camino.get(instancia-1)
         }else{
           camino.get(instancia) 
         }
 }
}
