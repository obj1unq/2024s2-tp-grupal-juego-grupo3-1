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
object obstaculoVacio{
  const property position = game.at(0,0)
  const property image = null
  method inicializar(){
  }
}
