import wollok.game.*
import barraSuperior.*
import elementos.*

class Cosa inherits Elemento{

  override method esAgarrable() = true
  override method solida() = false
  override method meTraslada() = false

  var property recogido = false

  method frame()
  
  method cosaALaBarra() {
    position = self.frame().position()
    recogido = true
  }
}

class Termo inherits Cosa{
  const property image = "termo_.png"
  override method frame() = frameTermo
}

class Yerba inherits Cosa {
  const property image = "yerba_.png"
  override method frame() = frameYerba
}

class Dispenser inherits Cosa {
  const property image = "disp.png"
  override method frame() {
    
  }
  
  override method cosaALaBarra() {
    super()
    game.removeVisual(self)
  }
}

object agua {
  const property image = "agua_.png"
  var property position = null
}

class Mate inherits Cosa{
  const property image = "mate.png"
  override method frame() = frameMate
} 

//Bonusssssss

class Manzanita inherits Cosa{
  const property image = "manzana_.png"
  override method frame() = frameManzanita
}

class Bizcochitos inherits Cosa {
  const property image = "bizcochitos_.png"
  override method frame() = frameBizcochitos
}

class Palmeritas inherits Cosa{
  const property image = "palmeritas_.png"
  override method frame() = framePalmeritas
}

class Faso inherits Cosa{
  const property image = "faso.png"
  override method frame() = frameFaso
}