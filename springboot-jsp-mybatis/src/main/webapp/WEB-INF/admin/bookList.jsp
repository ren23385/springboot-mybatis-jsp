<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>书籍列表</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<link
	href="resources/theme/<spring:theme code='themebase'/>/bootstrap.css"
	rel="stylesheet" type="text/css" />
<link href="resources/icon/iconFonts.css" rel="stylesheet"
	type="text/css" />
</head>
<body>

	<div class="container card">

		<div class="row">
			<div class="col-md-12" style="padding: 0px;">
				<jsp:include page="common/top.jsp"></jsp:include>
			</div>
		</div>

		<div class="row card">
			<div class="card-header">
				<form class="form-inline" action="bookList" id="bookListSearchFrm">
					<!-- 默认看第一页 ,简化点击分页链接时候带表单参数问题-->
					<input name="pageNo" type="hidden" value="1"> <label
						class="sr-only" for="inlineFormInputName2">名字 </label> <input
						type="text" class="form-control mb-2 mr-sm-2"
						id="inlineFormInputName2" placeholder="书名" name="name"
						value="${param.name }"> <label class="sr-only"
						for="inlineFormInputName2">类型 </label> 
					<select name="tid"
						class="form-control mb-2 mr-sm-2" id="tid_sel">
						<option value="-1">--请选择--</option>
						<c:forEach items="${types}" var="type">
							<option value="${type.id }">${type.name }</option>
						</c:forEach>
					</select>
					<button type="submit" class="btn btn-primary mb-2">Submit</button>
				</form>


			</div>
			<div class="card-body">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>序号</th>
							<th>书籍名称</th>
							<th>书籍种类</th>
							<th>书籍描述</th>
							<th>书籍价格</th>
							<th>书籍作者</th>
							<th>出版日期</th>
							<th>书籍图片</th>
							<th>相关操作</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<c:choose>

								<c:when test="${empty pageInfo.list}">
									<td colspan="9">无数据</td>
								</c:when>

								<c:otherwise>


									<c:forEach items="${pageInfo.list}" var="book">
										<tr>
											<td>${book.id}</td>
											<td>${book.name}</td>
											<td>${book.tid}</td>
											<td>${book.descri}</td>
											<td>${book.price}</td>
											<td>${book.factor}</td>
											<td><fmt:formatDate value="${book.pubdate}"
													pattern="yyyy-MM-dd" /></td>
											<td><img alt="" src="/upload/${book.photo}"
												style="max-height: 100px;"></td>

											<td><a href="bookDel?id=${book.id}"
												style="text-decoration: none;" title="删除" id="delBook" onclick="delConfirm(event)">
													<span class="icon-cross"></span>
											</a>&nbsp;&nbsp; <a href="toBookEdit?id=${book.id}"
												style="text-decoration: none" title="编辑" onclick="editConfirm(event)"> <span
													class="icon-pencil"></span>
											</a></td>
										</tr>
									</c:forEach>

								</c:otherwise>
							</c:choose>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="card-footer text-muted">
				<nav aria-label="...">
					<ul class="pagination">

						<!-- 前一页 -->
						<c:choose>
							<c:when test="${pageInfo.isFirstPage }">
								<li class="disabled" class="page-item"><a
									href="javascript:void(0)" class="page-link">&laquo;</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a
									href="bookList?pageNo=${pageInfo.prePage }" class="page-link">&laquo;</a></li>
							</c:otherwise>
						</c:choose>
						<!-- 最多显示8个链接 -->
						<c:forEach items="${pageInfo.navigatepageNums }" var="pi">
							<li
								class="page-item
								<c:if test="${pi==pageInfo.pageNum }">active</c:if>
							">
								<a href="bookList?pageNo=${pi }" class="page-link">${pi}</a>
							</li>
						</c:forEach>
						<c:choose>
							<c:when test="${pageInfo.isLastPage }">
								<!-- javascript:void(0)就是取消超级链接的默认行为方式
-->
								<li class="disabled"><a href="javascript:void(0)"
									class="page-link">&raquo;</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a
									href="bookList?pageNo=${pageInfo.nextPage }" class="page-link">&raquo;</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</nav>
			</div>
		</div>
	</div>



	<!-- 删除确认框 -->
	<!-- Modal -->
	<div class="modal fade" id="delDlg" tabindex="-1" role="dialog">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">删除确认</h5>
					
				</div>
				<div class="modal-body">你确认要删除?</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary btn_ok">确定</button>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript"
		src="resources/bower_components/jquery/dist/jquery.min.js">
		<script type="text/javascript">
		$(function() {
			$("#changeTheme").val("<spring:theme code='themebase'/>");
			//让tid回填
			$("#tid_sel").val("${empty param.tid?-1:param.tid}");
			//让超级链接追加表单参数，最简单方式阻止超级链接默认行为，为表单添加隐藏字段

			$('a[class="page-link"][href^="bookList?pageNo="]').click(
					function(evt) {
						evt.preventDefault();
						//修改表单中pageNo的值
						$('#bookListSearchFrm input[name="pageNo"]').val(
								$(this).text());
						$("#bookListSearchFrm").submit();
					});

			$("#delDlg").modal({
				backdrop : 'static',//否则你点击对话框外的部分就消失
				show : false
			//默认是显示的
			});

		});
	</script>

	<script type="text/javascript">
		/*$(function() {
			$("#delBook").click(function(e) {

				if (window.confirm('您确定要删除该书籍么？')) {
					return true;

				} else {
					e.preventDefault();
					return false;
				}

			})
		})*/

		function delConfirm(event) {
			//取消超级链接的默认行为
			event.preventDefault();

			//显示模态对话框：点击的是图标，因而我们要找他的父亲a
			var url = $(event.target).parent("a").attr("href");
			$('#delDlg').modal('show');
			//给确认框绑定一次性事件
			$("#delDlg button.btn_ok ").one("click", function() {
				window.location.href = url;
			});
		}
			 
	</script>



	<div class="row">
		<jsp:include page="common/bottom.jsp"></jsp:include>
	</div>


	<script type="text/javascript"
		src="resources/bower_components/jquery/dist/jquery.slim.min.js"></script>
	<script type="text/javascript"
		src="resources/bower_components/bootstrap/dist/js/bootstrap.js"></script>
	<script type="text/javascript"
		src="resources/bower_components/uri-util/dist/uri-util.min.js"></script>

	<script type="text/javascript" src="resources/js/common.js"></script>


</body>
</html>