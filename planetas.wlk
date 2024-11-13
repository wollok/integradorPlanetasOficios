class Planeta{
  const habitantes = #{}
  const edificios = []
  method delegacion() = (self.habitantesDestacados() + [self.elMasRico()]).asSet()

  method elMasRico() = habitantes.max{h=>h.recursos()}
  
  method habitantesDestacados() = habitantes.filter{h=>h.esDestacada()}

  method esValioso() = edificios.sum{e=>e.valor()} > 100
  
  method vive(alguien) = habitantes.contains(alguien)

// Hacer que la delegación diplomática del planeta trabaje durante un determinado tiempo en su planeta
  method trabajoDelegacion(){
    self.trabajoDelegacion(10,self) //Se asume cantidad de tiempo
  }
  method trabajoDelegacion(tiempo, planeta) {
    self.delegacion().forEach{p=>p.trabajarEn(tiempo, planeta)}
  }
// Hacer que un planeta invada a otro y obligue a su delegación diplomática a trabajar para el planeta invasor.
  method invadir(planeta){
    planeta.trabajoDelegacion(5,self) //Se asume cantidad de tiempo
  }

}
