import Sim.*
import Abrazos.*
import Celos.*
import EstadosDeAnimo.*
import FuentesDeInformacion.*
import Personalidades.*
import SituacionesSentimentales.*
import Trabajos.*

class Libro{
	var capitulos 
	
	constructor(listaConCapitulos){
		capitulos = listaConCapitulos
	}
	
	method pedirInformacion(){
		return capitulos.anyOne()
	}
}

object tinelli {
	method pedirInformacion(){
		return "tot�"
	}
}

object rial {
	method pedirInformacion(){
		return "esc�ndalo"
	}
}