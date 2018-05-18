<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="co.edu.uniandes.search.Tema" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<meta name="layout" content="main"/>
<title>Insert title here</title>
<g:javascript library='jquery' />
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
	<div style="margin-left:-10%;width:120%;">
		<a href="#" class="btn btn-info" style="margin-bottom:5px;" onclick="javascript:window.history.back();">Volver</a>
  		
  		<div class="panel panel-primary">
  			<div class="panel-heading"><b>Búsqueda avanzada</b></div>
  			<div class="panel-body" style="height:400px;overflow:auto;">
  				<div class="row">
                    <div class="col-md-12">
						<g:form controller="Busqueda" style="text-align:center;">
							<label class="radio-inline"><input id="prb" onclick="problema()" type="radio" name="opcion" value="1" checked="checked">Problemas</label>
							<label class="radio-inline"><input onclick="examen()" type="radio" name="opcion" value="2">Exámenes</label>
							<label class="radio-inline"><input onclick="recurso()" type="radio" name="opcion" value="3">Recursos</label>
							<br>
							<br>
							<g:hiddenField name="temas" required="true" value="${temas }" style="margin-bottom:5px;height:25px;width:89%;" placeholder="Selección" />
							<g:field type="text" name="nombre" value="" style="margin-bottom:5px;height:25px;width:80%;" placeholder="ID" />
							
							<div style="text-align:left;margin-left:10%;">
								<g:select name="tema" id="tema" class="pb" from="${Tema.findAll{nivel == 1} }" optionKey="id" noSelection="['0':'-Seleccione un tema- ']" onChange="temaCambiado(this.value);" style="margin-bottom:5px;height:25px;width:89%;color:grey;" />								
							</div>
							<div style="text-align:left;margin-left:10%;">
								<span id="subContainer"></span>
							</div>
							<div style="text-align:left;margin-left:10%;">
								<span id="subContainer2"></span>
							</div>
							<div style="text-align:left;margin-left:10%;">
								<span id="subContainer3"></span>
							</div>
														
							<div style="text-align:left;margin-left:10%;">
							<select name="dificultad" class="pb" style="margin-bottom:5px;height:25px;width:89%;color:grey;">
								<option value="" selected="selected" >Dificultad</option>
								<option value="Alta" >Alta</option>
								<option value="Media" >Media</option>
								<option value="Baja" >Baja</option>
							</select>
							</div>
							<div style="text-align:left;margin-left:10%;">
							<select name="curso" style="margin-bottom:5px;height:25px;width:89%;color:grey;">
								<option value="" selected="selected" >Curso</option>
								<option value="Algebra lineal">Algebra lineal </option>
							</select>
							</div>
							<div style="text-align:left;margin-left:10%;">
							<select name="periodo" class="eb" style="margin-bottom:5px;height:25px;width:89%;color:grey;">
								<option value="" selected="selected" >Periodo</option>
								<option value="Primer semestre">Primer semestre </option>
								<option value="Segundo semestre">Segundo semestre </option>
								<option value="Vacaciones">Vacaciones </option>
							</select>
							</div>
							<div style="text-align:left;margin-left:10%;">
							<select name="parcial" class="eb" style="margin-bottom:5px;height:25px;width:89%;color:grey;">
								<option value="" selected="selected" >Parcial</option>
								<option value="Parcial 01">Parcial 1 </option>
								<option value="Parcial 02">Parcial 2 </option>
								<option value="Parcial 03">Parcial 3 </option>
								<option value="Examen Final">Exámen Final </option>
								<option value="Taller">Taller </option>
								<option value="Quiz">Quiz </option>
							</select>
							</div>
							<g:field type="text" name="profesor" class="eb" style="margin-bottom:5px;height:25px;width:80%;" placeholder="Profesor" />
                            <g:field type="text" name="anio" class="eb" style="margin-bottom:5px;height:25px;width:80%;" placeholder="Año" />
                            <%--<g:field type="text" name="formato" class="rb"value="" style="margin-bottom:5px;height:25px;width:80%;" placeholder="Formato" />--%>
                            
                            <div style="text-align:left;margin-left:10%;">
							<select name="formato" class="rb" style="margin-bottom:5px;height:25px;width:89%;color:grey;">
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
                                                    
							<div style="text-align:center;">
								<g:actionSubmit value="Buscar" action="resultadoAvanzadoGlobal" type="button" class="btn btn-info glyphicon glyphicon-search" />
							</div>
						</g:form>
					</div>
				</div>
			</div>
		</div>
	</div>
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