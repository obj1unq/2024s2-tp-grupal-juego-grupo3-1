import wollok.game.*

object arriba {
  method siguiente(position) = position.up(1)
  
  method image() = "autoHaciaArriba.png"
}

object abajo {
  method siguiente(position) = position.down(1)
  
  method image() = "autoHaciaAbajo.png"
}

object izquierda {
  method siguiente(position) = position.left(1)
  
  method image() = "autoHaciaIzquierda.png"
}

object derecha {
  method siguiente(position) = position.right(1)
  
  method image() = "autoHaciaDerecha.png"
}