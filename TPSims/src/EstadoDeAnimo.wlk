import Sim.*
import Personalidades.*
import Abrazos.*

class EstadoDeAnimo{
	var sim
	var felicidadOriginal
	var conocimientosOriginales
	
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





object soniador inherits EstadoDeAnimo{
	method modificarEstadoDeAnimo(){
		
	}

}

object incomodo inherits EstadoDeAnimo{
	method modificarEstadoDeAnimo(){
		
	}
}

object normal inherits EstadoDeAnimo{}