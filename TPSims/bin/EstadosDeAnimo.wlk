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

class EstadoDeAnimo {
	var info
	
	method setInfo(informacion){
		info = informacion
	}
	
	method getInfo(){
		return info
	}
}

object soniador inherits EstadoDeAnimo{
	
	method nivelFelicidad(){
		return 1000
	}
	
	method modificarConocimiento(informacion){
		self.setInfo(informacion)
		return []
	}

}

object incomodo inherits EstadoDeAnimo{
	
	method nivelFelicidad(){
		return -200
	}
	
	method modificarConocimiento(informacion){
		return info
	}
	
}

object normal inherits EstadoDeAnimo{
	
	method nivelFelicidad(){
		return -1000
	}
	
	method modificarConocimiento(informacion){
		return info
	}
}









