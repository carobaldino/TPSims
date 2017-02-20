import Abrazos.*
import EstadosDeAnimo.*
import Personalidades.*
import Sim.*
import SituacionesSentimentales.*
//import TiposDeTrabajos.*


//object celosPorPlata {
//	method ponerseCeloso(){
//		simCeloso.disminuirFelicidad(10)
//		var nuevosAmigos= simCeloso.amigos().filter({unAmigo => unAmigo.dinero() < simCeloso.dinero()})
//		simCeloso.amigos(nuevosAmigos)
//	}
//}
//  
//object celosPorPopularidad{
//	method ponerseCeloso(){
//		simCeloso.disminuirFelicidad(10)
//		var nuevosAmigos= simCeloso.amigos().filter({unAmigo=> unAmigo.nivelPopularidad() < simCeloso.nivelPopularidad()})
//		simCeloso.amigos(nuevosAmigos)
//	}
//}
//
//object celosDePareja{
//	method ponerseCeloso(){
//		simCeloso.disminuirFelicidad(10)
//		var amigosDeSuPareja = simCeloso.pareja()._amigos()
//		var nuevosAmigos= simCeloso.amigos().filter({unAmigo=> not(amigosDeSuPareja.contains(unAmigo))})
//		simCeloso.amigos(nuevosAmigos)
//	}
//}