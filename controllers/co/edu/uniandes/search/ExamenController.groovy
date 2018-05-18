package co.edu.uniandes.search

class ExamenController {

    def index() { }
	
	def buscaExamen()
	{
		def nombre = params.nombre
		def anio = params.anio
		def periodo = params.periodo
		def parcial = params.parcial
		def profesor = params.profesor
		def curso = params.curso
		
		[nombre:nombre,anio:anio,periodo:periodo,parcial:parcial,profesor:profesor,curso:curso]
	}
}
