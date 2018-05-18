package co.edu.uniandes.search

import co.edu.uniandes.dspace.RepositorioService
import grails.plugin.springsecurity.annotation.Secured

@Secured(['permitAll'])

class RecursoController {

    def index() { }
	
	def buscaRecurso()
	{
		def nombre = params.nombre
		def curso = params.curso
		def formato = params.formato
		def descripcion = params.descripcion
		def url = params.url
		
		[nombre:nombre,curso:curso,formato:formato,descripcion:descripcion,url:url]
	}
}
