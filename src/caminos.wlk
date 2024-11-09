import barraSuperior.*
import elementos.*


class CalleMadre inherits Elemento{
  override method esAgarrable() = false
  override method solida() = false
}

class Esquina1 inherits CalleMadre {
  //
  const property image = "esquina-1.png"
}

class Esquina2 inherits CalleMadre {
  const property image = "esquina-2.png"
}

class Esquina3 inherits CalleMadre {
  const property image = "esquina-3.png"
}

class Esquina4 inherits CalleMadre {
  const property image = "esquina-4.png"
}

class CalleHorizontal inherits CalleMadre {
  const property image = "calle-horizontal.png"
}

class CalleVertical inherits CalleMadre {
  const property image = "calle-vertical.png"
}

class Cruce inherits CalleMadre {
  const property image = "cruce.png"
}

class Vereda inherits Elemento{

  override method solida() = true
  override method esAgarrable() = false
  const property image = "vereda.png"
}

class Casa inherits Elemento{
  
  override method solida() = true
  override method esAgarrable() = false

}

class Casa1 inherits Casa {
  const property image = "casa1.png"
}

class Casa2 inherits Casa {
  const property image = "casa2.png"
}

class Casa3 inherits Casa {
  const property image = "casa3.png"
}

class Obstaculo inherits Elemento {  

  override method solida() = true
  override method esAgarrable() = false
}

class Pozo inherits Obstaculo {
  override method solida() = false
  const property image = "pozo.png"
}

class Patrullero inherits Obstaculo {

  const property image = "patrullero-.png"
}

class Valla inherits Obstaculo {
  const property image = "valla.png"
}

class Arbol inherits Elemento{
  
  override method solida() = false
  
  const property image = "arbol.png"
  
  override method esAgarrable() = false
}