import wollok.game.*
import supertablero.*
import auto.*
import elementosDelMapa.*

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

  method tieneObjetoImportante(){
    return objetoImportante != null
  }

  method inicializarObstaculo(){
    self.obstaculo().inicializar()
  }

  method agregarElemento(elem){
    elementosCreados.add(elem)
  } 

  method desactivarObstaculo(){
    self.obstaculo().activo(false)
  }
}
object obstaculoVacio inherits Obstaculo(position = game.at(0,0), image = null, dialogo = new Dialogo(image = null), miRecorrido = recorridoVacio){
  override method inicializar(){
  }
}

object recorridoVacio inherits Recorrido{
  override method camino(){}
}