import wollok.game.*
import auto.*
import reloj.*

class Elemento {
  var property image = null
  var property position = null
  
  method solida() = false
  method esAgarrable() = false
  method meTraslada() = false
}

class Frame {
  const property image
  var property position = null 

  method solida() = true
}

class Cosa inherits Elemento{
  var property recogido = false
  
  override method esAgarrable() = true
 
  method frame()
  
  method cosaEnElFrame()

  method posicionDelFrame(){
    return self.frame().position()
  }
  
  method esAgarrada() {
    self.sonidoAlAgarrar()
    image = self.cosaEnElFrame() 
    position = self.posicionDelFrame()
    recogido = true
  }

  method sonidoAlAgarrar(){
    game.sound("sonidoAgarrar2.mp3").play()
  }
}

class CosaConBonus inherits Cosa{
  override method esAgarrada() {
    super()
    reloj.agregarTiempo(5)
  }
}

class Termo inherits Cosa{
  override method frame() = frameTermo
  override method cosaEnElFrame() = "termo-verde.png"
}

class Yerba inherits Cosa {
  override method frame() = frameYerba
  override method cosaEnElFrame() = "yerba-cara-unq.png"
}



class Agua inherits Cosa {
  override method frame() = frameAgua
  override method cosaEnElFrame() = "agua-para-mate.png"
}

class Mate inherits Cosa {
  override method frame() = frameMate
  override method cosaEnElFrame() = "mate-lavado.png"
} 

//Bonus
class Manzanita inherits Cosa (image =  "manzana_.png"){
  override method frame() = frameManzanita
  override method cosaEnElFrame() = "mbrillante.png"
}
class Bizcochitos inherits Cosa (image = "bizcochitos_.png") {
  override method frame() = frameBizcochitos
  override method cosaEnElFrame() = "bbrillante.png"
}
class Palmeritas inherits Cosa (image = "palmeritas_.png"){
  override method frame() = framePalmeritas
  override method cosaEnElFrame() = "pbrillante.png"
}
class Faso inherits Cosa (image = "fasito.png"){
  override method frame() = frameFaso
  override method cosaEnElFrame() = "fbrillante.png"
}
class Medialuna inherits Cosa (image = "medialuna-.png"){
  override method frame() = frameMedialuna
  override method cosaEnElFrame() = "mebrillante.png"
}

object frameTermo inherits Frame(image = "frame-termo-verde--.png"){
}
object frameMate inherits Frame(image = "frame-mate-lavado--.png"){
}
object frameYerba inherits Frame(image = "frame-yerba-cara--.png"){
}
object frameAgua inherits Frame(image =  "frame-agua-mate---.png"){
}
class FramePregunta inherits Frame(image = "frame-bonus--.png") {
}
object frameManzanita inherits FramePregunta{}
object frameBizcochitos inherits FramePregunta{}
object framePalmeritas inherits FramePregunta{}
object frameFaso inherits FramePregunta{}
object frameMedialuna inherits FramePregunta{}
object extraFrame inherits Frame(image = "realframe.png"){}


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

class ModuloCasas1 inherits Casa(image = "m1.png"){}
class ModuloCasas2 inherits Casa(image = "m2.png"){}
class ModuloCasas3 inherits Casa(image = "m3.png"){}
class ModuloCasas4 inherits Casa(image = "m4.png"){}
class ModuloCasas5 inherits Casa(image = "m5.png"){}
class ModuloCasas6 inherits Casa(image = "m6.png"){} 
class ModuloCasas7 inherits Casa(image = "m7.png"){}
class ModuloCasas8 inherits Casa(image = "m8.png"){}
class ModuloCasas9 inherits Casa(image = "m9.png"){}
class ModuloCasas0 inherits Casa(image = "m0.png"){}

class ModuloCasas10 inherits Casa(image = "n1.png"){}
class ModuloCasas11 inherits Casa(image = "n2.png"){}
class ModuloCasas12 inherits Casa(image = "n3.png"){}
class ModuloCasas13 inherits Casa(image = "n4.png"){}
class ModuloCasas14 inherits Casa(image = "n5.png"){}
class ModuloCasas15 inherits Casa(image = "n6.png"){}
class ModuloCasas16 inherits Casa(image = "n7.png"){}
class ModuloCasas17 inherits Casa(image = "n8.png"){}
class ModuloCasas18 inherits Casa(image = "n9.png"){}

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

//OBSTACULO INTERACTIVO
class Obstaculo inherits Elemento{
  var instanciaRecorrido = 0
  const miRecorrido
  
  method inicializar(){
    game.addVisual(self)
    game.onTick(600, "object", {self.caminar()})
  }
  
  method caminar(){
    self.siguienteInstancia()
    position = miRecorrido.nuevaPosicion(instanciaRecorrido)
  }

  method siguienteInstancia(){
    if(miRecorrido.tieneQueReiniciarRecorrido(instanciaRecorrido)){
      instanciaRecorrido = 0
    } else {
      instanciaRecorrido += 1 
    }
  }
}

class ObstaculoInteractivo inherits Obstaculo(position = miRecorrido.camino().get(0)){
  method casitigoPorAtraparlo()
  method atrapoAuto()

  override method caminar(){
    super()
    self.verificarSiChocoConAuto()
  }

  method verificarSiChocoConAuto(){
    if(self.atrapoAuto()){
      self.casitigoPorAtraparlo()
    }
  }

  method elAutoEstaEnMismaPosicion(){
    return game.colliders(self).contains(auto)
  }

  method elAutoEstaAdelante(){
    return game.getObjectsIn(miRecorrido.posicionSiguienteEnLista(instanciaRecorrido)).contains(auto)
  }

  method elAutoEstaAtras(){
    return game.getObjectsIn(miRecorrido.posicionAnteriorEnLista(instanciaRecorrido)).contains(auto)
  }
}

class Recorrido{
 method ida() 

 method camino() = self.ida() + self.ida().reverse()

 method largoCamino() = self.camino().size()

 method tieneQueReiniciarRecorrido(numero){
   return numero == self.largoCamino()-1
 }

 method nuevaPosicion(instancia) {
   return self.camino().get(instancia)
 }
 method posicionSiguienteEnLista(instancia) {
   return if(instancia+1 < self.largoCamino()){
           self.camino().get(instancia+1)
         } else {
           self.camino().get(instancia)
         }
 }

 method posicionAnteriorEnLista(instancia){
   return if(instancia-1 >= 0){
           self.camino().get(instancia-1)
         } else {
           self.camino().get(instancia) 
         }
 }
}
