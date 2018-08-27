<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<nav class="navbar navbar-expand-lg navbar-light bg-light"
	style="padding: 0px">

	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#bs-example-navbar-collapse-1">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div id="imageDiv">
		<img src="resources/bs/img/2018-08-23_145903.png" style="width: 40px;" />
	</div>
	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		<ul class="navbar-nav">
			<li class="nav-item active"><a class="nav-link" href="home">首页
					<span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="navbarDropdownMenuLink"
				data-toggle="dropdown">相关功能 </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
					<a class="dropdown-item" href="toInput">添加</a> <a
						class="dropdown-item" href="bookList">查看</a> <a
						class="dropdown-item" href="#">其他</a>
				</div></li>
		</ul>

		<ul class="navbar-nav ml-md-auto">
			<li class="nav-item active"><a class="nav-link" href="#">切换主题
					<select id="changeTheme">
						<option>darkly</option>
						<option>cerulean</option>
						<option>cosmo</option>
						<option>lumen</option>
						<option>cyborg</option>
						<option>flatly</option>
						<option>journal</option>
						<option>litera</option>
						<option>sketchy</option>
						<option>solar</option>
						<option>slate</option>
				</select>
			</a></li>
			<li class="nav-item dropdown">
			<li class="nav-item ">
			<a class="nav-link ">欢迎${sessionScope.admin.name } 登陆 
			</a>
			</li>
			<li class="nav-item ">
			<a class="nav-link" href="exit">退出</a>
			</li>

			
		</ul>
	</div>
</nav>



