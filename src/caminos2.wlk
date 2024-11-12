import elementos.*


class Calle inherits Elemento{
  
  override method image() = "calle.png"
}


class Vereda inherits Elemento{

  override method solida() = true
  override method esAgarrable() = false
  override method meTraslada() = false

  override method image() ="vereda.png"
}

class Casa inherits Elemento{
  
  override method solida() = true
  override method esAgarrable() = false
  override method meTraslada() = false
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

class Obstaculo inherits Elemento {  
  override method meTraslada() = false
  override method solida() = true
  override method esAgarrable() = false
}

class Pozo inherits Obstaculo {
  override method solida() = false
  override method image() = "pozo.png"
}

class Patrullero inherits Obstaculo {
  override method image() = "patrullero-.png"
}

class Valla inherits Obstaculo {
  override method image() = "valla.png"
}

class Arbol inherits Elemento{
  
  override method solida() = false
  
  override method image() = "arbol.png"
  override method esAgarrable() = false
  
  override method meTraslada() = false
}