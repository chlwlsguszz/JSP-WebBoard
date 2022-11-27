<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<link rel="stylesheet" href="board.css" type="text/css" media="screen" />
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
</head>
<body>
<div align=center>
<H2>회원가입</H2>
<HR>

<!-- 입력한 회원 이름과 id/pw를 control 페이지에 join 액션으로 보내는 폼 -->
<form method="post" action="board_control.jsp" name="form1">
	<input type="hidden" name="action" value="join">
	<table width="250" border="1" align="center" cellspacing="0" cellpadding="5">
		<tr> <td colspan="2" align="center">회원가입</td> </tr>
		<tr><td>이름</td> <td><input type="text" name="m_name" size=10> </td>
		</tr> 
		<tr><td>아이디</td> <td><input type="text" name="m_id" size=10> </td>
		</tr> 
		<tr><td>패스워드</td><td><input type="password" name="m_pw" size=10></td></tr>
		<tr><td colspan="2" align="center">
		<input type="submit" value="회원가입">
		<button type="button" style="width:80px;" onclick="location.href='login.jsp'">뒤로가기</button>
		</td></tr>
	</table>
</form>
</div>
</body>
</html>