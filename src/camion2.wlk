import cosas2.*

object camion {
	
	//El camión:
	
	const property cosas = []
	
	method cargar(cosa){ cosas.add(cosa) }
	
	method descargar(cosa){ cosas.remove(cosa) }
	
	method todoPesoPar() = cosas.all( { c => c.peso() % 2 == 0 } )
	
	method hayAlgunoQuePesa(peso) = cosas.any( { c => c.peso() == peso } )
	
	method elDeNivel(nivel) = cosas.find( { c => c.nivelDePeligrosidad() == nivel } )
	
	method pesoTotal() = cosas.sum( { c => c.peso() } ) + 1000
	
	method excedidoDePeso() = self.pesoTotal() > 2500
	
	method objetosQueSuperanPeligrosidad(nivel) = cosas.filter( { c => c.nivelDePeligrosidad() > nivel } )
	
	method objetosMasPeligrososQue(cosa) = cosas.filter( { c => c.nivelDePeligrosidad() > cosa.nivelDePeligrosidad() } )
	
	//Método propio:
	method ningunoSuperaElNivelMaximo(nivel) = cosas.all( { c => c.nivelDePeligrosidad() < nivel } )
	
	method puedeCircularEnRuta(nivelMaximoPeligrosidad) = (not self.excedidoDePeso()) and (self.ningunoSuperaElNivelMaximo(nivelMaximoPeligrosidad))
	
	//Agregados al camión:
	
	method tieneAlgoQuePesaEntre(min, max) = cosas.any( { c => c.peso().between(min, max) } )
	
	method cosaMasPesada() = cosas.max( { c => c.peso() } )
	
	method pesos() = cosas.map( { c => c.peso()	} )
	
	//Total bultos:
	
	method totalBultos() = cosas.sum ( { c => c.totalBultos() } )

}