import Celos.*
import Sim.*
import Abrazos.*
import EstadosDeAnimo.*

class Personalidad {
	method dispuestoAPrestar(cantDinero,otroSim,simPrestamista){
		return cantDinero <= simPrestamista.cantidadDispuestaAPrestar(otroSim) 
	}
	
	method valor(sim,simEvaluador)
}


object interesado inherits Personalidad{
	override method valor(sim,simEvaluador){
		return sim.amigos().sum({unSim => unSim.dinero()})*0.1
	}
	
	method leAtrae(sim,simAEvaluar){
		return simAEvaluar.duplicaFortunaDe(sim)
	}
	
	override method dispuestoAPrestar(cantDinero,otroSim,simPrestamista){
		return cantDinero <= otroSim.dinero() 
	}
	
}


object superficial inherits Personalidad{
	override method valor(sim,simEvaluador){
		return sim.nivelPopularidad()*20
	}
	
	method leAtrae(sim,simAEvaluar){
		return simAEvaluar.nivelPopularidad() >= sim.maximaPopularidadDeLosAmigos() && simAEvaluar.esJoven()
	}
}


object buenazo inherits Personalidad{
	override method valor(sim,simEvaluador){
		return simEvaluador.nivelFelicidad() * 0.5
	}
	
	method leAtrae(sim,simAEvaluar){
		return true
	}
}


object peleadoConLaVida inherits Personalidad{
	override method valor(sim,simEvaluador){
		return 0
	}
	
	method leAtrae(sim,simAEvaluar){
		return simAEvaluar.estaTriste()
	}
}

