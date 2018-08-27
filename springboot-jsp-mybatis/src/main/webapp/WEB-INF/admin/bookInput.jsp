<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE >
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link
	href="resources/theme/<spring:theme code='themebase'/>/bootstrap.css"
	rel="stylesheet" type="text/css" />
<title>书籍录入页面</title>

<style type="text/css">
.custom-file-label::after {
	content: "请选择文件";
}
</style>

</head>
<body>

	<div class="container card">
		<div class="row">
			<div class="col-md-12" style="padding: 0px;">
				<jsp:include page="common/top.jsp"></jsp:include>
			</div>
		</div>
		<div class="row">
			<jsp:include page="common/form.jsp"></jsp:include>
		</div>

		<div class="row">
			<jsp:include page="common/bottom.jsp"></jsp:include>
		</div>
	</div>



	<script type="text/javascript"
		src="resources/bower_components/jquery/dist/jquery.min.js"></script>
	<script type="text/javascript">
		$(function() {
			$("#changeTheme").val("<spring:theme code='themebase'/>");
		})
	</script>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>

	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>


	<script type="text/javascript"
		src="resources/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js">
		
	</script>

	<script type="text/javascript"
		src="resources/bower_components/jquery-validation/dist/jquery.validate.min.js">
		
	</script>

	<script type="text/javascript"
		src="resources/bower_components/bootstrap-datepicker/dist/locales/bootstrap-datepicker.zh-CN.min.js">
		
	</script>

	<script type="text/javascript"
		src="resources/bower_components/uri-util/dist/uri-util.min.js"></script>

	<script type="text/javascript" src="resources/js/common.js"></script>


</body>
</html>