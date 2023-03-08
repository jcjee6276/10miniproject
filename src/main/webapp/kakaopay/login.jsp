<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html xmlns:th="http://www.thymeleaf.org">
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
</head>
<body>
<a class="p-2" href="https://kauth.kakao.com/oauth/authorize?client_id=04012ee167a54fddf374766087a27fea&scope=profile,account_email&redirect_uri=http://127.0.0.1:8080/kakaopay/login&response_type=code">
  <img th:src="@{/images/kakao_login_medium_narrow.png}" style="height:60px"/>
</a>
</body>
</html>