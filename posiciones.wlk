import wollok.game.*

object arriba {
  method siguiente(position) = position.up(1)
  
  method orientacion() = "Arriba"
}

object abajo {
  method siguiente(position) = position.down(1)
  
  method orientacion() = "Abajo"
}

object izquierda {
  method siguiente(position) = position.left(1)
  
  method orientacion() = "Izquierda"
}

object derecha {
  method siguiente(position) = position.right(1)
  
  method orientacion() = "Derecha"
}