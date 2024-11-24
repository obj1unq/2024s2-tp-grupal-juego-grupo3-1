import supertablero.*
import wollok.game.*
import auto.*

class SuperMapa {
  var property instanciacion = []
  var property objetoImportante = null

  method posicionAuto()
  method imagenAuto()
  method obstaculo() = obstaculoVacio
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
