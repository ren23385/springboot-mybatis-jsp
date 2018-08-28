<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<div class="col-sm-12 card"
	style="background-color: rgba(0, 0, 255, .1); padding: 0px;">
	<div class="col-md-12" style="padding-top: 40px;">
		<form:form action="editBook" method="post"
			enctype="multipart/form-data" modelAttribute="book">

			<!-- id -->
			<div>
				<form:hidden path="id" readonly="true" />
			</div>
			<!-- name -->
			<div class="form-group row">
				<div class="col-sm-2">
					<form:label path="name" cssClass="col-form-label">书籍名称</form:label>
				</div>
				<div class="col-sm-6">
					<form:input path="name" cssClass="form-control is-invalid" />
				</div>
				<div class="col-sm-4">
					<form:errors path="name"></form:errors>
				</div>

			</div>
			<!-- tid -->
			<div class="form-group row">
				<form:label path="tid" cssClass="col-sm-2 col-form-label">书籍类型</form:label>
				<div class="col-sm-6">
					<form:select path="tid" items="${typeList}" itemLabel="name"
						itemValue="id" cssClass="form-control"></form:select>
				</div>
				<div class="col-sm-4">
					<form:errors path="tid"></form:errors>
				</div>
			</div>

			<!-- descri -->
			<div class="form-group row">
				<form:label path="descri" cssClass="col-sm-2 col-form-label">相关描述</form:label>
				<div class="col-sm-6">
					<form:textarea path="descri" cssClass="form-control" />
				</div>
				<div class="col-sm-4">
					<form:errors path="descri"></form:errors>
				</div>
			</div>

			<!-- factor -->
			<div class="form-group row">
				<form:label path="factor" cssClass="col-sm-2 col-form-label">书籍作者</form:label>
				<div class="col-sm-6">
					<form:input path="factor" cssClass="form-control" />
				</div>
				<div class="col-sm-4">
					<form:errors path="factor"></form:errors>
				</div>
			</div>

			<!-- date -->
			<div class="form-group row">
				<form:label path="date" cssClass="col-sm-2 col-form-label">出版日期</form:label>
				<div class="col-sm-6">
					<form:input path="date" cssClass="form-control" />
				</div>
				<div class="col-sm-4">
					<form:errors path="date"></form:errors>
				</div>
			</div>

			<!-- price -->
			<div class="form-group row">
				<form:label path="price" cssClass="col-sm-2 col-form-label">书籍价格</form:label>
				<div class="col-sm-6">
					<form:input path="price" cssClass="form-control" />
				</div>
				<div class="col-sm-4">
					<form:errors path="price"></form:errors>
				</div>
			</div>

			<!-- photo -->
			<div class="form-group row">
				<label for="file" class="col-sm-2 col-form-label">书籍图片</label>
				<div class="col-sm-6">
					<div class="custom-file">
						<input type="file" class="custom-file-input" id="file" name="file">
						<label class="custom-file-label form-control" for="customFile">选择文件</label>
					</div>
					<div class="col-sm-4"></div>
				</div>
			</div>
			
			
			<!-- 验证码 -->
			<div class="form-group row">
				<form:label path="vcode" cssClass="col-sm-2 col-form-label">验证码</form:label>
				<div class="col-sm-6">
					<form:input path="vcode" cssClass="form-control" />
					<form:errors path="vcode"></form:errors>
				</div>
				<div class="col-sm-4">
					<img title="点击换图片" src="Vcode.png" class="vcodeimg"><a
								class="vcodeimg">换一张</a>
				</div>
			</div>

			<div class="form-group row">
				<div class="col-sm-12 offset-md-2">
					<div class="col-sm-6">
					<button type="submit" class="btn btn-primary col-sm-12">提交</button>
					</div>
				</div>
			</div>
		</form:form>
	</div>
</div>



<script type="text/javascript"
	src="resources/bower_components/jquery/dist/jquery.min.js">
	
</script>

<script type="text/javascript">
	<spring:bind path="book">
	<spring:hasBindErrors name="book">
	<c:forEach items="${requestScope.errors.fieldErrors}" var = "error">
	//注意不要根据id 因为标签的id 可能被修改 而name无法被修改
	$("[name = ${error.field}]").addClass("is-invalid")
	</c:forEach>
	</spring:hasBindErrors>
	</spring:bind>
</script>

<script type="text/javascript">
	$(function() {
		//日期控件
		$('#date').datepicker({
			format : 'yyyy-mm-dd',//日期格式
			language : 'zh-CN',//提示中文界面
			autoclose : true
		//自动关闭
		});
	});
</script>

<script type="text/javascript">
	$(function() {
		$(".col-sm-4 .vcodeimg").click(
				function() {
					//追加一个随机数，要不然只能换一次
					$(".col-sm-4 img.vcodeimg").attr("src",
							"Vcode.png?t=" + Math.random());
				});
	});
</script>