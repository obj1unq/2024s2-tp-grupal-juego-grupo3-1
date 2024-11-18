class Elemento {
  var property image
  var property position
  
  method solida() = false
  
  method esAgarrable() = false
  
  method meTraslada() = false

  method meLlevaAlLago() = false

}

class Calle inherits Elemento (image = "calle.png") {
}

class Inicio inherits Calle {
  override method solida() = true
}

class Final inherits Elemento(image = "llegada.png"){
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

class ModuloCasas1 inherits Casa(image = "modulo_casas_1.png"){}
class ModuloCasas2 inherits Casa(image = "modulo_casas_2.png"){}
class ModuloCasas3 inherits Casa(image = "modulo_casas_3.png"){}
class ModuloCasas4 inherits Casa(image = "modulo_casas_4.png"){}
class ModuloCasas5 inherits Casa(image = "modulo_casas_5.png"){}


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

class Arbol inherits Elemento (image = "arbol2.png") {
  
}
class Arbusto inherits Elemento (image = "arbusto_2.png") {
  override method solida() = true
}

class Laguna inherits Elemento (image = "laguna-2.png") {  
}

class Arbusto2 inherits Elemento (image = "arbusto2.png"){

}

class Estacionamiento inherits Elemento(image = "estacionamiento.png"){
  override method solida() = true
}

class Traslador inherits Calle {
  override method meTraslada() = true
}

class TrasladorDerecha inherits Traslador ( image = "flecha-derecha-.png"){
}

class TrasladorIzquierda inherits Traslador (image = "flecha-izquierda-.png") {
}

class TrasladorArriba inherits Traslador (image = "flecha-arriba-.png"){
}

class TrasladorAbajo inherits Traslador (image = "flecha-abajo-.png") {
}