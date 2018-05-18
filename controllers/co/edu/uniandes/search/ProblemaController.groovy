package co.edu.uniandes.search
import grails.plugin.springsecurity.annotation.Secured

@Secured(['permitAll'])

class ProblemaController {

    def index() { }
	
	def buscaProblema()
	{
		def nombre = params.nombre
		def tema = params.tema
		def subtema1 = params.subtema1
		def subtema2 = params.subtema2
		def dificultad = params.dificultad
		def curso = params.curso
		
		[nombre:nombre,tema:tema,subtema1:subtema1,subtema2:subtema2,dificultad:dificultad,curso:curso]
	}
}
