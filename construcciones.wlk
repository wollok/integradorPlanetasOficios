class Muralla{
  const longitud

  method valor() = 10 * longitud
}

class Museo{
  const superficie 
  const importancia = 1
  method valor() = superficie * importancia
}


object llanura {

  method queConstruir(tiempo,persona) = 
    if(persona.esDestacada()) 
       new Muralla(longitud = tiempo/2)
    else
       new Museo(superficie = tiempo, importancia = self.proporcional(persona.recursos()))
  
  method proporcional(monto) = (monto / 100).floor().min(5).max(1) 
}

object montania {
  method queConstruir(tiempo,persona) = new Muralla(longitud = tiempo/2)
}

object costa{
  method queConstruir(tiempo,persona) = new Museo(superficie = tiempo)
}
