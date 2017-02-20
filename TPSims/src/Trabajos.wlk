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
	
	method trabajar(){
		tipoDeTrabajo.trabajar(sim,dineroAGanar,variacionFelicidad)
	}
	
}

object copado{
	method trabajar(sim,dineroACobrar,variacionFelicidad){
		sim.aumentarFelicidad(variacionFelicidad)
		sim.aumentarDinero(dineroACobrar)
	}
}

object mercenario{
	method trabajar(sim,dineroACobrar,variacionFelicidad){
		sim.aumentarDinero((100 + sim.dinero() * 0.02))
	}
}

object aburrido{
	method trabajar(sim,dineroACobrar,variacionFelicidad){
		self.perderFelicidad(variacionFelicidad,sim)
		sim.aumentarDinero(dineroACobrar)
	}
	
	method perderFelicidad(variacionFelicidad,sim){
		sim.aumentarFelicidad(-variacionFelicidad)
	}
}

object desocupado{
		method trabajar(sim,dineroACobrar,variacionFelicidad){
		sim.aumentarFelicidad(0)
		sim.aumentarDinero(0)
	}
}