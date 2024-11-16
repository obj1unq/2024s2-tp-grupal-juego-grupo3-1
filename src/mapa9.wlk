import supertablero.*
import wollok.game.*
import superMapa.*
import obstaculoInteractivo.*
import auto.*
import posiciones.*


object mapa9 inherits SuperMapa{
  // cada mapa le tiene que decir al auto donde tiene que arrancar
  override method posicionAuto() = game.at(0,3)
  override method imagenAuto() = derecha.image()
  override method obstaculo() = lagoFidel


  override method mapa() {
    return [ 
        [__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __],
        [__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __],
        [v1, v1, v1, v1, v1, __, __, ar, ar, ar, ar, ar, ar, ar, ar, ar, ar, ar, ar, ar],
        [v1, c1, c1, c1, v1, __, __, ar, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, tr],
        [v1, c1, v1, c1, v1, __, __, ar, v1, v1, v1, v1, v1, v1, v1, v1, v1, v1, v1, v1],
        [v1, c1, v1, c1, v1, __, __, ar, __, __, v1, c1, ct, c1, c1, c1, c1, c1, c1, c1],
        [v1, c1, v1, c1, v1, __, __, ar, __, __, v1, c1, v1, v1, v1, v1, v1, v1, v1, c1],
        [v1, c1, v1, c1, v1, __, __, ar, __, __, v1, c1, v1, __, __, __, __, __, v1, c1],
        [c1, c1, v1, c1, v1, v1, v1, ar, __, __, v1, c1, v1, __, __, __, __, __, v1, c1],
        [v1, v1, v1, c1, c1, c1, c1, ar, __, __, v1, c1, v1, lg, __, __, __, __, v1, c1],
        [__, __, __, v1, v1, v1, c1, v1, __, __, v1, c1, v1, v1, v1, v1, v1, v1, v1, c1],
        [h1, __, a1, __, __, v1, c1, v1, __, __, v1, c1, c1, c1, c1, c1, c1, c1, c1, c1]
      ].reverse()
  }
}
object lagoFidel{
    method inicializar(){
        fidel1.inicializar()
        fidel2.inicializar()

        transporte1.inicializar()
        transporte2.inicializar()

        game.onTick(1, "ir al lago", {self.llevarAlAutoAlLagoSiPuede()})
    }

    method llevarAlAutoAlLagoSiPuede(){
        if(self.elAutoEstaEnAlgunTransporteAlLago()){
            self.movimientoLago()
        }
    }
    method elAutoEstaEnAlgunTransporteAlLago(){
        return self.autoEstaEntrandoAlLago() or self.autoEstaSaliendoDelLago()
    }

    method movimientoLago(){
        if(self.autoEstaEntrandoAlLago()){
            auto.position(transporte1.destino())
        }else{ //auto esta saliendo del lago
            auto.position(transporte2.destino())
        }

    auto.image(derecha.image())
    
    }

    method autoEstaEntrandoAlLago(){
        return game.colliders(auto).contains(transporte1)
    }

    method autoEstaSaliendoDelLago(){
        return game.colliders(auto).contains(transporte2)
    }
}




class Fidel inherits ObstaculoInteractivo{
    override method casitigoPorAtraparlo(){
        game.say(self, " Todavia no entregaste las practicas?! ")
        auto.position(game.at(18,6))/*aca va a ir la posicion que le pongamos al transportador que lo envia al lago*/
    }   

    
    override  method atrapoAuto(){
        return self.elAutoEstaEnMismaPosicion() or self.elAutoEstaAdelante() or self.elAutoEstaAtras() 
    }

}
object fidel1 inherits Fidel(miRecorrido = recorridoFidel1, image= "fidel.png", position = miRecorrido.camino().get(0) ){}

object fidel2 inherits Fidel(miRecorrido = recorridoFidel2, image= "fidel.png", position= miRecorrido.camino().get(0)){}

object recorridoFidel1 inherits Recorrido(camino = self.ida()){
    override method ida(){
        return [game.at(15,6), game.at(16,6), game.at(17,6), game.at(18,6), game.at(19,6), game.at(19,5), game.at(19,4), game.at(19,3), game.at(19,2), game.at(19,1), game.at(19,0),
                game.at(18,0), game.at(17,0), game.at(16,0), game.at(15,0), game.at(14,0), game.at(13,0), game.at(12,0), game.at(11,0),
                game.at(11,1), game.at(11,2), game.at(11,3), game.at(11,4), game.at(11,5), game.at(11,6),
                game.at(12,6), game.at(13,6), game.at(14,6)]
    }

}
object recorridoFidel2 inherits Recorrido(camino = self.ida()){
    override method ida(){
        return [game.at(16,0), game.at(15,0), game.at(14,0), game.at(13,0), game.at(12,0), game.at(11,0),
                game.at(11,1), game.at(11,2), game.at(11,3), game.at(11,4), game.at(11,5), game.at(11,6),
                game.at(12,6), game.at(13,6), game.at(14,6), game.at(15,6), game.at(16,6), game.at(17,6),game.at(18,6), game.at(19,6), game.at(19,5), game.at(19,4), game.at(19,3), game.at(19,2), game.at(19,1), game.at(19,0),
                game.at(18,0), game.at(17,0)]
    }

}


class Transporte inherits Elemento(image = "pozo.png"){ //cambiar imagen!!
    override method meLlevaAlLago() = true

    method inicializar(){
        game.addVisual(self)

        

    }


}
object transporte1 inherits Transporte(position = game.at(6,0)){
    method destino() = game.at(18,6)
}
object transporte2 inherits Transporte(position = game.at(17,6)){
    method destino() = game.at(8,9)
    

}


 

