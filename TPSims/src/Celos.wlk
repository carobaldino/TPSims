import Abrazos.*
import EstadosDeAnimo.*
import Personalidades.*
import Sim.*
import SituacionesSentimentales.*
//import TiposDeTrabajos.*


object plata {
	method ponerseCeloso(sim){
		sim.disminuirFelicidad(10)
		self.dejarAmigosQueTienenMasPlata(sim)
	}
		
	method dejarAmigosQueTienenMasPlata(sim){	
 		sim.amigos(sim.amigos().filter({unAmigo => unAmigo.dinero() < sim.dinero()}))
	}
}
 
object popularidad{
	method ponerseCeloso(sim){
		sim.disminuirFelicidad(10)
		self.dejarAmigosMasPopulares(sim)
	}
	
	method dejarAmigosMasPopulares(sim){
		sim.amigos(sim.amigos().filter({unAmigo=> unAmigo.nivelPopularidad() < sim.nivelPopularidad()}))
	}
}

object pareja{
	method ponerseCeloso(sim){
		sim.disminuirFelicidad(10)
		self.dejarAmigosDeSuPareja(sim)
	}
	
	method dejarAmigosDeSuPareja(sim){
		sim.amigos(sim.amigos().filter({unAmigo=> not(sim.pareja()._amigos().contains(unAmigo)) }) )
	}
}