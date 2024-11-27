import wollok.game.*
import supertablero.*
import auto.*
import reloj.*

class Elemento {
  var property image = null
  var property position = null
  
  method solida() = false
  
  method esAgarrable() = false
  
  method meTraslada() = false
  
  method esMeta() = false
}

class Frame inherits Elemento {
  override method solida() = true
}

class Cosa inherits Elemento {
  override method esAgarrable() = true
  
  method frame()
  
  method cosaEnElFrame()
  
  method posicionDelFrame() = self.frame().position()
  
  method esAgarrada() {
    self.sonidoAlAgarrar()
    image = self.cosaEnElFrame()
    position = self.posicionDelFrame()
  }
  
  method sonidoAlAgarrar() {
    game.sound("sonidoAgarrar2.mp3").play()
  }
}

class CosaConBonus inherits Cosa {
  override method esAgarrada() {
    super()
    reloj.agregarTiempo(10)
  }
} 

//OBSTACULO INTERACTIVO

class Obstaculo inherits Elemento {
  const miRecorrido
  const property dialogo
  var property activo = false
  
  method inicializar() {
    activo = true
    game.addVisual(self)
    self.repeticionCaminar()
  }
  
  method repeticionCaminar() {
    game.onTick(500, "object", { self.caminar() })
  }
  
  method caminar() {
    miRecorrido.siguienteInstancia()
    position = miRecorrido.nuevaPosicion()
  }
  
  method agregarDialogo() {
    if (activo and not superTablero.estaEnElTablero(dialogo)) {
      game.addVisual(dialogo)
      game.schedule(5000, { game.removeVisual(dialogo) })
    }
  }
}

class Dialogo {
  const property position = game.at(0, 0)
  const property image
}

class ObstaculoInteractivo inherits Obstaculo (position = miRecorrido.primeraPosicion()) {
  method casitigoPorAtraparlo()
  
  override method caminar() {
    super()
    self.verificarSiChocoConAuto()
  }
  
  method verificarSiChocoConAuto() {
    if (self.atrapoAuto()) {
      self.agregarDialogo()
      self.casitigoPorAtraparlo()
    }
  }
  
  method atrapoAuto() = self.elAutoEstaEnMismaPosicion() or self.elAutoEstaAdelante() or self.elAutoEstaAtras()
  
  method elAutoEstaEnMismaPosicion() = superTablero.cosasCon(self).contains(auto)
  
  method elAutoEstaAdelante() = miRecorrido.estaEnSiguiente()
  
  method elAutoEstaAtras() = miRecorrido.estaEnAnterior()
}

class Recorrido {
  var instanciaRecorrido = 0
  
  method camino()
  
  method siguienteInstancia() {
    if (self.tieneQueReiniciarRecorrido()) {
      instanciaRecorrido = 0
    } else {
      instanciaRecorrido += 1
    }
  }

  
  method largoCamino() = self.camino().size()
  
  method tieneQueReiniciarRecorrido() = instanciaRecorrido == (self.largoCamino() - 1)
  
  method nuevaPosicion() = self.camino().get(instanciaRecorrido)
  
  method posicionSiguienteEnLista() = if ( self.siguienteNoEsUltimaPosicion() ) 
                                           self.camino().get(instanciaRecorrido + 1)
                                      else self.camino().get(instanciaRecorrido)
  
  method  siguienteNoEsUltimaPosicion() = instanciaRecorrido + 1 < self.largoCamino()

  method  anteriorNoEsPrimeraPosicion() = instanciaRecorrido - 1 >= 0

  method posicionAnteriorEnLista() = if (self.anteriorNoEsPrimeraPosicion())
                                       self.camino().get(instanciaRecorrido - 1)
                                     else self.camino().get(instanciaRecorrido)
  
  method ultimaPosicionRecorrido() = self.camino().get(self.largoCamino() - 1)
  
  method primeraPosicion() = self.camino().get(0)
  
  method estaEnSiguiente() = auto.estaEnPosicion(self.posicionSiguienteEnLista())
  
  method estaEnAnterior() = auto.estaEnPosicion(self.posicionAnteriorEnLista())
}

//Obligatorios
object termo inherits Cosa (image = "termo--.png") {
  override method frame() = frameTermo
  override method cosaEnElFrame() = "termo-verde.png"
}

object yerba inherits Cosa (image = "yerba--.png") {
  override method frame() = frameYerba
  override method cosaEnElFrame() = "yerba-cara-unq.png"
}

object agua inherits Cosa (image = "agua--.png") {
  override method frame() = frameAgua
  override method cosaEnElFrame() = "agua-para-mate.png"
}

object mate inherits Cosa (image = "mate--.png") {
  override method frame() = frameMate
  override method cosaEnElFrame() = "mate-lavado.png"
} 

