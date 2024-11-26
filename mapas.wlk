import wollok.game.*
import elementosDelMapa.*
import posiciones.*
import supertablero.*
import superMapa.*
import auto.*
import reloj.*


object barraSuperior inherits SuperMapa{
  override method posicionAuto() = game.at(0,0)
  override method imagenAuto() = derecha
  
  override method mapa (){
   return 
     [  
        [__, fr, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __],
        [ef, __, f5, __, f4, __, f3, __, f2, __, f1, __, fa, __, fm, __, fy, __, ft, __],
        [__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __],
        [__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __],
        [__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __],
        [__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __],
        [__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __],
        [__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __],
        [__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __],
        [__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __],
        [__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __],
        [__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __]
      ].reverse()
  }
}

object mapaInicial inherits SuperMapa(objetoImportante = yerba){
  override method posicionAuto() = game.at(2,2)
  override method imagenAuto() = derecha
  override method obstaculo() = libertario

  override method mapa() {
    return 
      [ [__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __],
        [__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __],
        [__, __, __, __, __, v1, tu, v1, n3, __, __, __, v1, tu, v1, n4, __, __, __, __],
        [__, __, __, __, __, v1, c1, v1, v1, v1, v1, v1, v1, c1, v1, v1, v1, v1, v1, v1],
        [__, __, __, __, __, v1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, o3, c1, c1, tr],
        [__, __, __, __, __, v1, c1, v1, v1, v1, v1, v1, v1, c1, v1, v1, v1, v1, v1, v1],
        [__, __, __, __, __, v1, c1, v1, __, __, __, __, v1, c1, v1, __, __, __, __, __],
        [__, __, n1, __, __, v1, c1, v1, __, __, __, __, v1, c1, v1, __, __, __, __, __],
        [__, __, v1, v1, v1, v1, c1, v1, __, __, __, __, v1, cy, v1, __, __, __, __, __],
        [__, __, c2, c4, c1, c5, c1, v1, __, __, __, __, v1, c1, v1, __, __, __, __, __],
        [__, __, v1, v1, v1, v1, pp, v1, __, __, __, __, v1, c1, v1, __, __, __, __, __],
        [es, __, n2, __, __, v1, c1, v1, m1, __, __, __, v1, td, v1, m6, __, __, __, __]
      ].reverse()
  }
}

object recorridoDeLibertario inherits Recorrido{
  const property camino =  [game.at(6,2) , game.at(6,3) , game.at(6,4) ,
                            game.at(6,5) , game.at(6,6) , game.at(6,7) ,
                            game.at(7,7) , game.at(8,7) , game.at(9,7),
                            game.at(10,7), game.at(11,7), game.at(12,7),
                            game.at(13,7), game.at(14,7), game.at(15,7),
                            game.at(16,7), game.at(17,7), game.at(18,7),
                            game.at(19,7), game.at(20,7)] 

  
  override method tieneQueReiniciarRecorrido(numero) = false
}

object libertario inherits Obstaculo(position = self.posicionInicial(), image = "libertario.png", miRecorrido = recorridoDeLibertario, dialogo = new Dialogo(image = "dialogo-libertario-.png")) {
  
  override method inicializar(){
    game.onCollideDo(calleAccionar1, {libertr => if(not self.yaSeEncuentraEnEjecucion()){self.algo()}}) // xq sino se agrega el dialogo cada vex que pasas por la celda y te da error de querer volver a ejecutar al libertario
  }

  method algo(){
    game.addVisual(self)
    game.onCollideDo(calleAccionar2, {libertr => self.inicializarCuandoPasaPorCelda()}) // xq sino se agrega el dialogo cada vex que pasas por la celda y te da error de querer volver a ejecutar al libertario

  }


  method yaSeEncuentraEnEjecucion()= game.allVisuals().contains(self)
  
  method inicializarCuandoPasaPorCelda(){
    self.agregarDialogo()

    self.interaccion()
    
    game.onTick(100, "Libertario camina", {self.caminar()}) 
  }

  method interaccion(){
    reloj.descontarTiempo(10) 
  }

  method elAutoEstaCerca(){
    return auto.position() != game.at(3,2)
  }

  override method caminar(){
    if (self.elAutoEstaMasCerca()) {
      image = ("libertario-corriendo.png")
      super()
    }
  }

  method elAutoEstaMasCerca(){
    return auto.position().x() >= (self.posicionInicial().x() - 1)
  }

  method posicionInicial(){
    return game.at(6, 2)
  }

  method puedoEscapar() {
    return miRecorrido.ultimaPosicionRecorrido() == position
  }

  method escapar(){
    //game.removeVisual(self) NECESITO QUE QUEDE EN EL TABLERO PARA QUE NO SE EJECUTE EL ONCOLLIDEDO
    game.removeTickEvent("Libertario camina")

  }

