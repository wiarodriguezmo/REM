<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="co.edu.uniandes.search.Tema" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<meta name="layout" content="main"/>
<title>Insert title here</title>
<g:javascript library='jquery' />
</head>
<body>
	<div class="body">
		<a href="#" class="btn btn-info" style="margin-bottom:5px;" onclick="javascript:window.history.back();">Volver</a>
  		<div class="panel panel-primary">
  			<div class="panel-heading"><b>Resultados de búsqueda</b></div>
  			<div class="panel-body" style="height:400px;overflow:auto;">
  				<div class="row">
                    <div class="col-md-12">
						<g:form controller="Busqueda" style="text-align:center;">
							<g:hiddenField name="opcion" required="true" value="${opcion }" style="margin-bottom:5px;height:25px;width:80%;" placeholder="Selección" />
							<g:hiddenField name="busqueda" required="true" value="${busqueda }" style="margin-bottom:5px;height:25px;width:80%;" placeholder="Selección" />
							<g:hiddenField name="temas" required="true" value="${temas }" style="margin-bottom:5px;height:25px;width:80%;" placeholder="Selección" />
							<g:field type="text" name="nombre" value="${busqueda }" style="margin-bottom:5px;height:25px;width:80%;" placeholder="Problema" />
							
							<div style="text-align:left;margin-left:10%;">
								<g:select name="tema" id="tema" from="${Tema.findAll{nivel == 1} }" optionKey="id" noSelection="['0':' ']" onChange="temaCambiado(this.value);" style="margin-bottom:5px;height:25px;width:80%;" />								
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
														
							<g:field type="text" name="dificultad" style="margin-bottom:5px;height:25px;width:80%;" placeholder="Dificultad" />
							<g:field type="text" name="curso" style="margin-bottom:5px;height:25px;width:80%;" placeholder="Curso" />
							<div style="text-align:center;">
								<g:actionSubmit value="Buscar" action="resultadoAvanzadoProblema" type="button" class="btn btn-info glyphicon glyphicon-search" />
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