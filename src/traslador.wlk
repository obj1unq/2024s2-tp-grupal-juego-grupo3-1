import wollok.game.*
import caminos.*

class Traslador inherits Calle {
  override method meTraslada() = true
}

class TrasladorDerecha inherits Traslador {
  const property image = "flecha-derecha-.png"
}

class TrasladorIzquierda inherits Traslador {
  const property image = "flecha-izquierda-.png"
}

class TrasladorArriba inherits Traslador {
  const property image = "flecha-arriba-.png"
}

class TrasladorAbajo inherits Traslador {
  const property image = "flecha-abajo-.png"
}