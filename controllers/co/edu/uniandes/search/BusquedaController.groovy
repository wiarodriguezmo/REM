package co.edu.uniandes.search

import co.edu.uniandes.dspace.RepositorioService
import grails.plugin.springsecurity.annotation.Secured


@Secured(['permitAll'])

class BusquedaController {
	
	def repositorioService

	def index() {
		println("Entr� al index")
	}
	
	
	def busquedaSimple(){
		def idSesion = repositorioService.loginDSpace()
		
		String busqueda = params["busqueda"]
		println(busqueda)
		
		def listadoFin = []
		
		def listadoIni = repositorioService.getItemsColeccion(idSesion, RepositorioService.COLECCION_PENTAGONO)
//		def ls1 = listadoIni.findAll{it instanceof Problema}
//		def ls2 = listadoIni.findAll{it instanceof Examen}
//		def ls3 = listadoIni.findAll{it instanceof Recurso}
		
		
		for(int x=0;x<listadoIni.length;x++){
			
			if(listadoIni[x] instanceof Problema){
				
				if(listadoIni[x].nombre.toLowerCase().contains(busqueda.toLowerCase())){
					listadoFin.add(listadoIni[x])
				}
				
				if(listadoIni[x].dificultad.toLowerCase().contains(busqueda.toLowerCase())){
					listadoFin.add(listadoIni[x])
				}
				
				if(listadoIni[x].temas[0].toLowerCase().contains(busqueda.toLowerCase())){
					listadoFin.add(listadoIni[x])
				}
				
				
				if(listadoIni[x].curso.toLowerCase().contains(busqueda.toLowerCase())){
					listadoFin.add(listadoIni[x])
				}
				
			}
			if(listadoIni[x] instanceof Examen){
				
				if(listadoIni[x].nombre.toLowerCase().contains(busqueda.toLowerCase())){
					listadoFin.add(listadoIni[x])
				}
				
				if(listadoIni[x].parcial.toLowerCase().contains(busqueda.toLowerCase())){
					listadoFin.add(listadoIni[x])
				}
				
				if(listadoIni[x].periodo.toLowerCase().contains(busqueda.toLowerCase())){
					listadoFin.add(listadoIni[x])
				}
				
				if(listadoIni[x].curso.toLowerCase().contains(busqueda.toLowerCase())){
					listadoFin.add(listadoIni[x])
				}
				
				if(listadoIni[x].profesor.toLowerCase().contains(busqueda.toLowerCase())){
					listadoFin.add(listadoIni[x])
				}
				
				if(listadoIni[x].fecha.toLowerCase().contains(busqueda.toLowerCase())){
					listadoFin.add(listadoIni[x])
				}
				
			}
			
			if(listadoIni[x] instanceof Recurso){
				
				if(listadoIni[x].nombre.toLowerCase().contains(busqueda.toLowerCase())){
					listadoFin.add(listadoIni[x])
				}
				
				if(listadoIni[x].curso.toLowerCase().contains(busqueda.toLowerCase())){
					listadoFin.add(listadoIni[x])
				}
				
				if(listadoIni[x].formato.toLowerCase().contains(busqueda.toLowerCase())){
					listadoFin.add(listadoIni[x])
				}
			}
			
		}
		
		def countListado = listadoFin.size()
		render(view:"resultadoBuscarProblema", model:[busqueda:listadoFin, total:countListado, numRegistros: 20])
		
	}
	
	
	
	def resultadoBuscarProblema(){
		String busqueda = params["busqueda"]
		Integer total = params.int("total")
		[busqueda:busqueda, total:total]
	}
	
	def vistaDocu(){
		String ruta = params["ruta"]
		String nombre = params["nombre"]
		String curso = params["curso"]
		String periodo = params["periodo"]
		String parcial = params["parcial"]
		String profesor = params["profesor"]
		String fecha = params["fecha"]
		String dificultad = params["dificultad"]
		String tema = params["tema"]
		String subtemas = params["subtemas"]
		String tipo = params["tipo"]
		
		String formato = params["formato"]
		String descripcion = params["descripcion"]
		String url = params["url"]
		
		[ruta:ruta, nombre:nombre, curso:curso, periodo:periodo, parcial:parcial, profesor:profesor, fecha:fecha, dificultad:dificultad, tema:tema, subtemas:subtemas, tipo:tipo, formato:formato, descripcion:descripcion, url:url]
	}
	
	/*def busquedaAvanzada(){
		def listadoTemas = Tema.list()
		render(view:"criterioAvanzadoGlobal", model:[temas: listadoTemas])
	}*/
	
