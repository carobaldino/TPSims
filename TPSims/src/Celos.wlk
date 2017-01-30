import Abrazo.*
import EstadoDeAnimo.*
import Personalidad.*
import Sim.*
import SituacionesSentimentales.*
import TiposDeTrabajos.*

class Celos {
	var simCeloso
	
	method simCeloso(unSim){
		simCeloso=unSim
	}
	
	method ponerseCeloso()
    
}

class CelosPorPlata inherits Celos{
	override method ponerseCeloso(){
		simCeloso.disminuirFelicidad(10)
		var nuevosAmigos= simCeloso.amigos().filter({unAmigo => unAmigo.dinero() < simCeloso.dinero()})
		simCeloso.amigos(nuevosAmigos)
	}
}
  
class CelosPorPopularidad inherits Celos{
	override method ponerseCeloso(){
		simCeloso.disminuirFelicidad(10)
		var nuevosAmigos= simCeloso.amigos().filter({unAmigo=> unAmigo.nivelPopularidad() < simCeloso.nivelPopularidad()})
		simCeloso.amigos(nuevosAmigos)
	}
}

class CelosDePareja inherits Celos{
	override method ponerseCeloso(){
		simCeloso.disminuirFelicidad(10)
		var amigosDeSuPareja = simCeloso.pareja()._amigos()
		var nuevosAmigos= simCeloso.amigos().filter({unAmigo=> not(amigosDeSuPareja.contains(unAmigo))})
		simCeloso.amigos(nuevosAmigos)
	}
}