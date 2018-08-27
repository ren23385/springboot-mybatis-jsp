<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

<link
	href="resources/theme/<spring:theme code='themebase'/>/bootstrap.css"
	rel="stylesheet" type="text/css" />
</head>
<body>

	<div class="container card">
		<div class="row">
			<div class="col-md-12" style="padding: 0px;">
			<jsp:include page="common/top.jsp"></jsp:include>
			</div>
		</div>
		<div class="row h-75">
			<jsp:include page="common/middle.jsp"></jsp:include>
		</div>

		<div class="row">
			<jsp:include page="common/bottom.jsp"></jsp:include>
		</div>
	</div>

		
		
	<script type="text/javascript" src="resources/bower_components/jquery/dist/jquery.min.js">
	</script>
	<script type="text/javascript" src="resources/bower_components/bootstrap/dist/js/bootstrap.min.js">
	</script>
	
		
	<script type="text/javascript" src="resources/bower_components/uri-util/uri-util.js"></script>
	<script type="text/javascript" src="resources/js/common.js"></script>

	
	<!--  
	<script type="text/javascript">
		document.getElementById("changeTheme").onchange = function() {
			/* 参数名必须是theme */

			document.location.href = "home?theme="
					+ this.options[this.selectedIndex].value;

		}
	</script>

-->

</body>
</html>