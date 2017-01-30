import Celos.*
import Sim.*
import Abrazos.*
import EstadosDeAnimo.*

object interesado {
	method valor(sim,simEvaluador){
		return sim.amigos().sum({unSim => unSim.dinero()})*0.1
	}
	
	method leAtrae(sim,simAEvaluar){
		return simAEvaluar.duplicaFortunaDe(sim)
	}
	
}

object superficial{
	method valor(sim,simEvaluador){
		return sim.nivelPopularidad()*20
	}
	
	method leAtrae(sim,simAEvaluar){
		return sim.maximaPopularidadDeLosAmigos() < simAEvaluar.nivelPopularidad() && simAEvaluar.esJoven()
	}
}

object buenazo{
	method valor(sim,simEvaluador){
		return simEvaluador.nivelFelicidad() * 0.5
	}
	
	method leAtrae(sim,simAEvaluar){
		return true
	}
}

object peleadoConLaVida{
	method valor(sim,simEvaluador){
		return 0
	}
	
	method leAtrae(sim,simAEvaluar){
		return simAEvaluar.estaTriste()
	}
}