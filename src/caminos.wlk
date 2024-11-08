import wollok.game.*
import auto.*
import tablero.*
import barraSuperior.*

//FALTA ORDENAR Y REFACTORIZAR CLASES
class Calle {
  const property position
  
  method solida() = false
  
  method image()
  
  method esAgarrable() = false
}

class Esquina1 inherits Calle {
  //
  override method image() = "esquina-1.png"
}

class Esquina2 inherits Calle {
  override method image() = "esquina-2.png"
}

class Esquina3 inherits Calle {
  override method image() = "esquina-3.png"
}

class Esquina4 inherits Calle {
  override method image() = "esquina-4.png"
}

class CalleHorizontal inherits Calle {
  override method image() = "calle-horizontal.png"
}

class CalleVertical inherits Calle {
  override method image() = "calle-vertical.png"
}

class Cruce inherits Calle {
  override method image() = "cruce.png"
}

class Vereda {
  const property position
  
  method solida() = true
  
  method image() = "vereda.png"
  
  method esAgarrable() = false
}

class Casa {
  const property position
  
  method solida() = true
  
  method image() = "vereda.png"
  
  method esAgarrable() = false
}

class Casa1 inherits Casa {
  override method image() = "casa1.png"
}

class Casa2 inherits Casa {
  override method image() = "casa2.png"
}

class Casa3 inherits Casa {
  override method image() = "casa3.png"
}

class Obstaculo {
  const property position
  
  method solida() = false
  
  method image()
  
  method esAgarrable() = false
}

class Pozo inherits Obstaculo {
  override method image() = "pozo.png"
}

class Patrullero inherits Obstaculo {
  override method image() = "patrullero-.png"
}

class Valla inherits Obstaculo {
  override method solida() = true
  
  override method image() = "valla.png"
}

class Flecha {
  const property position
  
  method solida() = false
  
  method image() = "flecha-up.png"
  
  method esAgarrable() = false
}

class Arbol {
  const property position
  
  method solida() = false
  
  method image() = "arbol.png"
  
  method esAgarrable() = false
}