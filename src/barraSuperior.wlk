import wollok.game.*

object frameTermo {
  const property image = "frameTermo.png"
  var property position = null
}

object frameMate {
  const property image = "frameMate.png"
  var property position = null
}

object frameYerba {
  const property image = "frameYerba.png"
  var property position = null
}

object frameAgua {
  const property image = "frameAgua.png"
  var property position = null
}

class FramePregunta {
  const property image = "framePregunta.png"
  var property position
}

object frameManzanita inherits FramePregunta(position = null){

}

object frameBizcochitos inherits FramePregunta(position = null){}

object framePalmeritas inherits FramePregunta(position = null){}

object frameFaso inherits FramePregunta(position = null){}

