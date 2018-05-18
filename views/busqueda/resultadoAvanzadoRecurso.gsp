<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="co.edu.uniandes.search.Tema" %>
	<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
		<meta name="layout" content="main" />
	</head>

	<body>
		<div id="funnel"></div>
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h5 class="modal-title" id="exampleModalLabel">Filtros sobre búsqueda realizada</h5>
					</div>
					<div class="modal-body">
		
						<div id="fields">
							<div class="row">
								<div class="col-sm-6">
									<input id="filtroRe" type="text" placeholder="Buscar" class="rb" />
								</div>
								<div class="col-sm-6">
									<select id="selCursoR" class="event-type-select rb">
										<option value="curso">Curso</option>
										<option value="Algebra Lineal">Algebra Lineal</option>
									</select>
								</div>
								<div class="col-sm-6">
									<select id="sel3" class="event-type-select4 rb">
										<option value="Formato">Formato</option>
										<option value="3-D">3-D</option>
										<option value="Animación">Animación</option>
										<option value="Artículo">Artículo</option>
										<option value="Borrador">Borrador</option>
										<option value="Imagen">Imagen</option>
										<option value="Libro">Libro</option>
										<option value="Objeto de aprendizaje">Objeto de aprendizaje</option>
										<option value="Página Web">Página Web</option>
										<option value="Presentación">Presentación</option>
										<option value="Reporte">Reporte</option>
										<option value="Sonido">Sonido</option>
										<option value="Tésis">Tésis</option>
										<option value="Video">Video</option>
										<option value="Otro">Otro</option>
									</select>
								</div>
							</div>
						</div>
		
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
						<button type="button" class="btn btn-primary" data-dismiss="modal">Aplicar filtros</button>
					</div>
				</div>
			</div>
		</div>
		<div id="filters-left">
			<h2><b>${total} </b><br> Resultados<br>  de búsqueda</h2>
			<hr>
			
			<div id="fields">
				<input id="filtroRe" type="text" placeholder="Buscar" class="rb" />
				<select id="selCursoR" class="event-type-select rb">
					<option value="curso">Curso</option>
					<option value="Algebra Lineal">Algebra Lineal</option>
				</select>
				<select id="sel3" class="event-type-select4 rb">
					<option value="Formato">Formato</option>
					<option value="3-D">3-D</option>
					<option value="Animación">Animación</option>
					<option value="Artículo">Artículo</option>
					<option value="Borrador">Borrador</option>
					<option value="Imagen">Imagen</option>
					<option value="Libro">Libro</option>
					<option value="Objeto de aprendizaje">Objeto de aprendizaje</option>
					<option value="Página Web">Página Web</option>
					<option value="Presentación">Presentación</option>
					<option value="Reporte">Reporte</option>
					<option value="Sonido">Sonido</option>
					<option value="Tésis">Tésis</option>
					<option value="Video">Video</option>
					<option value="Otro">Otro</option>
				</select>
			</div>
		</div>
		<div id="no-filters">
			<div class="container">
				<div class="row">
					<div id="panel-search" class="panel panel-primary search-on-results new-search">
						<div class="accordion" id="principal">
							<div id="search-basic">
								<span icon="search" aria-label="search" role="img"></span>
								<g:form controller="Busqueda" class="form-inline form-search-basic" id="form-search-basic">
									<g:field type="text" name="busqueda" placeholder="Ingrese términos de búsqueda" required="true" />
									<g:actionSubmit value="Buscar" action="busquedaSimple" type="button" class="button-search" />
								</g:form>
							</div>
							<div id="search-advanced">
								<div id="title-search-advanced">
									<span id="icon-advanced" icon="search-advanced" aria-label="search" role="img" id="icon-advanced" data-toggle="collapse"
										data-parent="#principal" aria-expanded="false" href="#com2" onclick="changeSearchBasic()"></span>
								</div>
								<div id="com2" class="accordion-body collapse">
									<div class="accordion-inner">
		
										<g:form controller="Busqueda" style="text-align:center;">
											<div class="fila">
												<label class="radio-inline">
													<input id="trouble" onclick="ftrouble()" type="radio" name="opcion" value="1" checked="checked">Problema
													<span class="checkmark"></span>
												</label>
												<label class="radio-inline">
													<input onclick="fexam()" type="radio" name="opcion" value="2">Examen
													<span class="checkmark"></span>
												</label>
												<label class="radio-inline">
													<input onclick="fresource()" type="radio" name="opcion" value="3">Recurso
													<span class="checkmark"></span>
												</label>
											</div>
											<div class="fila">
												<g:field type="text" name="nombre" value="" placeholder="ID" />
												<select name="dificultad" class="pro">
													<option value="" selected="selected">Dificultad</option>
													<option value="Alta">Alta</option>
													<option value="Media">Media</option>
													<option value="Baja">Baja</option>
												</select>
												<select name="curso">
													<option value="" selected="selected">Curso</option>
													<option value="Algebra lineal">Algebra lineal </option>
												</select>
												<select name="periodo" class="exm">
													<option value="" selected="selected">Periodo</option>
													<option value="Primer semestre">Primer semestre </option>
													<option value="Segundo semestre">Segundo semestre </option>
													<option value="Vacaciones">Vacaciones </option>
												</select>
												<select name="parcial" class="exm">
													<option value="" selected="selected">Parcial</option>
													<option value="Parcial 01">Parcial 1 </option>
													<option value="Parcial 02">Parcial 2 </option>
													<option value="Parcial 03">Parcial 3 </option>
													<option value="Examen Final">Exámen Final </option>
													<option value="Taller">Taller </option>
													<option value="Quiz">Quiz </option>
												</select>
												<select name="formato" class="rec">
													<option value="" selected="selected">Formato</option>
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
													<g:select name="tema" id="tema" class="pro" from="${Tema.findAll{nivel == 1} }" optionKey="id" noSelection="['0':'-Seleccione un tema- ']"
														onChange="temaCambiado(this.value);" />
													<span id="subContainer"></span>
													<span id="subContainer2"></span>
													<span id="subContainer3"></span>
												</div>
												<g:field type="text" name="profesor" class="exm" placeholder="Profesor" />
												<g:field type="text" name="anio" class="exm" placeholder="Año" />
											</div>
		
											<div id="button-search-advanced">
												<g:actionSubmit value="Buscar" action="resultadoAvanzadoGlobal" type="button" />
											</div>
										</g:form>
									</div>
									<%-- accordion-inner --%>
								</div>
								<%-- accordion-body --%>
							</div>
						</div>
						<%-- div accordion --%>
					</div>
					<%--div panel --%>
				</div>
				<div class="row">
					<div class="container-box">
						<g:each in="${listado }" var="recurso" status="i">
							<div class="box rrb idr" data-formato="${recurso.formato}" data-cursoR="${recurso.curso}">
								<div class="box-head">
									<b>${recurso.nombre }</b>
								</div>
								<div class="box-body">
									<p>
										<strong>Curso: </strong>${recurso.curso }
									</p>
									<p>
										<strong>Formato: </strong>${recurso.formato }
									</p>
								</div>
								<div class="box-footer">
									<a target="_blank" href="${recurso.url}">
										<hr title="Visualice el contenido">
									</a>
								</div>
							</div>

						</g:each>
					</div>
				</div>
			</div>
		</div>
		<div class="clearfix"></div>
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