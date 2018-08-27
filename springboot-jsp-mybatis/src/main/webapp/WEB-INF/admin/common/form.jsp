<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<div class="col-sm-12 p-3 card"
	style="background-color: rgba(0, 0, 255, .1); padding: 0px; width: 662px; height: 500px;">
	<div class="col-md-12">
		<form:form action="saveBook" method="post"
			enctype="multipart/form-data" modelAttribute="book">
			<!-- name -->
			<div class="form-group row">
				<div class="col-sm-2">
					<form:label path="name" cssClass="col-form-label">书籍名称</form:label>
				</div>
				<div class="col-sm-6">
					<form:input path="name" cssClass="form-control is-invalid" />
				</div>
				<div class="col-sm-2">
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
				<div class="col-sm-2">
					<form:errors path="tid"></form:errors>
				</div>
			</div>

			<!-- descri -->
			<div class="form-group row">
				<form:label path="descri" cssClass="col-sm-2 col-form-label">相关描述</form:label>
				<div class="col-sm-6">
					<form:textarea path="descri" cssClass="form-control" />
				</div>
				<div class="col-sm-2">
					<form:errors path="descri"></form:errors>
				</div>
			</div>

			<!-- factor -->
			<div class="form-group row">
				<form:label path="factor" cssClass="col-sm-2 col-form-label">书籍作者</form:label>
				<div class="col-sm-6">
					<form:input path="factor" cssClass="form-control" />
				</div>
				<div class="col-sm-2">
					<form:errors path="factor"></form:errors>
				</div>
			</div>

			<!-- date -->
			<div class="form-group row">
				<form:label path="date" cssClass="col-sm-2 col-form-label">出版日期</form:label>
				<div class="col-sm-6">
					<form:input path="date" cssClass="form-control" />
				</div>
				<div class="col-sm-2">
					<form:errors path="date"></form:errors>
				</div>
			</div>

			<!-- price -->
			<div class="form-group row">
				<form:label path="price" cssClass="col-sm-2 col-form-label">书籍价格</form:label>
				<div class="col-sm-6">
					<form:input path="price" cssClass="form-control" />
				</div>
				<div class="col-sm-2">
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
					<div class="col-sm-2"></div>
				</div>
			</div>

			<div class="form-group row">
				<div class="col-sm-6 offset-md-2">
					<button type="submit" class="btn btn-primary">添加</button>
				</div>
				<a href="home"  class="btn btn-primary">返回主页</a>
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