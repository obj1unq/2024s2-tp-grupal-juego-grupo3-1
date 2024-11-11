
class Elemento{
//ESTO ESTA MAL, PERO WOLLOK NOS MARCA ERROR EN LA CLASE CALLE AL IMPORTAR EL ARCHIVO ELEMENTOS
//VER COMO SOLUCIONARLOS CON LOS PROFES
  method image()
  var property position
  method solida()
  method esAgarrable()
  method esTraslador() //??? capaz va mejor en la clase calle
}
class Calle inherits Elemento{
  override method esAgarrable() = false
  override method solida() = false
  override method esTraslador() = false
}

class Esquina1 inherits Calle {
  //
  const property image = "esquina-1.png"
}

class Esquina2 inherits Calle {
  const property image = "esquina-2.png"
}

class Esquina3 inherits Calle {
  const property image = "esquina-3.png"
}

class Esquina4 inherits Calle {
  const property image = "esquina-4.png"
}

class CalleHorizontal inherits Calle {
  const property image = "calle-horizontal.png"
}

class CalleVertical inherits Calle {
  const property image = "calle-vertical.png"
}

class Cruce inherits Calle {
  const property image = "cruce.png"
}

class Vereda inherits Elemento{

  override method solida() = true
  override method esAgarrable() = false
  override method esTraslador() = false

  const property image = "vereda.png"
}

class Casa inherits Elemento{
  
  override method solida() = true
  override method esAgarrable() = false
  override method esTraslador() = false
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
  override method esTraslador() = false
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
  
  override method esTraslador() = false
}