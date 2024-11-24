import supertablero.*
import wollok.game.*
import auto.*

class SuperMapa {
  method posicionAuto()
  method imagenAuto()
  method obstaculo() = obstaculoVacio

  var property elementosCreados = []
  const property objetoImportante = null

  method mapa()

  method dibujar() {
    elementosCreados.forEach({elem => game.addVisual(elem) })
  }

  method inicializarObstaculo(){
    self.obstaculo().inicializar()
  }

  method agregarElemento(elem){
    elementosCreados.add(elem)
  } 
}
object obstaculoVacio{
  method inicializar(){
  }
}
