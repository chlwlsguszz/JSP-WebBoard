<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="board.css" type="text/css" media="screen" />
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴 페이지</title>
</head>
<body>
<div align=center>
<H2>회원탈퇴</H2>
<HR>

<!-- 입력한 id와 pw + pw확인을 control 페이지에 memberDelete 액션으로 보내는 폼 -->
<form method="post" action="board_control.jsp" name="form1">
	<input type="hidden" name="action" value="memberDelete">
	<table width="250" border="1" align="center" cellspacing="0" cellpadding="5">
		<tr> <td colspan="2" align="center">회원탈퇴</td> </tr>
		<tr><td>아이디</td> <td><input type="text" name="m_id" size=10> </td>
		</tr> 
		<tr><td>패스워드</td><td><input type="password" name="m_pw" size=10></td></tr>
		<tr><td>패스워드 확인</td> <td><input type="password" name="re_m_pw" size=10> </td>
		</tr> 
		<tr><td colspan="2" align="center">
		<input type="submit" value="회원탈퇴">
		<!-- 뒤로가기 버튼 -->
		<button type="button" style="width:80px;" onclick="location.href='login.jsp'">뒤로가기</button>
		</td></tr>
	</table>
</form>
<!-- 이 페이지는 회원탈퇴에 실패하면 다시 돌아와서 msg를 출력함 -->
<!-- 아이디가 없는 아이디일때 -->
<!-- 패스워드와 패스워드 확인이 다를때 -->
<!-- 아이디의 패스워드가 틀릴때 -->
${msg}
</div>
</body>
</html>