import wollok.game.*
import elementosDelMapa.*
import reloj.*

class Cosa inherits Elemento{
  var property recogido = false
  
  override method esAgarrable() = true
 
  method frame()
  
  method cosaEnElFrame()

  method posicionDelFrame(){
    return self.frame().position()
  }
  
  method esAgarrada() {
    self.sonidoAlAgarrar()
    self.image(self.cosaEnElFrame()) 
    position = self.posicionDelFrame()
    recogido = true
  }

  method sonidoAlAgarrar(){
    game.sound("sonidoAgarrar2.mp3").play()
  }
}

class CosaConBonus inherits Cosa{
  override method esAgarrada() {
    super()
    reloj.agregarTiempo(5)
  }
}

class Termo inherits Cosa (image = "termo--.png"){
  override method frame() = frameTermo
  override method cosaEnElFrame() = "termo-verde.png"
}
class Yerba inherits Cosa (image =  "yerba--.png") {
  override method frame() = frameYerba
  override method cosaEnElFrame() = "yerba-cara-unq.png"
}
class Agua inherits Cosa (image =  "agua--.png") {
  override method frame() = frameAgua
  override method cosaEnElFrame() = "agua-para-mate.png"
}
class Mate inherits Cosa (image =  "mate--.png"){
  override method frame() = frameMate
  override method cosaEnElFrame() = "mate-lavado.png"
} 

//Bonus
class Manzanita inherits Cosa (image =  "manzana_.png"){
  override method frame() = frameManzanita
  override method cosaEnElFrame() = "mbrillante.png"
}
class Bizcochitos inherits Cosa (image = "bizcochitos_.png") {
  override method frame() = frameBizcochitos
  override method cosaEnElFrame() = "bbrillante.png"
}
class Palmeritas inherits Cosa (image = "palmeritas_.png"){
  override method frame() = framePalmeritas
  override method cosaEnElFrame() = "pbrillante.png"
}
class Faso inherits Cosa (image = "fasito.png"){
  override method frame() = frameFaso
  override method cosaEnElFrame() = "fbrillante.png"
}
class Medialuna inherits Cosa (image = "medialuna-.png"){
  override method frame() = frameMedialuna
  override method cosaEnElFrame() = "mebrillante.png"
}


