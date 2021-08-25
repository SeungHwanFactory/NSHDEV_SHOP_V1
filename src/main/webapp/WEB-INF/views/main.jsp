<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<html>
<head>
	<title>메인 페이지</title>
	<link rel="stylesheet" href="/resources/css/main.css">
</head>
<body>
<div class="wrapper">
	<div class="wrap">
		<div class="top_gnb_area">
			<h1>헤더</h1>
		</div>
		<div class="top_area">
			<div class="logo_area">
				<h1>로고</h1>
			</div>
			<div class="search_area">
				<h1>검색창</h1>
			</div>
			<div class="login_area">
				<!-- 로그인 하지 않은 상태 -->
                <c:if test = "${user == null }">
                    <div class="login_button"><a href="/users/login">로그인</a></div>
                    <span><a href="/users/register">회원가입</a></span>                
                </c:if>
                
                <!-- 로그인한 상태 -->
                <c:if test="${ user != null }">
                    <div class="login_success_area">
                        <span>회원 : ${user.userName}</span>
                        <span>충전금액 : ${user.cash}</span>
                        <span>포인트 : ${user.point}</span>
                    </div>
                </c:if>
			</div>
			<div class="clearfix"></div>			
		</div>
		<div class="navi_bar_area">
			<h1>네비 바</h1>
		</div>
		<div class="content_area">
			<h1>컨텐츠 영역</h1>
		</div>
	</div>
</div>
</body>
</html>
