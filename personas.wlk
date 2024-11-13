class Persona{
  var edad = 0
  var monedas = 20
  
  method esDestacada() = edad.between(18,65) or self.recursos() > 30

  method ganar(cant){
    monedas += cant
  }
  method cumple(){
    edad += 1
  }
  method gastar(cant){
    self.ganar(-cant)
  }
  method trabajarEn(tiempo,planeta){ }

  method recursos() = monedas

}

class Productor inherits Persona{
  const tecnicas = []

  override method recursos() = super()* self.cantidadTecnicas()

  method cantidadTecnicas() = tecnicas.size()

  method realizar(tecnica,tiempo) {
    if (self.conoce(tecnica))
      self.ganar(3*tiempo)
    else
      self.gastar(1)
  }
  method conoce(tec)= tecnicas.contains(tec)

  method trabajarEn(tiempo,planeta){
    if (planeta.vive(self))
      self.realizar(tecnicas.last(),tiempo)
  }
  override method esDestacada() = self.cantidadTecnicas() >= 5 or super()

}


class Constructor inherits Persona{
  var property lugar 
  var cantidadConstrucciones = 0
  
  override method trabajar(tiempo,planeta){
    self.gastar(5)
    planeta.agregarConstruccion( lugar.queConstruir(tiempo,self))
    cantidadConstrucciones +=1
  }
  override method esDestacada() = cantidadConstrucciones >= 5


}

