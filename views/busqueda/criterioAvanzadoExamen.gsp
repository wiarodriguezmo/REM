<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<meta name="layout" content="main"/>
<title>Insert title here</title>
</head>
<body>
<div class="body">
	<a href="#" class="btn btn-info" style="margin-bottom:5px;" onclick="javascript:window.history.back();">Volver</a>
	<div class="panel panel-primary">
		<div class="panel-heading"><b>Búsqueda avanzada</b></div>
		<div class="panel-body" style="height:400px;overflow:auto;">
			<div class="row">
				<div class="col-md-12">
					<g:form controller="Busqueda" style="text-align:center;">
						<g:hiddenField name="opcion" required="true" value="${opcion }" style="margin-bottom:5px;height:25px;width:80%;" placeholder="Selección" />
						<g:hiddenField name="busqueda" required="true" value="${busqueda }" style="margin-bottom:5px;height:25px;width:80%;" placeholder="Selección" />
						<g:field type="text" name="nombre" value="${busqueda }" style="margin-bottom:5px;height:25px;width:80%;" placeholder="Examen" />
						<g:field type="text" name="curso" style="margin-bottom:5px;height:25px;width:80%;" placeholder="Curso" />
						<g:field type="text" name="periodo" style="margin-bottom:5px;height:25px;width:80%;" placeholder="Periodo" />
						<g:field type="text" name="parcial" style="margin-bottom:5px;height:25px;width:80%;" placeholder="Parcial" />
						<g:field type="text" name="profesor" style="margin-bottom:5px;height:25px;width:80%;" placeholder="Profesor" />
						<g:field type="text" name="anio" style="margin-bottom:5px;height:25px;width:80%;" placeholder="Año" />
						<div style="text-align:center;">
							<g:actionSubmit value="Buscar" action="resultadoAvanzadoExamen" type="button" class="btn btn-info glyphicon glyphicon-search" />
						</div>
					</g:form>
				</div>		
			</div>
		</div>
	</div>
</div>
</body>
</html>