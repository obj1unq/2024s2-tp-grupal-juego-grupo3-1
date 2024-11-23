import wollok.game.*
import auto.*
import reloj.*

class Elemento {
  var property image
  var property position
  
  method solida() = false
  
  method esAgarrable() = false
  
  method meTraslada() = false
}

class Calle inherits Elemento (image = "calle.png") {
}

class Inicio inherits Calle {
  override method solida() = true
}

class Final inherits Elemento(image = "llegada.png"){
}

class Vereda inherits Elemento (image = "vereda.png") {
  override method solida() = true
}

class Casa inherits Elemento {
  override method solida() = true
}

class ModuloCasas1 inherits Casa(image = "m1.png"){}
class ModuloCasas2 inherits Casa(image = "m2.png"){}
class ModuloCasas3 inherits Casa(image = "m3.png"){}
class ModuloCasas4 inherits Casa(image = "m4.png"){}
class ModuloCasas5 inherits Casa(image = "m5.png"){}
class ModuloCasas6 inherits Casa(image = "m6.png"){} 
class ModuloCasas7 inherits Casa(image = "m7.png"){}
class ModuloCasas8 inherits Casa(image = "m8.png"){}
class ModuloCasas9 inherits Casa(image = "m9.png"){}
class ModuloCasas0 inherits Casa(image = "m0.png"){}

class ModuloCasas10 inherits Casa(image = "n1.png"){}
class ModuloCasas11 inherits Casa(image = "n2.png"){}
class ModuloCasas12 inherits Casa(image = "n3.png"){}
class ModuloCasas13 inherits Casa(image = "n4.png"){}
class ModuloCasas14 inherits Casa(image = "n5.png"){}
class ModuloCasas15 inherits Casa(image = "n6.png"){}
class ModuloCasas16 inherits Casa(image = "n7.png"){}
class ModuloCasas17 inherits Casa(image = "n8.png"){}
class ModuloCasas18 inherits Casa(image = "n9.png"){}



class Pozo inherits Elemento (image = "pozo.png") {
  override method solida() = false
}


class Obstruccion inherits Elemento {
  override method solida() = true
}

class Patrullero inherits Obstruccion (image = "patrullero_.png") {
}

class Valla inherits Obstruccion (image = "valla.png") {
}

class Arbol inherits Elemento (image = "arbol2.png") { 
}

class Arbusto2 inherits Elemento (image = "arbusto2.png"){
}

class Estacionamiento inherits Elemento(image = "estacionamiento.png"){
  override method solida() = true
}

class Traslador inherits Calle {
  override method meTraslada() = true
}

class TrasladorDerecha inherits Traslador ( image = "flecha-derecha-.png"){
}

class TrasladorIzquierda inherits Traslador (image = "flecha-izquierda-.png") {
}

class TrasladorArriba inherits Traslador (image = "flecha-arriba-.png"){
}

class TrasladorAbajo inherits Traslador (image = "flecha-abajo-.png") {
}

//OBSTACULO INTERACTIVO
class Obstaculo inherits Elemento{
  var instanciaRecorrido = 0 //contador para recorrer la lista de posiciones del recorrido
  const miRecorrido // cuando instancias tu objeto obstaculo, creas tambien el objeto recorrido desde la clase recorrido, poniendole las posiciones que vayas a usar
  

  method inicializar(){
    game.addVisual(self)
    game.onTick(600, "object", {self.caminar()})
  }
  
  method caminar(){
    self.siguienteInstancia()
    position = miRecorrido.camino().get(instanciaRecorrido)
  }

  method siguienteInstancia(){
    if(miRecorrido.tieneQueReiniciarRecorrido(instanciaRecorrido)){
      instanciaRecorrido = 0
    } else {
      instanciaRecorrido += 1 
    }
  }
}

class ObstaculoInteractivo inherits Obstaculo(position = miRecorrido.camino().get(0)){

  //var instanciaRecorrido = 0 //contador para recorrer la lista de posiciones del recorrido
  //const miRecorrido // cuando instancias tu objeto obstaculo, creas tambien el objeto recorrido desde la clase recorrido, poniendole las posiciones que vayas a usar
  
  method casitigoPorAtraparlo()
  method atrapoAuto()

  override method caminar(){
    super()
    self.verificarSiChocoConAuto()
  }

  method verificarSiChocoConAuto(){
    if(self.atrapoAuto()){
      self.casitigoPorAtraparlo()
    }
  }

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

 method camino() = self.ida() + self.ida().reverse() // REFACTORIZAR: lo ponemos como abstracto??

 method largoCamino() = self.camino().size()

 method tieneQueReiniciarRecorrido(numero){
   return numero == self.largoCamino()-1 // xq las posiciones en la lista el el largo-1
 }

 method posicionSiguienteEnLista(instancia) {
   return if(instancia+1 < self.largoCamino()){
           self.camino().get(instancia+1)
         } else {
           self.camino().get(instancia)
         }
 }

 method posicionAnteriorEnLista(instancia){
   return if(instancia-1 >= 0){
           self.camino().get(instancia-1)
         } else {
           self.camino().get(instancia) 
         }
 }
}
