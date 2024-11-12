import wollok.game.*
import caminos2.*

class Traslador inherits Calle {
  const property meTraslada = true
}

class TrasladorDerecha inherits Traslador {
  override method image() = "flecha-derecha.png"
}

class TrasladorIzquierda inherits Traslador {
  override method image() = "flecha-izquierda.png"
}

class TrasladorArriba inherits Traslador {
  override method image() = "flecha-arriba.png"
}

class TrasladorAbajo inherits Traslador {
  override method image() = "flecha-abajo.png"
}