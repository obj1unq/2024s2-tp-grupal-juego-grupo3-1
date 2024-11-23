import wollok.game.*
import supertablero.*


object inicio {
  method position() = game.at(0, 0)
  method image() = "0"+ orden.toString() + "-intro.png"
  var orden = 0

// ver que aparezca milagrosamente la portada. (CAMBIO DE NOMBRES)
  
  method ejecutarInicio(){

    game.addVisual(self)
    keyboard.enter().onPressDo({self.cambiar()})
      
  }

  method seguirMostrando(){
    return orden < 5
  }

  method cambiar() {
    if (self.seguirMostrando()){
        orden += 1 
    }
    else{
        superTablero.inicioDeJuego()
    }

  }
}



// object intro6 inherits Introduccion(image = "controles.png") {  
//   override method siguiente() = null // nos lo puso leo
// }

//FALTA DEFINIR LA PANTALLA CON CONTROLES NUEVA
