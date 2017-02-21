import Celos.*
import EstadosDeAnimo.*
import Sim.*
import Personalidades.*


object abrazoComun {
	method abrazar(simAbrazador,simAbrazado){
		simAbrazador.aumentarFelicidad(2)
		simAbrazado.aumentarFelicidad(4)
	}
}

object abrazoProlongado {
	method abrazar(simAbrazador,simAbrazado){
		if(simAbrazado.leAtrae(simAbrazador)){
			simAbrazado.estadoDeAnimo(soniador)
		}
		else{
			simAbrazado.estadoDeAnimo(incomodo)
		}
	}
}

