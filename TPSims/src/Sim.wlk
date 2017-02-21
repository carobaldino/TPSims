import Abrazos.*
import Celos.*
import Personalidades.*
import EstadosDeAnimo.*
import SituacionesSentimentales.*
import Trabajos.*

class Sim{
	var sexo
	var edad
	var nivelFelicidad = 0
	var amigos = []
	var dinero = 0
	var personalidad
	var preferenciaSexual
	var estadoDeAnimo = normal
	var informacion = []
	var situacionSentimental = soltero
	var historialDeRelaciones = []
	var tipoDeTrabajo
	var fuentesDeInformacion = []


	
	method sexo(){
		return sexo
	}
	method edad(){
		return edad
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
	method tipoDeTrabajo(){
		return tipoDeTrabajo
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
	}
	method situacionSentimental(situacion){
		situacionSentimental = situacion
	}
	method tipoDeTrabajo(_tipoDeTrabajo){
		tipoDeTrabajo = _tipoDeTrabajo
	}
	

	//otrosMetodos
	method nivelFelicidad(){
		return nivelFelicidad + estadoDeAnimo.variacionFelicidad()
	}
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
	
	method iniciarRelacionCon(otroSim){
		if(self.estaEnPareja() || self.tienenMenosDe16Anios(otroSim))
			error.throwWithMessage("No se puede iniciar relacion")
		var relacion = new Relacion(self,otroSim)
		self.situacionSentimental(relacion)
		otroSim.situacionSentimental(relacion)
	
	}
	
	method estaEnPareja(){
		return situacionSentimental.situacion() == "Relacion"
	}
	
	method tienenMenosDe16Anios(otroSim){
		return (self.edad() < 16) || (otroSim.edad() < 16)
	}
	
	method amigos(){
		return situacionSentimental.obtenerAmigos(amigos)	
	}
	
	method _amigos(){
		return amigos
	}
	
	method situacionSentimental(){
		return situacionSentimental.situacion()	
	}
	
	method formaParteDeUnaRelacion(){
		return situacionSentimental.estaEnRelacion()
	}
	
	method miembrosDeLaRelacion(){
		return situacionSentimental.miembros()
	}
	
	method terminarRelacionCon(unSim){
		self.agregarRelacionAlHistorial(unSim)
		unSim.agregarRelacionAlHistorial(self)
		self.situacionSentimental(soltero)
		unSim.situacionSentimental(soltero)
		//al cambiar la referencia de el atributo situacion sentimental, se pierde el objeto relacion, por lo que dejan de formarla
	}
	
	method agregarRelacionAlHistorial(unSim){
		historialDeRelaciones.add(unSim)
	}
	
	method terminoCon(otroSim) {
		return historialDeRelaciones.contains(otroSim)
	}
	
	method funcionaRelacionCon(unSim){
		return self.leAtrae(unSim) && unSim.leAtrae(self)
	}
		
	method sePudrioTodo(){
		return not(self.funcionaRelacionCon(self.pareja())) && self.leAtraeAlgunAmigoEnComun() 
	}	
	
	method pareja(){
		return situacionSentimental.otroMiembro()
	}
	
	method leAtraeAlgunAmigoEnComun(){
		return self.amigos().any({amigo => self.pareja()._amigos().contains(amigo)})
	}

	method reestablecerRelacionCon(sim){
		self.terminarRelacionCon(sim)
		self.iniciarRelacionCon(sim)
	}
	
	method volverALaNormalidad(){
		self.estadoDeAnimo(normal)
	}
	
	method informacion(){
		return estadoDeAnimo.informacion(informacion)
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
	
	method tenerCelosPor(tipoDeCelo){
		tipoDeCelo.ponerseCeloso(self)
	}
	
	method disminuirFelicidad(cantidad){
		nivelFelicidad -= cantidad
	}
	
	method trabajarEn(tipoTrabajo,dineroACobrar,variacionFelicidad){
		var trabajo = new Trabajo(dineroACobrar,variacionFelicidad,tipoTrabajo,self) 
		self.tipoDeTrabajo(trabajo)
		trabajo.trabajar()
	}
	
	method aumentarDinero(cantDinero){
		dinero += cantDinero
	}
	
	method prestarDineroA(otroSim,cantDinero){
		if(not(self.tieneDinero(cantDinero) && self.estaDispuestoAPrestar(cantDinero,otroSim)))
			error.throwWithMessage("No se realiza el prestamo")
		self.transferirDinero(cantDinero,otroSim)	
	}
	
	method tieneDinero(cantDinero){
		return dinero >= cantDinero
	}
	
	method estaDispuestoAPrestar(cantDinero,sim){
		return personalidad.dispuestoAPrestar(cantDinero,sim,self) 
	}
	
	method transferirDinero(cantDinero,otroSim){
		otroSim.aumentarDinero(cantDinero)
	}

	method cantidadDispuestaAPrestar(otroSim){
		return 10 * self.valorarA(otroSim)
	}
	
	method difundirConocimiento(unConocimiento){
		if (not(informacion.contains(unConocimiento))){
			self.difundirEntreAmigos(unConocimiento)
		}
	}
	
	method difundirEntreAmigos(unConocimiento){
		amigos.forEach({amigo => amigo.recibirInformacion(unConocimiento)})
	}
	
	method esPrivado(conocimiento){
		return informacion.contains(conocimiento) && not(self.amigosPoseen(conocimiento))
	}
	
	method amigosPoseen(conocimiento){
		return amigos.any({amigo => amigo.informacion().contains(conocimiento)})
	}
		
	method desparramarChisme(chisme,otroSim){
		if(not(otroSim.esPrivado(chisme)))
			error.throwWithMessage("No es un chisme porque no es un conocimiento privado")
		self.difundirConocimiento(chisme)	
	}
	
	method fuentesDeInformacion(){
		return fuentesDeInformacion
	}
	method agregarFuenteInformacion(unaFuente){
		fuentesDeInformacion.add(unaFuente)
	}
	
	method pedirInformacion(){
		return self.proveerChismeDeAmigo()
	}
	
	method proveerChismeDeAmigo(){
		return amigos.map({amigo => amigo.informacion()}).flatten().anyOne()
	}
	



}