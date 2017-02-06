import Celos.*
import Sim.*
import Personalidades.*
import Abrazos.*

/*
class EstadoDeAnimo{
	//var sim
	//var felicidadOriginal
	//var conocimientosOriginales
 	
	method sim(unSim){
		sim = unSim
	}
	      
	method felicidadOriginal(){
		felicidadOriginal = sim.nivelFelicidad()
	}
	
	method conocimientosOriginales(){
		conocimientosOriginales=sim.informacion()
	}

	method volverALaNormalidad(){
		sim.nivelFelicidad(felicidadOriginal)
		sim.informacion(conocimientosOriginales)
		sim.estadoDeAnimo(normal)
	}
	
}

	method nivelFelicidad()
	
	method modificarConocimiento(info)
}
*/



object soniador{
	
	method variacionFelicidad(){
		return 1000
	}

}

object incomodo {
	
	method variacionFelicidad(){
		return -200
	}
	
}

object normal {
	
	method variacionFelicidad(){
		return 0
	}
	

}









