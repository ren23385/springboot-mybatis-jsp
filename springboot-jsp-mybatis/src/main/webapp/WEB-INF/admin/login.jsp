<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>登陆</title>
<link href="resources/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0/css/bootstrap.min.css"/>
</head>

<body style="background-color: gray;">

	<div class="container-fluid w-75">
		<div class="row"  style="padding: 100px;">
			<div class="col-sm-10 card"
				style="background-color: rgba(0, 0, 255, .1); width: 600px; height: 300px;">
			
					<form:form action="login" method="post" modelAttribute="admin">
						<!-- msg -->
						<div class="form-group row">
							<div class="is-invalid" style="background-color: red;" role="alert">
							${msg}
							</div>
						</div>

						<!-- name -->
						<div class="form-group row">
							<div class="col-sm-2">
								<form:label path="name" cssClass="col-form-label">用户名：</form:label>
							</div>
							<div class="col-sm-6">
								<form:input path="name" cssClass="form-control is-invalid" />
							</div>
							<div class="col-sm-2">
								<form:errors path="name"></form:errors>
							</div>
						</div>
						<!-- password -->
						<div class="form-group row">
							<form:label path="password" cssClass="col-sm-2 col-form-label">密码：</form:label>
							<div class="col-sm-6">
								<form:password path="password"
									cssClass="form-control is-invalid" />
							</div>
							<div class="col-sm-2">

								<form:errors path="password"></form:errors>
							</div>
						</div>

						<!-- 验证码 -->
					  	<div class="form-group row">
							<label for="Vcode" class="col-sm-2 col-form-label">验证码:</label>
							<div class="col-sm-6">
								<input type="text" id="Vcode" class="form-control" placeholder="验证码" maxlength="4"
									name="Vcode" autocomplete="off">
							</div>
							<div class="col-sm-4">
							<img title="点击换图片" src="Vcode.png" class="vcodeimg"><a
								class="vcodeimg">换一张</a>
							</div>

						</div>


						<div class="form-group row">
							<div class="col-sm-6 offset-md-2">
								<button type="submit" class="btn btn-primary">登陆</button>
							</div>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	





	<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.slim.min.js"></script>
	<script
		src="https://cdn.bootcss.com/popper.js/1.12.9/umd/popper.min.js"></script>
	<script
		src="https://cdn.bootcss.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>





	<script type="text/javascript">
		$(function() {
			$(".col-sm-4 .vcodeimg").click(
					function() {
						//追加一个随机数，要不然只能换一次
						$(".col-sm-4 img.vcodeimg").attr("src","Vcode.png?t=" + Math.random());
					});
		});
	</script>
</body>
</html>