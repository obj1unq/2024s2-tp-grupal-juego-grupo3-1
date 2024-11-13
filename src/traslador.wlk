import wollok.game.*
import elementosDelMapa.*

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