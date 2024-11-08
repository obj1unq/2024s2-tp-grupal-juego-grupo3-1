import wollok.game.*
import auto.*
import tablero.*
import barraSuperior.*

class Cosa {
  var property image
  var property position
  var property recogido = false
  
  method frame()
  
  method cosaALaBarra() {
    position = self.frame().position()
    recogido = true
  }
  
  method solida() = false
  
  method esAgarrable() = true
}

class Termo inherits Cosa (image = "termo_.png") {
  override method frame() = frameTermo
}

class Yerba inherits Cosa (image = "yerba_.png") {
  override method frame() = frameYerba
}

class Dispenser inherits Cosa (image = "disp.png") {
  override method frame() {
    
  }
  
  override method cosaALaBarra() {
    super()
    game.removeVisual(self)
  }
}

object agua {
  var property image = "agua_.png"
  var property position = null
}

class Mate inherits Cosa (image = "mate.png") {
  override method frame() = frameMate
} 

//Bonusssssss

class Manzanita inherits Cosa (image = "manzana_.png") {
  override method frame() = frameManzanita
}

class Bizcochitos inherits Cosa (image = "bizcochitos_.png") {
  override method frame() = frameBizcochitos
}

class Palmeritas inherits Cosa (image = "palmeritas_.png") {
  override method frame() = framePalmeritas
}

class Faso inherits Cosa (image = "faso.png") {
  override method frame() = frameFaso
}