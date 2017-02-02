import Abrazos.*
import Celos.*
import Personalidades.*
import EstadosDeAnimo.*

class Sim{
	var sexo
	var edad
	var nivelFelicidad = 0
	var amigos = []
	var dinero
	var personalidad
	var preferenciaSexual
	var estadoDeAnimo = normal
	var informacion = []
	
	method sexo(){
		return sexo
	}
	method edad(){
		return edad
	}
	method nivelFelicidad(){
		return nivelFelicidad
	}
	method amigos(){
		return amigos
	}
	method dinero(){
		return dinero
	}
	method personalidad(){
		return personalidad
	}
	method preferenciaSexual(){
		return preferenciaSexual
	}
	method estadoDeAnimo(){
		return estadoDeAnimo
	}
	
	method informacion(){
		return informacion
	}
	
	method sexo(_sexo){
		sexo = _sexo
	}
	method edad(_edad){
		edad = _edad
	}
	method nivelFelicidad(_nivelFelicidad){
		nivelFelicidad = _nivelFelicidad
	}
	method dinero(_dinero){
		dinero = _dinero
	}
	method personalidad(_personalidad){
		personalidad = _personalidad
	}
	method amigos(listaDeAmigos){
		amigos = listaDeAmigos
	}
	method preferenciaSexual(sexoPreferido){
		preferenciaSexual = sexoPreferido
	}
	method estadoDeAnimo(estado){
		estadoDeAnimo = estado
		estadoDeAnimo.sim(self)
		estadoDeAnimo.modificarEstadoDeAnimo()	
	}

	//metodos

	method nivelPopularidad(){
		return amigos.sum({unAmigo => unAmigo.nivelFelicidad()})
	}
	
	method agregarAmigo(amigo){
		amigos.add(amigo)
	}
	
	method valorarA(sim){
		return personalidad.valor(sim,self)
	}	
	
	method simMasValorado(){
		return amigos.max({unAmigo => self.valorarA(unAmigo)})
	}
	
	method hacerseAmigoDe(unSim){
		nivelFelicidad += self.valorarA(unSim)
		self.agregarAmigo(unSim)
	}
	
	method hacerAmistadMutua(unSim){
		self.hacerseAmigoDe(unSim)
		unSim.hacerseAmigoDe(self)
	}
	
	method esAmigoDe(unSim){
		return amigos.any({unAmigo => unAmigo === unSim})
	}
	
	method cantAmigosMasNuevos(unaCantidad){
		return amigos.take(unaCantidad)
	}
	
	method cantAmigosMasViejos(unaCantidad){
		return amigos.reverse().take(unaCantidad).reverse()
	}
	
	method esElMasPopularDeSuCirculo(){
		return amigos.all({unAmigo => self.nivelPopularidad() >= unAmigo.nivelPopularidad()})
	}
	
	
	method abrazarA(unSim,tipoDeAbrazo){
		tipoDeAbrazo.abrazar(self,unSim)
	}
	
	method aumentarFelicidad(felicidadAAgregar){
		nivelFelicidad += felicidadAAgregar
	}
		
	method leAtrae(unSim){
		return preferenciaSexual == unSim.sexo() && personalidad.leAtrae(self,unSim)		
	}
	
	method duplicaFortunaDe(otroSim){
		return dinero == otroSim.dinero()*2
	}
	
	method esJoven(){
		return edad > 18 && edad < 29
	}
	
	method maximaPopularidadDeLosAmigos(){
		return amigos.map({amigo=> amigo.nivelPopularidad()}).max()
	}
	
	method estaTriste(){
		return self.nivelFelicidad() < 200
	}
	
	method simsQueLeAtraen(coleccionDeSims){
		return coleccionDeSims.filter({sim => self.leAtrae(sim)})
		
	}
	
	
	
	method conoceInformacion(unaInformacion){
		return informacion.contains(unaInformacion)
	}
	
	method recibirInformacion(unaInformacion){
		if(not self.conoceInformacion(unaInformacion)){
			informacion.add(unaInformacion)
		}
	}	
	
	method conocimiento(){
		return informacion.sum({conocimiento => conocimiento.length()})
	}
	
	method tenerAmnesia(){
		informacion = []
	}
	
}