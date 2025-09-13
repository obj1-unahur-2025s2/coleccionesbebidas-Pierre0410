object tito {
    var cantidad = 0
    var bebida = cianuro
    method peso() = 70
    method inerciaBase() = 490
    method consumir(unaCantidad,unaBebida) {
        bebida = unaBebida
        cantidad = unaCantidad
    }
    method bebida() = bebida

    method velocidad() {
        return bebida.rendimiento(cantidad)
        * self.inerciaBase() / self.peso()
    }
}

object wisky {
    method rendimiento(cantidad) = 0.9 ** cantidad
}
object cianuro {
    method rendimiento(cantidad) = 0
}

object terere {
    method rendimiento(cantidad) {
        return 1.max(cantidad * 0.1)
        //tambien (cantidad * 0.1).max(1)
    }
}

object licuadoDeFrutas{
    const property nutrientes = []
    method agregaraNutriente(nutriente){
                nutrientes.add(nutriente)
    }
    method rendimiento(cantidad){
                return nutrientes.sum() * 1.max(cantidad.div(1000))
//Opcional: nutrientes.sum({unaFruta ==> unaFruta.nutrientes})
        }
}

object aguaSaborizada{
    var bebida = wisky 
    method mezclarBebida(unaBebida){
        bebida = unaBebida
    }
    method rendimiento(cantidad){
        return 1+ bebida.rendimiento(cantidad/4)
    }
}

object coctel {
    const bebidas = #{}
    method añadirBebida (unaBebida){
        bebidas.add(unaBebida)
    }
    method rendimiento(cantidad){
        var total =1
        bebidas.forEach({unaBebida => total = total * unaBebida.rendimiento(cantidad/bebidas.size())})
        return total
    }
}