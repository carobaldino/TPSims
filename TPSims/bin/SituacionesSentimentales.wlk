import Abrazos.*
import Celos.*
import EstadosDeAnimo.*
import Personalidades.*
import Sim.*


object soltero {
	method situacion(){
		return "Soltero"
	}
		
	method estaEnRelacion(){
		return false
	}
	
	method obtenerAmigos(amigos){
		return amigos.asSet()
	}


}

class Relacion{
	var unMiembro
	var otroMiembro
		
	constructor(sim,pareja){
		unMiembro = sim
		otroMiembro = pareja
	}

	method unMiembro(){
		return unMiembro
	}
		
	method otroMiembro(){
		return otroMiembro	
	}
	
	method situacion(){
		return "Relacion"
	}
	
	method estaEnRelacion(){
		return true
	}
	
	method obtenerAmigos(amigos){
		return self.nuevoCirculoDeAmigos(amigos,otroMiembro._amigos())
	}
	
	method nuevoCirculoDeAmigos(amigosUnMiembro,amigosOtroMiembro){
		return (amigosUnMiembro + amigosOtroMiembro).asSet()
	}
	
	method miembros(){
		return [unMiembro,otroMiembro]
	}
	
}

