class Persona{
  var edad = 0
  var property monedas = 20
  var property oficio = new SinOficio()

  method ganar(cant){
    monedas += cant
  }
  method cumple(){
    edad += 1
  }
  method gastar(cant){
    self.ganar(-cant)
  }
  method trabajarEn(tiempo,planeta){
    oficio.trabajarEn(tiempo,planeta,self)
  }
  
  method recursos() = oficio.recursos(self)

  method adultaConRecursos() =  edad.between(18,65) or self.recursos() > 30

  method esDestacada() = oficio.esDestacada(self)
}

class SinOficio{
  method esDestacada(alguien) = alguien.adultaConRecursos()
}

class OficioProductor inherits SinOficio{
  const tecnicas = []
  method cantidadTecnicas() = tecnicas.size()
  method conoce(tec)= tecnicas.contains(tec)

  method recursos(persona) = self.cantidadTecnicas()

  override method esDestacada(persona) = self.cantidadTecnicas() >= 5 or super(persona)

  method realizar(tecnica,tiempo,persona) {
    if (self.conoce(tecnica))
      persona.ganar(3*tiempo)
    else
      persona.gastar(1)
  }

  method trabajarEn(tiempo,planeta,persona){
    if (planeta.vive(persona))
      self.realizar(tecnicas.last(),tiempo,persona)
  }
}

class OficioDeConstructor {
  var property lugar 
  var cantidadConstrucciones = 0

  method trabajarEn(tiempo,planeta,persona){
      persona.gastar(5)
      planeta.agregarConstruccion( lugar.queConstruir(tiempo,persona))
      cantidadConstrucciones +=1
  }
  method esDestacada(alguien) = cantidadConstrucciones >= 5

}