	/*def criterioAvanzadoProblema(){
		String busqueda = params["busqueda"]
		Integer opcion = params.int("selTipo")
		def temas = params["temas"]
		[busqueda:busqueda, opcion:opcion, temas:temas]
	}
	
	def criterioAvanzadoExamen(){
		String busqueda = params["busqueda"]
		Integer opcion = params.int("selTipo")
		def listado = params["listado"]
		[busqueda:busqueda, opcion:opcion, listado:listado]
	}
	
	def criterioAvanzadoGlobal(){
		def temas = params["temas"]
		[temas:temas]
	}*/
	
	def resultadoAvanzadoGlobal(){
		def idSesion = repositorioService.loginDSpace()
		
		String busqueda = params["busqueda"]
		def temas = params["temas"]
		Integer opcion = params.int("opcion")
		println(opcion)
		String nombre = params["nombre"]
		Integer tema = 0
		tema = params.int("tema")
		String subtema1 = 'b'
		subtema1 = params["subtema1"]
		String subtema2 = 'c'
		subtema2 = params["subtema2"]
		String subtema3 = 'd'
		subtema3 = params["subtema3"]
		String dificultad = params["dificultad"]
		String curso = params["curso"]
		String periodo = params["periodo"]
		String profesor = params["profesor"]
		String parcial = params["parcial"]
		String anio = params["anio"]
		String formato = params["formato"]
		Integer counter = 0

		if(opcion!=null) {
			if(opcion == 1){
				println("Entra a opcion 1")
				
				def listado = repositorioService.getItemsColeccion(idSesion, RepositorioService.COLECCION_PENTAGONO)
				def listado1 = listado.findAll{it instanceof Problema}
				def countListado1 = listado1.size()
				
				if(nombre!=null){
					listado = listado.findAll{it.nombre.toLowerCase().contains(nombre.toLowerCase())}
					listado = listado.findAll{it instanceof Problema}.sort(false){it.nombre}
									
					if(tema != 0){
						/*println("entra al segundo if: " + tema)*/
						String temaA = Tema.get(tema)
						/*println("temaA: " + temaA)*/
						
						listado = listado.findAll{it.temas.contains(temaA)}
			
						if(subtema1!='b'){
							String temaB = Tema.get(subtema1)
							/*println("temaB: " + temaB)*/
							
							listado = listado.findAll{it.temas.contains(temaB)}
							
							if(subtema2!='c'){
								String temaC = Tema.get(subtema2)
								/*println(temaC)*/
								
								listado = listado.findAll{it.temas.contains(temaC)}
								
								if(subtema3!='d'){
									String temaD = Tema.get(subtema3)
									/*println(temaD)*/
									
									listado = listado.findAll{it.temas.contains(temaD)}
	
								}
							}
						}
					}
					
					def countListado = listado.size()
					
					render(view:"resultadoAvanzadoProblema", model:[listado:listado, opcion:opcion, total:countListado, numRegistros: 20])
				}
				
				if(dificultad!=null){
					listado = listado.findAll{it.dificultad.toLowerCase().contains(dificultad.toLowerCase())}
					listado = listado.findAll{it instanceof Problema}.sort(false){it.dificultad}
					def countListado = listado.size()
					
					render(view:"resultadoAvanzadoProblema", model:[listado:listado, opcion:opcion, total:countListado, numRegistros: 20])
				}
	
				if(curso!=null){
					listado = listado.findAll{it.curso.toLowerCase().contains(curso.toLowerCase())}
					listado = listado.findAll{it instanceof Problema}.sort(false){it.curso}
					def countListado = listado.size()
					
					render(view:"resultadoAvanzadoProblema", model:[listado:listado, opcion:opcion, total:countListado, numRegistros: 20])
				}
				
			}
			else if(opcion == 2){
				println("Entra a opcion 2")
				
				def listado = repositorioService.getItemsColeccion(idSesion, RepositorioService.COLECCION_PENTAGONO)
				if(nombre!=null){
					listado = listado.findAll{it.nombre.toLowerCase().contains(nombre.toLowerCase())}
					listado = listado.findAll{it instanceof Examen}.sort(false){it.nombre}
					def countListado = listado.size()
					
					render(view:"resultadoAvanzadoExamen", model:[listado:listado, opcion:opcion, total:countListado, numRegistros: 20])
				}
				if(curso!=null){
					listado = listado.findAll{it.curso.toLowerCase().contains(curso.toLowerCase())}
					listado = listado.findAll{it instanceof Examen}.sort(false){it.curso}
					def countListado = listado.size()
					
					render(view:"resultadoAvanzadoExamen", model:[listado:listado, opcion:opcion, total:countListado, numRegistros: 20])
				}
				if(periodo!=null){
					listado = listado.findAll{it.periodo.toLowerCase().contains(periodo.toLowerCase())}
					listado = listado.findAll{it instanceof Examen}.sort(false){it.periodo}
					def countListado = listado.size()
					
					render(view:"resultadoAvanzadoExamen", model:[listado:listado, opcion:opcion, total:countListado, numRegistros: 20])
				}
				if(profesor!=null){
					listado = listado.findAll{it.profesor.toLowerCase().contains(profesor.toLowerCase())}
					listado = listado.findAll{it instanceof Examen}.sort(false){it.profesor}
					def countListado = listado.size()
					
					render(view:"resultadoAvanzadoExamen", model:[listado:listado, opcion:opcion, total:countListado, numRegistros: 20])
				}
				if(parcial!=null){
					listado = listado.findAll{it.parcial.toLowerCase().contains(parcial.toLowerCase())}
					listado = listado.findAll{it instanceof Examen}.sort(false){it.parcial}
					def countListado = listado.size()
					
					render(view:"resultadoAvanzadoExamen", model:[listado:listado, opcion:opcion, total:countListado, numRegistros: 20])
				}
				if(anio!=null){
					listado = listado.findAll{it.fecha.toLowerCase().contains(anio.toLowerCase())}
					listado = listado.findAll{it instanceof Examen}.sort(false){it.fecha}
					def countListado = listado.size()
					
					render(view:"resultadoAvanzadoExamen", model:[listado:listado, opcion:opcion, total:countListado, numRegistros: 20])
				}
			}
			
			else if(opcion == 3){
				println("Entra a opcion 3")
				
				def listado = repositorioService.getItemsColeccion(idSesion, RepositorioService.COLECCION_PENTAGONO)
				if(nombre!=null){
					listado = listado.findAll{it.nombre.toLowerCase().contains(nombre.toLowerCase())}
					listado = listado.findAll{it instanceof Recurso}.sort(false){it.nombre}
					def countListado = listado.size()
					
					render(view:"resultadoAvanzadoRecurso", model:[listado:listado, opcion:opcion, total:countListado, numRegistros: 20])
				}
				if(curso!=null){
					listado = listado.findAll{it.curso.toLowerCase().contains(curso.toLowerCase())}
					listado = listado.findAll{it instanceof Recurso}.sort(false){it.curso}
					def countListado = listado.size()
					
					render(view:"resultadoAvanzadoRecurso", model:[listado:listado, opcion:opcion, total:countListado, numRegistros: 20])
				}
				if(formato!=null){
					listado = listado.findAll{it.formato.toLowerCase().contains(formato.toLowerCase())}
					listado = listado.findAll{it instanceof Recurso}.sort(false){it.formato}
					def countListado = listado.size()
					
					render(view:"resultadoAvanzadoRecurso", model:[listado:listado, opcion:opcion, total:countListado, numRegistros: 20])
				}
			}
			else{
				render "Debe escoger una opción válida"
			}
		}else{
			render "Debe escoger una opci�n v�lida "
		}
	}
	
	
	def temaCambiado(long temaId){
		Tema tema = Tema.get(temaId)
				
		def subTemas = []
		
		if(tema != null){
			subTemas = tema.subtemas
		}
		
		render g.select(id:'subtema1', name:'subtema1', class:'pb pro', from:subTemas, optionKey:'id', noSelection:['b':'-Seleccione un subtema 1- '], onChange:'subtemaCambiado(this.value);', style:'' )
	}
	
	def subtemaCambiado(long subtemaId ){
		Tema subtema1 = Tema.get(subtemaId)
					
		def subTemas2 = []
		
		if(subtema1 != null){
			subTemas2 = subtema1.subtemas2
		}
		
		render g.select(id:'subtema2', name:'subtema2', class:'pb pro', from:subTemas2, optionKey:'id', noSelection:['c':'-Seleccione un subtema 2- '], onChange:'subtema2Cambiado(this.value);', style:'' )
	}
	
	def subtema2Cambiado(long subtema2Id ){
		Tema subtema2 = Tema.get(subtema2Id)
					
		def subTemas3 = []
		
		if(subtema2 != null){
			subTemas3 = subtema2.subtemas3
		}
		
		render g.select(id:'subtema3', name:'subtema3', class:'pb pro', from:subTemas3, optionKey:'id', noSelection:['d':'-Seleccione un subtema 3- '], style:'' )
	}
	
}
