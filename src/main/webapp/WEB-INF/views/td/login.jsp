<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<form name="form" method="post" autocomplete="off">
ID <input type="text" name="member_id" size="20"> &nbsp; 
PW <input type="password" name="member_pw" size="20">

<input type="submit" value="LogIn" onclick="document.form.action="LoginJudge.jsp";"><br>
</form>

<form id="login" name="login" method="post" action="/td/logincheck.do">
	ID <input type="text" name="member_id" size="20"> &nbsp; 
	PW <input type="password" name="member_pw" size="20">
	<button>����</button>
</form>


</body>
</html>