  override method siguienteInstancia(){
    if(self.puedoEscapar()){
      self.escapar()
    } else {
      instanciaRecorrido += 1 
    }
  }
}


object mapaFinal inherits SuperMapa{
  override method posicionAuto() = game.at(19,7)
  override method imagenAuto() = izquierda

  override method mapa() {
    return 
      [ [__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __],
        [__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __],
        [__, __, __, __, __, v1, c2, v1, n3, __, __, __, v1, c2, v1, n4, __, __, __, __],
        [__, __, __, __, __, v1, c1, v1, v1, v1, v1, v1, v1, c1, v1, v1, v1, v1, v1, v1],
        [__, __, __, __, __, v1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1],
        [__, __, __, __, __, v1, c1, v1, v1, v1, v1, v1, v1, c1, v1, v1, v1, v1, v1, v1],
        [__, __, __, __, __, v1, c1, v1, __, __, __, __, v1, c1, v1, __, __, __, __, __],
        [__, __, n1, __, __, v1, c1, v1, __, __, __, __, v1, c1, v1, __, __, __, __, __],
        [__, __, v1, v1, v1, v1, c1, v1, __, __, __, __, v1, c1, v1, __, __, __, __, __],
        [__, __, c3, c1, c1, c1, c1, v1, __, __, __, __, v1, o5, v1, __, __, __, __, __],
        [__, __, v1, v1, v1, v1, c1, v1, __, __, __, __, v1, c1, v1, __, __, __, __, __],
        [es, __, n2, __, __, v1, pp, v1, m1, __, __, __, v1, c2, v1, m6, __, __, __, __]
      ].reverse()
  }
}

object mapa1 inherits SuperMapa(objetoImportante = termo){
  override method posicionAuto() = game.at(1,0)
  override method imagenAuto() = arriba
  override method obstaculo() = viejita 

  override method mapa() {
    return 
      [ [__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __], 
        [__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __], 
        [__, __, __, v1, v1, v1, v1, v1, __, __, v1, v1, v1, v1, v1, v1, v1, v1, v1, v1], 
        [__, __, __, v1, c1, c1, c1, v1, __, __, v1, c1, c1, c1, c1, v1, c1, c1, c1, v1], 
        [__, __, __, v1, c1, v1, c1, v1, __, __, v1, c1, v1, v1, c1, v1, c1, v1, c1, v1], 
        [m8, __, __, v1, c1, v1, c1, v1, m0, __, v1, c1, pp, ct, c1, c1, c1, c1, c1, tr], 
        [v1, v1, v1, c1, c1, v1, c1, c1, v1, v1, v1, c1, v1, v1, v1, v1, v1, v1, v1, v1], 
        [v1, c1, c1, c1, v1, v1, v1, c1, c1, c1, c1, c1, c1, v1, v1, v1, v1, v1, v1, v1], 
        [v1, c1, v1, v1, __, __, v1, c1, v1, v1, v1, v1, c1, c1, c1, c1, c1, c1, c1, tr], 
        [v1, c1, v1, __, __, __, v1, c1, v1, v1, v1, v1, c1, v1, v1, v1, v1, v1, v1, v1], 
        [v1, c1, v1, __, __, __, v1, c1, c1, c1, c1, c1, c1, c1, c1, o4, c1, v1, __, __], 
        [v1, c1, v1, n9, __, __, v1, v1, v1, v1, td, v1, v1, v1, v1, v1, td, v1, n5, __]
      ].reverse()
  }
}

object recorridoDeViejita inherits Recorrido{
  const property camino = [game.at(3,3), game.at(3,4), game.at(4,5)] 
  
}

object viejita inherits ObstaculoInteractivo(image = "viejita.png", miRecorrido = recorridoDeViejita, dialogo = new Dialogo(image = "dialogo-viejita-.png" )){
  override method casitigoPorAtraparlo(){
    reloj.descontarTiempo(15)
  }

  override method inicializar(){
    game.addVisual(self)
    game.onTick(600, "object", {self.caminar()})
  }
}

object mapa2 inherits SuperMapa(objetoImportante = agua){
  override method posicionAuto() = game.at(0,3)
  override method imagenAuto() = derecha
  override method obstaculo() = bondi

