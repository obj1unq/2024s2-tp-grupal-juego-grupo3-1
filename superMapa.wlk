import wollok.game.*
import auto.*

class SuperMapa {
  method posicionAuto()
  method imagenAuto()
  method obstaculo() = obstaculoVacio
  var property instanciacion = []
  
  method mapa()

  method dibujar() {
    instanciacion.forEach({elem => game.addVisual(elem) })
  }

  method inicializarObstaculo(){
    self.obstaculo().inicializar()
  }

  method agregarElemento(elem){
    instanciacion.add(elem)
  } 
}
object obstaculoVacio{
  method inicializar(){
  }
}
