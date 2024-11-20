import wollok.game.*
import barraSuperior.*
import elementosDelMapa.*

class Cosa inherits Elemento{
  override method esAgarrable() = true
  
  var property recogido = false

  method frame()
  
  method cosaALaBarra() {
    game.sound("sonidoAgarrar2.mp3").play()
    self.image(self.cosaEnElFrame()) 
    position = self.frame().position()
    recogido = true
  }

  method cosaEnElFrame()
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

//Bonusssssss

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