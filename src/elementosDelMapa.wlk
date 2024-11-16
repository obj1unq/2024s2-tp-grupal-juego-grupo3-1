class Elemento {
  var property image
  var property position
  
  method solida() = false
  
  method esAgarrable() = false
  
  method meTraslada() = false
}

class Calle inherits Elemento (image = "calle.png") {
}

class Vereda inherits Elemento (image = "vereda.png") {
  override method solida() = true
}

class Casa inherits Elemento {
  override method solida() = true
}

class Casa1 inherits Casa (image = "casa1-.png") {
  
}

class Casa2 inherits Casa (image = "casa2-.png") {
  
}

class Casa3 inherits Casa (image = "casa3-.png") {
  
}

class Obstaculo inherits Elemento {
  override method solida() = true
}

class Pozo inherits Obstaculo (image = "pozo.png") {
  override method solida() = false
}

class Patrullero inherits Obstaculo (image = "patrullero_.png") {
  
}

class Valla inherits Obstaculo (image = "valla.png") {
  
}

class Arbol inherits Elemento (image = "arbol.png") {
  
}
class Arbusto inherits Elemento (image = "arbusto.png") {
  override  method solida() = true
}

class Laguna inherits Elemento (image = "laguna.png") {  
}