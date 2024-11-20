import wollok.game.*

class Frame {
  const property image
  var property position = null 

  method solida() = true // lo puse xq con las nuevas validaciones de los trasladores daba error al querer pasar d mapa por la parte superior del mapa!!
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