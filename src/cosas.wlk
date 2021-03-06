import camion.*

object knightRider {
	method peso() = 500
	
	method nivelDePeligrosidad() = 10
}


object bumblebee {
	var estaTransformadoEnAuto = true
	
	method peso() = 800
	
	method nivelDePeligrosidad() { return if(estaTransformadoEnAuto) {15} else {30}	}
	
	method transformar() { estaTransformadoEnAuto = !estaTransformadoEnAuto }
	
	method estaComoUnAuto() = estaTransformadoEnAuto
	
	method estaComoUnRobot() = !estaTransformadoEnAuto
}


object paqueteLadrillos{
	
	var property cantidad 
	
	method peso() = self.cantidad() * 2
	
	method nivelDePeligrosidad() = 2
}


object arena {
	
	var property peso
	
	method nivelDePeligrosidad() = 1
}


object bateriaAntiarea {
	
	var estaConMisiles = true
	
	method peso() {
		if (estaConMisiles) {
			return 300
		}
		else {
			return 200
		}
	}
	
	method nivelDePeligrosidad() { return if (estaConMisiles) {100} else {0} }
	
	method manejarMisiles() { estaConMisiles = !estaConMisiles }
}


object contenedor {
	
	const property cosasDentro = []
	const pesoContenedor = 100
	
	method cargar(cosa){ cosasDentro.add(cosa) }
	
	method descargar(cosa){ cosasDentro.remove(cosa) }
	
	method pesoDeLasCosasDentro() = cosasDentro.sum( { cosa => cosa.peso() } )
	
	method peso() = pesoContenedor + self.pesoDeLasCosasDentro()
	
	//Método propio:
	
	method vaciar() = cosasDentro.clear()
	
	method estaVacio() = cosasDentro.isEmpty()
	
	method objetoConMayorPeligrosidad() = cosasDentro.max( { cosa => cosa.nivelDePeligrosidad() } )
	
	method nivelDePeligrosidad() { return if (cosasDentro.isEmpty()) {0} else {self.objetoConMayorPeligrosidad().nivelDePeligrosidad()} }
}


object residuosRadioactivos {
	var property peso
	
	method nivelDePeligrosidad() = 200
}


object embalajeSeguridad {
	
	var property cosa
	
	method peso() = cosa.peso()
	
	method nivelDePeligrosidad() = cosa.nivelDePeligrosidad() / 2
}




