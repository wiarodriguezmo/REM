<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title>Repositorio de Matemáticas</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">
  		<asset:stylesheet src="bootstrap.min.css" />
<%--		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>--%>
  		<asset:javascript src="bootstrap.min.js" />
  		<asset:stylesheet src="dataTables.css" />
  		<asset:stylesheet src="custom.css" />
		<asset:javascript src="application.js" />
		<g:layoutHead/>
	</head>
	<body>
		<nav class="navbar navbar-default tc-header">
			<div class="container">
				<div class="navbar-header">
					<!-- <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse" aria-expanded="false">
						<i class="fa fa-bars fa-lg" aria-hidden="true"></i>
					</button>
					<div class="collapse navbar-collapse" id="navbar-collapse">
						<ul class="nav navbar-nav navbar-right">
							<sec:ifLoggedIn>
								<sec:ifAllGranted roles="ROLE_ADMIN">
									<li><a href="${createLink(uri: '/')}" title="Administración del sitio">Administración</a></li>
								</sec:ifAllGranted>
								<li><g:link action="logout" class="register">Logout</g:link></li>
							</sec:ifLoggedIn>
						</ul>
					</div> -->
					<a href="/IP17REM/" class="navbar-brand">
						<div class="tc-header-logo"></div>
					</a>
				</div>
				
				<a id="rem-logo" href="http://pentagonov.uniandes.edu.co/" target="_blank">
					<asset:image src="logo_pentagono.png" />
				</a>
							
					
			</div>
		</nav>
		<div class="container-general">
			<g:if test="${flash.message}">
				<div id="alertBox" class="alert alert-info alert-dismissable fade in" role="alert">
					<a href="#" class="close" data-dismiss="alert" aria-label="close"><i class="fa fa-times" aria-hidden="true"></i></a>
					<strong>${flash.message}</strong>
				</div>
			</g:if>
			<g:if test="${flash.error}">
				<div id="alertBox" class="alert alert-danger alert-dismissable fade in" role="alert">
					<a href="#" class="close" data-dismiss="alert" aria-label="close"><i class="fa fa-times" aria-hidden="true"></i></a>
					<strong>${flash.error}</strong>
				</div>
			</g:if>
			<div id="modal-creditos" class="modal fade" role="dialog">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="tc-modal-header modal-header">
							<button type="button" class="close" data-dismiss="modal"><i class="fa fa-times" aria-hidden="true"></i></button>
							<h4 class="modal-title">Créditos</h4>
						</div>
						<div class="modal-body">
							<div class="row">
								<div class="col-xs-12 col-md-6">
									<div class="panel panel-default">
									    <div class="panel-heading tc-panel-heading-dark">Participantes Departamento de Matemáticas</div>
										<div class="panel-body">
											<h4>Margarita Botero de Meza</h4>
											<p>Profesora</p>
										</div>
									</div><!-- /.panel -->
								</div>
								<div class="col-xs-12 col-md-6">
									<div class="panel panel-default">
									    <div class="panel-heading tc-panel-heading-dark">Participantes Conecta-TE</div>
										<div class="panel-body">
											<h4>Gloria Cortés Buitrago</h4>
											<p>Jefe de Innovación Tecnológica</p>
											<hr/>
											<h4>Carlos Ricardo Calle Archila</h4>
											<p>Coordinador de desarrollo de software</p>
											<hr/>
											<h4>Sergio Bustos García</h4>
											<p>Desarrollador</p>
											<hr/>
											<h4>Miguel Fernando Higuera Prieto</h4>
											<p>Desarrollador</p>
											<hr/>
											<h4>Daniel Santamaría Rodríguez</h4>
											<p>Coordinador de proyecto</p>
										</div>
									</div><!-- /.panel -->
								</div>
							</div>
						</div><!-- /.modal-body -->
					</div>
				</div>
			</div>
			<g:layoutBody/>
			<script>
                $(document).ready(function(){
                    $('[data-toggle="popover"]').popover();
                    $('[data-toggle="tooltip"]').tooltip();
                });
			</script>
		</div>
		<div class="footer" role="contentinfo" style="background: black;">
			<div class="container">
				<div class="row">
					<div class="col-xs-12 col-sm-2 text-left">
						<a href="http://uniandes.edu.co/" target="_blank" alt="Uniandes">
							<asset:image src="uniandes.png" style="margin-top: 50px;" />
						</a>
					</div>
					<div class="col-xs-12 col-sm-8 text-center">
						Universidad de los Andes | Vigilada Mineducación 
						<br />
						Reconocimiento como Universidad: Decreto 1297 del 30 de mayo de 1964.
						<br />
						Reconocimiento personería jurídica: Resolución 28 del 23 de febrero de 1949 Minjusticia.
						<br />
						Cra 1 Nº 18A- 12 Bogotá, (Colombia) | Código postal: 111711 | Tels: +571 3394949 - +571 3394999
						<br>
						<a href="#" class="tc-btn-credits" id="lauch-modal-credits">Créditos</a>
					</div>
					<div class="col-xs-12 col-sm-2 text-right">
						<a href="http://conectate.uniandes.edu.co/" target="_blank" alt="ConectaTE">
							<asset:image src="conectate.png" style="margin-top: 50px;" />
						</a>
					</div>
				</div>
			</div>
		</div>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
	</body>
</html>
