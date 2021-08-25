<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<html>
<head>
	<title>로그인</title>
	<link rel="stylesheet" href="/resources/css/users/login.css">
	<script
	  src="https://code.jquery.com/jquery-3.4.1.js"
	  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	  crossorigin="anonymous"></script>
</head>
<body>
<div class="wrapper">
	<div class="wrap">
	  <form id="login_form" method="post">
		<div class="title_wrap">
			<span>NSHDEV SHOP</span>
		</div>
		<div class="login_wrap"> 
			<div class="id_wrap">
					<div class="input_box id_input_box">
					<input class="input id_input" name="userId">
				</div>
			</div>
			<div class="pw_wrap">
				<div class="input_box pw_input_box">
					<input class="input pw_iput" name="userPw">
				</div>
			</div>
			
			<c:if test="${result == 0}">
				<div class="login_err">사용자 ID 또는 비밀번호를 잘못 입력했습니다.</div>
			</c:if>
			
			<div class="reg_btn_wrap">
				<input type="button" class="reg_btn" value="회원가입">
			</div>
			
			<div class="login_btn_wrap">
				<input type="button" class="login_btn" value="로그인">
			</div>
		</div>
	  </form>
	</div>
</div>
<script>
	$(document).ready(function() {
		$('.login_btn').click(function(e) {
			e.preventDefault();
			
			//alert("로그인 버튼 동작");
			
			//로그인 메소드 서버 요청
			$('#login_form').attr("action", "/users/login");
			$("#login_form").submit();
			
		})
		
		$('.reg_btn').click(function(e) {
			e.preventDefault();
			
			//alert("회원가입 버튼 동작");
			
			//회원가입 메소드 서버 요청
			$('#login_form').attr("method", "get");
			$('#login_form').attr("action", "/users/register");
			$("#login_form").submit();
			
		})
	})
</script>
</body>
</html>
