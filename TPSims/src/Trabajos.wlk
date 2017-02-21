import Sim.*

class Trabajo{
	var dineroAGanar
	var variacionFelicidad
	var tipoDeTrabajo
	var sim
	
	
	constructor(_dinero,_felicidad,_tipoDeTrabajo,_sim){
		dineroAGanar = _dinero
		variacionFelicidad = _felicidad
		tipoDeTrabajo = _tipoDeTrabajo
		sim = _sim
		
	}
	
	method tipoDeTrabajo(){
		return tipoDeTrabajo
	}
	
	method trabajar(){
		tipoDeTrabajo.trabajar(sim,dineroAGanar,variacionFelicidad)
		tipoDeTrabajo.variarEstadoDeAnimo(sim)
	}
	
}


class TiposDeTrabajo {
		
	method variarEstadoDeAnimo(sim){
		sim.volverALaNormalidad()
	}
	
}

class Mercenario inherits TiposDeTrabajo{
	method ganarMuchaPlata(sim){
		return (100 + sim.dinero() * 0.02)
	}
	
}

class Aburrido inherits TiposDeTrabajo{
	method trabajar(sim,dineroACobrar,variacionFelicidad){
		self.perderFelicidad(variacionFelicidad,sim)
		sim.aumentarDinero(dineroACobrar)
	}
	
	method perderFelicidad(v,s)
}

object copado inherits TiposDeTrabajo{
	method trabajar(sim,dineroACobrar,variacionFelicidad){
		sim.aumentarFelicidad(variacionFelicidad)
		sim.aumentarDinero(dineroACobrar)
	}
	
	override method variarEstadoDeAnimo(sim){
		sim.volverALaNormalidad()
	}
}


object mercenario inherits Mercenario{
	method trabajar(sim,dineroACobrar,variacionFelicidad){
		sim.aumentarDinero(self.ganarMuchaPlata(sim))
	}

}

object mercenarioSocial inherits Mercenario{
	method trabajar(sim,dineroACobrar,variacionFelicidad){
		sim.aumentarDinero(self.ganarMuchaPlata(sim) + self.ganarComision(sim))
	}
		
	method ganarComision(sim){
		return sim.amigos().size()
	}
	
}

object aburrido inherits Aburrido {
	
	override method perderFelicidad(variacionFelicidad,sim){
		sim.aumentarFelicidad(-variacionFelicidad)
	}
	
}

object aburridoHastaLaMuerte inherits Aburrido{
	var valorN
	
	method valorN(valor){
		valorN = valor
	}
	
	override method perderFelicidad(variacionFelicidad,sim){
		sim.aumentarFelicidad(-variacionFelicidad*valorN)
	}
}


object desocupado inherits TiposDeTrabajo{
	method trabajar(sim,dineroACobrar,variacionFelicidad){
		sim.aumentarFelicidad(0)
		sim.aumentarDinero(0)
	}
	
		
	override method variarEstadoDeAnimo(sim){
		sim.estadoDeAnimo(sim.estadoDeAnimo())
	}
}




