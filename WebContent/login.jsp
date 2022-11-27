<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<link rel="stylesheet" href="board.css" type="text/css" media="screen" />
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
</head>
<body>
<div style="text-align:center;">
	<h2>로그인</h2>
	<hr>
	<form method="post" action="board_control.jsp" name="form1"> <!-- 로그인시 loginProc -->
		<input type="hidden" name="action" value="loginProc">
		<table width="250px" border="1" align="center" cellspacing="0" cellpadding="5">
		<tr> <td colspan="2" align="center">로그인</td> </tr>
		<tr><td>아이디</td> <td><input type="text" name="m_id" size=10> </td> </tr> 
		<tr><td>패스워드</td><td><input type="password" name="m_pw" size=10></td></tr>
		<tr><td colspan="2" align="center">
			<div style="display:flex; justify-content:space-between;">
				<button type="submit" style="width:80px;">로그인</button> 
				<!-- 가입/탈퇴 버튼 -->
				<button type="button" style="width:80px;" onclick="location.href='member_join.jsp'">회원가입</button>
				<button type="button" style="width:80px;" onclick="location.href='member_delete.jsp'">회원탈퇴</button>
			</div></td></tr>
		</table>
	</form>
	<br>
	<p>
	게시판 구현 완성 (회원가입/탈퇴 , 게시글 삽입/수정/삭제) <br>
	제목/내용 검색 완성 <br>
	페이지 10개씩 화면 구성 완성 <br>
	기말2 - 게시글 비밀번호 완성
	</p>
</div>
</body>
</html>