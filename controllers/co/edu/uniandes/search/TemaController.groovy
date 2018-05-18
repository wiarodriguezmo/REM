package co.edu.uniandes.search

import co.edu.uniandes.dspace.RepositorioService
import grails.plugin.springsecurity.annotation.Secured

@Secured(['permitAll'])

class TemaController {

    static scaffold = true
	
	def listarTemas(){
		def listadoTemas = Tema.list()
		
		return [temas: listadoTemas]
	}
}
