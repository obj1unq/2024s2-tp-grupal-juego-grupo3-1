import wollok.game.*

class Frame {
  method image()
  var property position = null 
}

object frameTermo inherits Frame{
  const property image = "frameTermo.png"
}

object frameMate inherits Frame {
  const property image = "frameMate.png"
}

object frameYerba inherits Frame {
  const property image = "frameYerba.png"
}

object frameAgua inherits Frame {
  const property image =  "frameAgua.png"
}

class FramePregunta inherits Frame {
  const property image = "framePregunta.png"
}

object frameManzanita inherits FramePregunta{}

object frameBizcochitos inherits FramePregunta{}

object framePalmeritas inherits FramePregunta{}

object frameFaso inherits FramePregunta{}
