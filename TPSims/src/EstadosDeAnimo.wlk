import Celos.*
import Sim.*
import Personalidades.*
import Abrazos.*


object soniador{
	
	method variacionFelicidad(){
		return 1000
	}
	
	method informacion(infoDelSim){
		return []
	}
	

}

object incomodo {
	
	method variacionFelicidad(){
		return -200
	}
	
	method informacion(infoDelSim){
		return infoDelSim
	}
}

object normal {
	
	method variacionFelicidad(){
		return 0
	}
	
	method informacion(infoDelSim){
		return infoDelSim
	}
	

}









