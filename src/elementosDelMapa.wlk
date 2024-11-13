class Elemento{
  var property image
  var property position
  method solida()
  method esAgarrable()
  method meTraslada() 
}

class Calle inherits Elemento (image = "calle.png"){
  override method esAgarrable() = false
  override method solida() = false
  override method meTraslada() = false
}

class Vereda inherits Elemento (image = "vereda.png"){
  override method solida() = true
  override method esAgarrable() = false
  override method meTraslada() = false
}

class Casa inherits Elemento {
  override method solida() = true
  override method esAgarrable() = false
  override method meTraslada() = false
}

class Casa1 inherits Casa (image = "casa1-.png"){
}

class Casa2 inherits Casa (image =  "casa2-.png"){
}

class Casa3 inherits Casa (image = "casa3-.png"){
}

class Obstaculo inherits Elemento {  
  override method meTraslada() = false
  override method solida() = true
  override method esAgarrable() = false
}

class Pozo inherits Obstaculo (image = "pozo.png") {
  override method solida() = false
}

class Patrullero inherits Obstaculo (image = "patrullero-.png")  {
}

class Valla inherits Obstaculo (image = "valla.png")  {
}

class Arbol inherits Elemento (image = "arbol.png") {
  override method solida() = false
  override method esAgarrable() = false
  override method meTraslada() = false
}