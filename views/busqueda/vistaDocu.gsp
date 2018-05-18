<%@ page contentType="text/html;charset=UTF-8" %>
	<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
		<meta name="layout" content="main" />
		<title>Insert title here</title>

		<script>
			window.twttr = (function (d, s, id) {
				var js, fjs = d.getElementsByTagName(s)[0],
					t = window.twttr || {};
				if (d.getElementById(id)) return t;
				js = d.createElement(s);
				js.id = id;
				js.src = "https://platform.twitter.com/widgets.js";
				fjs.parentNode.insertBefore(js, fjs);

				t._e = [];
				t.ready = function (f) {
					t._e.push(f);
				};

				return t;
			}(document, "script", "twitter-wjs"));
		</script>


	</head>

	<body>
		<div id="pdf-container" class="container container-box">
			<div id="regresar">
				<a href="#" id="action-regresar" onclick="javascript:window.history.back();"><< Regresar</a>
			</div>
			<g:if test="${tipo == 'problema' }">
				<div class="box rpb idp result">
					<div class="box-head">
						<b>${tema}</b>
						<p>${subtemas}</p>
					</div>
					<div>
						<div id="description">
							<div class="box-body">
								<p><strong>Dificultad: </strong>${dificultad}</p>
								<p><strong>Curso: </strong>${curso }</p>
							</div>
							<div class="box-footer">
								<hr class="no-eye">
								<p>${nombre}</p>
							</div>
						</div>
						<div id="pdf-subcontainer">
							<iframe src="${ruta}" width=100% height="480"></iframe>
						</div>
					</div>
				</div>

				<div class="panel-body">
					<div>
						<a href="https://twitter.com/intent/tweet?text=${ruta }" class="twitter-hashtag-button" data-show-count="true">Tweet</a>
						<script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
						<iframe src="https://www.facebook.com/plugins/share_button.php?href=${ruta }&layout=button_count&size=small&mobile_iframe=true&width=91&height=20&appId"
						 width="91" height="20" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowTransparency="true"></iframe>
					</div>
				</div>
			</g:if>
			<g:if test="${tipo == 'examen' }">
				<div class="box reb ide result">
					<div class="box-head">
						<b>${periodo}</b>
						<p>${parcial}</p>
					</div>
					<div>
						<div id="description">
							<div class="box-body">
								<p><strong>Profesor: </strong>${profesor}</p>
								<p><strong>Fecha: </strong>${fecha}</p>
							</div>
							<div class="box-footer">
								<hr class="no-eye">
								<p>${nombre}</p>
							</div>
						</div>
						<div id="pdf-subcontainer">
							<iframe src="${ruta}" width=100% height="480"></iframe>
						</div>
					</div>
				</div>

				<div class="panel-body">
					<div>
						<a href="https://twitter.com/intent/tweet?text=${ruta }" class="twitter-hashtag-button" data-show-count="true">Tweet</a>
						<script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
						<iframe src="https://www.facebook.com/plugins/share_button.php?href=${ruta }&layout=button_count&size=small&mobile_iframe=true&width=91&height=20&appId"
							width="91" height="20" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowTransparency="true"></iframe>
					</div>
				</div>
			</g:if>
			<g:if test="${tipo == 'recurso' }">
				<div class="box rrb idr result">
					<div class="box-head">
						<b>${nombre}</b>
					</div>
					<div>
						<div id="description">
							<div class="box-body">
								<p><strong>Curso: </strong>${curso }</p>
								<p><strong>Formato: </strong>${formato}</p>
								<p><strong>Descripción: </strong>${descripcion}</p>
							</div>
						</div>
						<div id="url">
							<a target="_blank" href="${url}">
								<input type="submit" value="VER RECURSO">
							</a>
						</div>
					</div>
				</div>

				<div class="panel-body">
					<div>
						<a href="https://twitter.com/intent/tweet?text=${url }" class="twitter-hashtag-button" data-show-count="true">Tweet</a>
						<script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
						<iframe src="https://www.facebook.com/plugins/share_button.php?href=${url }&layout=button_count&size=small&mobile_iframe=true&width=91&height=20&appId"
							width="91" height="20" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowTransparency="true"></iframe>
					</div>
				</div>
			</g:if>
		</div>
	</body>

	</html>