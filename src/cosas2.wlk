/*
 * Muy Bien :-)
 */
import camion2.*

object knightRider {
	method peso() = 500
	
	method nivelDePeligrosidad() = 10
	
	//Consecuencias de la carga:
	
	method consecuenciaDeCarga() {}
	
	method totalBultos() = 1
}


object bumblebee {
	var estaTransformadoEnAuto = true
	
	method peso() = 800
	
	method nivelDePeligrosidad() { return if(estaTransformadoEnAuto) {15} else {30}	}
	
	method transformar() { estaTransformadoEnAuto = !estaTransformadoEnAuto }
	
	method estaComoUnAuto() = estaTransformadoEnAuto
	
	method estaComoUnRobot() = !estaTransformadoEnAuto
	
	//Consecuencias de la carga:
	
	method consecuenciaDeCarga() {
		self.transformar()
	}
	
	method totalBultos() = 1
}


object paqueteLadrillos{
	
	var property cantidad 
	
	method peso() = self.cantidad() * 2
	
	method nivelDePeligrosidad() = 2
	
	//Consecuencias de la carga:
	
	method consecuenciaDeCarga() {
		cantidad += 12
	}
	
	method totalBultos() {
		var totalBultos = 0
		if (cantidad.between(1,100)) totalBultos = 1
		if (cantidad.between(101,300)) totalBultos = 2
		if (cantidad >= 301) totalBultos = 3
		return totalBultos		
	}
}


object arena {
	
	var property peso
	
	method nivelDePeligrosidad() = 1
	
	//Consecuencias de la carga:
	
	method consecuenciaDeCarga() {
		peso += 20
	}
	
	method totalBultos() = 1
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
	
	//Consecuencias de la carga:
	
	method consecuenciaDeCarga() {}
	
	method totalBultos() { return if (estaConMisiles){2} else {1} }
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

	//Consecuencias de la carga:
	
	method consecuenciaDeCarga() {
		cosasDentro.forEach( { cosa => cosa.consecuenciaDeCarga() } )
	}
	
	method totalBultos() = 1 + cosasDentro.sum ( { cosa => cosa.totalBultos() } )
}


object residuosRadioactivos {
	var property peso
	
	method nivelDePeligrosidad() = 200
	
	//Consecuencias de la carga:
	
	method consecuenciaDeCarga() {
		peso += 15	
	}
	
	method totalBultos() = 1
}


object embalajeSeguridad {
	
	var property cosa
	
	method peso() = cosa.peso()
	
	method nivelDePeligrosidad() = cosa.nivelDePeligrosidad() / 2
	
	//Consecuencias de la carga:
	
	method consecuenciaDeCarga() {}
	
	method totalBultos() = 2
}