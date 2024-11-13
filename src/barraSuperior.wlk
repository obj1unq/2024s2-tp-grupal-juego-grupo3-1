import wollok.game.*

class Frame {
  method image()
  var property position = null 

  method solida() = true // lo puse xq con las nuevas validaciones de los trasladores daba error al querer pasar d mapa por la parte superior del mapa!!
}

object frameTermo inherits Frame{
  const property image = "frame-termo-verde-.png"
}

object frameMate inherits Frame {
  const property image = "frame-mate-lavado-.png"
}

object frameYerba inherits Frame {
  const property image = "frame-yerba-cara-.png"
}

object frameAgua inherits Frame {
  const property image =  "frame-agua-mate-.png"
}

class FramePregunta inherits Frame {
  const property image = "frame-bonus-.png"
}

object frameManzanita inherits FramePregunta{}

object frameBizcochitos inherits FramePregunta{}

object framePalmeritas inherits FramePregunta{}

object frameFaso inherits FramePregunta{}
