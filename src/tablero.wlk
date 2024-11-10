import supertablero.*
import wollok.game.*
import auto.*
import cosas.*
import reloj.*

object tablero {
  method validarMovimiento(positionSiguiente) {
    if (not self.estaDentroDeLosLimites(positionSiguiente) and not self.hayTrasladorAqui()){self.error("No puede salir el limite del tablero") //para que no aparezca la burbuja en la visual
    }else{
        self.cambiarMapaSiEstoyEnTraslador()
    }
  }


  method hayTrasladorAqui(){
    return game.colliders(auto).any({ objeto => objeto.esTraslador() })
  }

  method cambiarMapaSiEstoyEnTraslador(){
    if(self.hayTrasladorAqui()){
      superTablero.cambiarMapa()
    }
  }
  
  method estaDentroDeLosLimites(position) = position.x().between(0, game.width() - 1) and position.y().between(0, game.height() - 2)
}