    override method mapa() {
    return 
      [ [__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __],
        [__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __],
        [__, __, v1, tu, v1, __, __, n7, __, __, v1, tu, v1, n6, __, __, __, __, __, __],  
        [__, __, v1, c1, v1, __, __, v1, v1, v1, v1, c1, v1, v1, v1, v1, v1, v1, v1, v1],
        [__, __, v1, mc, v1, __, __, v1, c1, c1, c1, c1, c1, c1, c1, c1, c1, pp, c1, tr],
        [__, __, v1, c1, v1, __, __, v1, c1, v1, v1, v1, v1, v1, v1, c1, v1, v1, v1, v1],
        [m5, __, v1, c1, v1, m4, __, v1, c1, v1, n4, __, __, __, v1, c1, v1, n7, __, __],
        [v1, v1, v1, c1, v1, v1, v1, v1, c1, v1, v1, v1, v1, v1, v1, c1, v1, v1, v1, v1],
        [c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, tr],
        [v1, v1, v1, cv, v1, v1, v1, v1, v1, v1, v1, v1, v1, v1, v1, c1, v1, v1, v1, v1],
        [__, __, v1, c1, v1, __, __, __, __, __, __, __, __, __, v1, c1, c1, ca, c1, tr],
        [n5, __, v1, td, v1, m7, __, __, __, __, __, __, __, __, v1, v1, v1, v1, v1, v1]
      ].reverse()
  }
  
}

object recorridoBondi inherits Recorrido{

  const property camino = [ game.at(-2,3), game.at(-1,3), game.at(0,3) ,
                            game.at(2,3) , game.at(3,3) , game.at(4,3) ,
                            game.at(5,3) , game.at(6,3) , game.at(7,3) ,
                            game.at(8,3) , game.at(9,3) , game.at(10,3),
                            game.at(11,3), game.at(12,3), game.at(13,3),
                            game.at(14,3), game.at(15,3), game.at(16,3),
                            game.at(17,3), game.at(18,3), game.at(19,3)] 
  
}

object bondi inherits ObstaculoInteractivo(image = "324-.png",miRecorrido = recorridoBondi, dialogo = new Dialogo(image = "dialogo-bondi-.png" )){
  override method casitigoPorAtraparlo(){
    reloj.descontarTiempo(5)
  }

}

object mapa3 inherits SuperMapa(objetoImportante = mate){
  override method posicionAuto() = game.at(0,8)
  override method imagenAuto() = derecha
  override method obstaculo() = policia


  override method mapa() {
    return 
      [ [__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __],
        [__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __],
        [v1, v1, v1, v1, v1, v1, v1, v1, v1, v1, v1, v1, v1, v1, v1, __, __, __, __, __],
        [c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, v1, __, __, __, __, __],
        [v1, v1, c1, v1, v1, v1, v1, v1, v1, v1, v1, v1, v1, c1, v1, __, __, __, __, __],
        [__, v1, c1, v1, __, __, __, __, __, __, __, __, v1, c1, v1, m9, __, __, __, __],
        [__, v1, c1, v1, __, __, __, __, __, __, __, __, v1, c1, v1, v1, v1, v1, v1, v1],
        [__, v1, c1, v1, __, __, __, __, __, __, __, __, v1, c1, c1, c1, c1, c1, c1, tr],
        [n8, v1, o2, v1, m2, __, __, __, __, __, __, __, v1, c1, v1, v1, v1, v1, v1, v1],
        [v1, v1, pp, v1, v1, v1, v1, v1, v1, v1, v1, v1, v1, c1, v1, __, __, __, __, __],
        [tl, c1, c1, c1, c1, c1, cm, c1, c1, c1, c1, c1, c1, c1, v1, __, __, __, __, __],
        [v1, v1, v1, v1, v1, v1, v1, v1, v1, v1, v1, v1, v1, v1, v1, m3, __, __, __, __]
      ].reverse()
  }
}

object policia inherits ObstaculoInteractivo(miRecorrido = recorridoPoli, image = "elPoli.png", dialogo = new Dialogo(image = "dialogo-policia-.png" )){
  override method casitigoPorAtraparlo(){
    reloj.descontarTiempo(10)
    auto.position(mapa3.posicionAuto())

  } 
}

object recorridoPoli inherits Recorrido{
  var camino = null

  method initialize(){
    const ida = [ /*calle izquierda*/ game.at(2,3), game.at(2,4), game.at(2,5), game.at(2,6), game.at(2,7), game.at(2,8),
                  /*calle arriba */   game.at(3,8), game.at(4,8), game.at(5,8),  game.at(6,8), game.at(7,8), game.at(8,8), game.at(9,8), game.at(10,8), game.at(11,8), game.at(12,8), game.at(13,8),
                  /*calle derecha */  game.at(13,7), game.at(13,6), game.at(13,5), game.at(13,4), game.at(13,3), game.at(13,2), game.at(13,1),
                  /*calle abajo */    game.at(12,1), game.at(11,1), game.at(10,1), game.at(9,1), game.at(8,1), game.at(7,1), game.at(6,1), game.at(5,1), game.at(4,1), game.at(3,1), game.at(2,1)
                ]
    camino = ida + ida.reverse()
  }

  override method camino(){
    return camino
  }


}