//Bonus
object manzanita inherits CosaConBonus (image = "manzana_.png") {
  override method frame() = frameManzanita
  override method cosaEnElFrame() = "mbrillante.png"
}

object bizcochitos inherits CosaConBonus (image = "bizcochitos_.png") {
  override method frame() = frameBizcochitos
  override method cosaEnElFrame() = "bbrillante.png"
}

object palmeritas inherits CosaConBonus (image = "palmeritas_.png") {
  override method frame() = framePalmeritas
  override method cosaEnElFrame() = "pbrillante.png"
}

object faso inherits CosaConBonus (image = "fasito.png") {
  override method frame() = frameFaso
  override method cosaEnElFrame() = "fbrillante.png"
}

object medialuna inherits CosaConBonus (image = "medialuna-.png") {
  override method frame() = frameMedialuna
  override method cosaEnElFrame() = "mebrillante.png"
}

object frameTermo inherits Frame (image = "frame-termo-verde--.png") {
}

object frameMate inherits Frame (image = "frame-mate-lavado--.png") {
}

object frameYerba inherits Frame (image = "frame-yerba-cara--.png") {
  
}

object frameAgua inherits Frame (image = "frame-agua-mate---.png") {
  
}

class FramePregunta inherits Frame (image = "frame-bonus--.png") {
  
}

object frameManzanita inherits FramePregunta {
  
}

object frameBizcochitos inherits FramePregunta {
  
}

object framePalmeritas inherits FramePregunta {
  
}

object frameFaso inherits FramePregunta {
  
}

object frameMedialuna inherits FramePregunta {
  
}

object extraFrame inherits Frame (image = "realframe.png") {
  
}

class Calle inherits Elemento (image = "calle.png") {
  
}

object calleAccionar1 inherits Calle {
  
}

object calleAccionar2 inherits Calle {
  
}

class Inicio inherits Calle {
  override method solida() = true
}

class Final inherits Elemento (image = "llegada.png") {
  override method esMeta() = true
}

class Vereda inherits Elemento (image = "vereda.png") {
  override method solida() = true
}

class Casa inherits Elemento {
  override method solida() = true
}

class ModuloCasas1 inherits Casa (image = "m1.png") {
  
}

class ModuloCasas2 inherits Casa (image = "m2.png") {
  
}

class ModuloCasas3 inherits Casa (image = "m3.png") {
  
}

class ModuloCasas4 inherits Casa (image = "m4.png") {
  
}

class ModuloCasas5 inherits Casa (image = "m5.png") {
  
}

class ModuloCasas6 inherits Casa (image = "m6.png") {
  
}

class ModuloCasas7 inherits Casa (image = "m7.png") {
  
}

class ModuloCasas8 inherits Casa (image = "m8.png") {
  
}

class ModuloCasas9 inherits Casa (image = "m9.png") {
  
}

class ModuloCasas0 inherits Casa (image = "m0.png") {
  
}

class ModuloCasas10 inherits Casa (image = "n1.png") {
  
}

class ModuloCasas11 inherits Casa (image = "n2.png") {
  
}

class ModuloCasas12 inherits Casa (image = "n3.png") {
  
}

class ModuloCasas13 inherits Casa (image = "n4.png") {
  
}

class ModuloCasas14 inherits Casa (image = "n5.png") {
  
}

class ModuloCasas15 inherits Casa (image = "n6.png") {
  
}

class ModuloCasas16 inherits Casa (image = "n7.png") {
  
}

class ModuloCasas17 inherits Casa (image = "n8.png") {
  
}

class ModuloCasas18 inherits Casa (image = "n9.png") {
  
}

class Pozo inherits Elemento (image = "pozo.png") {
  override method solida() = false
}

class Obstruccion inherits Elemento {
  override method solida() = true
}

class Patrullero inherits Obstruccion (image = "patrullero_.png") {
  
}

class Valla inherits Obstruccion (image = "valla.png") {
  
}

class Arbol inherits Elemento (image = "arbol2.png") {
  
}

class Arbusto2 inherits Elemento (image = "arbusto2.png") {
  
}

class Estacionamiento inherits Elemento (image = "estacionamiento.png") {
  override method solida() = true
}

class Traslador inherits Calle {
  override method meTraslada() = true
}

class TrasladorDerecha inherits Traslador (image = "flecha-derecha-.png") {
  
}

class TrasladorIzquierda inherits Traslador (image = "flecha-izquierda-.png") {
  
}

class TrasladorArriba inherits Traslador (image = "flecha-arriba-.png") {
  
}

class TrasladorAbajo inherits Traslador (image = "flecha-abajo-.png") {
  
} 