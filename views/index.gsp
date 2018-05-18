<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="co.edu.uniandes.search.Tema" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
		<meta name="layout" content="main"/>
		<title>Welcome to Grails</title>

		<script>
			$(function() {
				$('#prb').click();
			});
			function problema()
			{
				$('.pb').show();
				$('.eb').hide();
				$('.rb').hide();
			}
			function examen()
			{
				$('.eb').show();
				$('.pb').hide();
				$('.rb').hide();
			}
			function recurso()
			{
				$('.rb').show();
				$('.pb').hide();
				$('.eb').hide();
			}	
		</script>
	</head>
	<body>
	  	<div class="body">
			<div id="panel-search" class="panel panel-primary">
				<div class="accordion" id="principal">
					<div id="search-basic">
						<span icon="search" aria-label="search" role="img"></span>			
						<g:form controller="Busqueda" class="form-inline form-search-basic" id="form-search-basic">
							<g:field  type="text" name="busqueda" placeholder="Ingrese términos de búsqueda" required="true"  />						
							<g:actionSubmit value="Buscar" action="busquedaSimple" type="button" class="button-search" />	
						</g:form>
					</div> 
					<div id="search-advanced">		
						<div id="title-search-advanced">
							<span icon="search-advanced" aria-label="search" role="img" id="icon-advanced" data-toggle="collapse" data-parent="#principal" aria-expanded="false" href="#com2" onclick="changeSearchBasic()"></span>	
							<b data-toggle="collapse" data-parent="#principal" aria-expanded="false" href="#com2" onclick="changeSearchBasic()">Búsqueda avanzada</b>
						</div>					
						<div id="com2" class="accordion-body collapse">
							<div class="accordion-inner">
								<g:form controller="Busqueda" style="text-align:center;">
									<div class="fila">
										<label class="radio-inline"><input id="prb" onclick="problema()" type="radio" name="opcion" value="1" checked="checked">Problema<span class="checkmark"></span></label>
										<label class="radio-inline"><input onclick="examen()" type="radio" name="opcion" value="2">Examen<span class="checkmark"></span></label>
										<label class="radio-inline"><input onclick="recurso()" type="radio" name="opcion" value="3">Recurso<span class="checkmark"></span></label>
									</div>
									<div class="fila">										
										<g:field type="text" name="nombre" value="" placeholder="ID" />
											<select name="dificultad" class="pb">
												<option value="" selected="selected" >Dificultad</option>
												<option value="Alta" >Alta</option>
												<option value="Media" >Media</option>
												<option value="Baja" >Baja</option>
											</select>
											<select name="curso">
												<option value="" selected="selected" >Curso</option>
												<option value="Algebra lineal">Algebra lineal </option>
											</select>
											<select name="periodo" class="eb">
												<option value="" selected="selected" >Periodo</option>
												<option value="Primer semestre">Primer semestre </option>
												<option value="Segundo semestre">Segundo semestre </option>
												<option value="Vacaciones">Vacaciones </option>
											</select>
											<select name="parcial" class="eb">
												<option value="" selected="selected" >Parcial</option>
												<option value="Parcial 01">Parcial 1 </option>
												<option value="Parcial 02">Parcial 2 </option>
												<option value="Parcial 03">Parcial 3 </option>
												<option value="Examen Final">Exámen Final </option>
												<option value="Taller">Taller </option>
												<option value="Quiz">Quiz </option>
											</select>
											<select name="formato" class="rb">
												<option value="" selected="selected" >Formato</option>
												<option value="3-D">3-D </option>
												<option value="Animación">Animación </option>
												<option value="Artículo">Artículo </option>
												<option value="Borrador">Borrador </option>
												<option value="Imagen">Imagen </option>
												<option value="Libro">Libro </option>
												<option value="Objeto de aprendizaje">Objeto de aprendizaje </option>
												<option value="Página Web">Página Web </option>
												<option value="Presentación">Presentación </option>
												<option value="Reporte">Reporte </option>
												<option value="Sonido">Sonido </option>
												<option value="Tésis">Tésis </option>
												<option value="Video">Video </option>
												<option value="Otro">Otro </option>
											</select>
									</div>
									
									<div class="fila" id="temas-fila">
										<g:hiddenField name="temas" required="true" value="${temas }" placeholder="Selección" />
										<div id="temas-container">
												<g:select name="tema" id="tema" class="pb" from="${Tema.findAll{nivel == 1} }" optionKey="id" noSelection="['0':'-Seleccione un tema- ']" onChange="temaCambiado(this.value);" />
												<span id="subContainer"></span>
												<span id="subContainer2"></span>
												<span id="subContainer3"></span>
										</div>
										<g:field type="text" name="profesor" class="eb" placeholder="Profesor" />
										<g:field type="text" name="anio" class="eb" placeholder="Año" />			
									</div>

									<div id="button-search-advanced">
										<g:actionSubmit value="Buscar" action="resultadoAvanzadoGlobal" type="button" />
									</div>
								</g:form>  
							</div> <%-- accordion-inner --%>
						</div> <%-- accordion-body --%>
					</div> <%-- accordion-group --%>
				</div> <%-- div accordion --%>
			</div> <%--div panel --%>
		</div> <%--fin de div body --%>
		<script type="text/javascript">
			function temaCambiado(temaId){
				<g:remoteFunction controller="busqueda" action="temaCambiado" update="subContainer" params="'temaId=' +temaId" />
				}
		</script>
		<script type="text/javascript">
			function subtemaCambiado(subtemaId){
				<g:remoteFunction controller="busqueda" action="subtemaCambiado" update="subContainer2" params="'subtemaId=' +subtemaId" />
				}
		</script>
		<script type="text/javascript">
			function subtema2Cambiado(subtema2Id){
				<g:remoteFunction controller="busqueda" action="subtema2Cambiado" update="subContainer3" params="'subtema2Id=' +subtema2Id" />
				}
		</script>
	</body>
</html>