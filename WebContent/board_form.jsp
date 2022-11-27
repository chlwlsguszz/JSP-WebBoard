<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat"%>
<!DOCTYPE HTML>
<jsp:useBean id="mb" class="jspbook3.board.MemberBean"/>
<jsp:useBean id="member" class="jspbook3.board.Member"/>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	//현재 시간 포맷 형성
	Date date = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	String today = sdf.format(date);
	String s_id = (String)session.getAttribute("s_id");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판:작성화면</title>
<link rel="stylesheet" href="board.css" type="text/css" media="screen" />
</head>
<body>
<div align="center">
<H2>게시판:글 작성 화면 </H2>
<HR>

<!-- 입력 정보를 control 페이지에 insertBoard 액션으로 보내는 폼 -->
<form name=form1 method=post action=board_control.jsp>
<input type=hidden name="action" value="insertBoard">
<!-- 작성자 id는 따로 hidden으로 세션의 id를 자동으로 보냄 --> 
<input type=hidden name="board_id" value="<%=s_id%>">
<table border="0">
  <tr>
    <th>제목</th>	
    <td align=left><input type="text" name="board_title" maxlength="20"></td>
  </tr>
  <tr>
    <th>비밀번호</th>	
    <td align=left><input type="text" name="board_pwd" maxlength="20"></td>
  </tr>
  <tr>
    <th>작성자</th> <!--세션의 id로 작성자 이름을 받아서 자동 출력 -->
    <td align=left><input type="text" name="board_name" value="<%=mb.getUserName(s_id) %>" maxlength="20"></td>
  </tr>
  <tr>
    <th>작성일</th> <!-- 현재 시간 자동 출력 -->
    <td align=left><input type="text" value="<%=today%>" name="board_date"></td>
  </tr>
  <tr>
    <th>내용</th>
    <td><textarea name="board_content" cols="50" rows="10"></textarea></td>
  </tr>  
  <tr>
    <td colspan=2 align=right><input type=submit value="완료"> 
    <!-- 목록 버튼 -->
    <input type=button value="목록" onclick="location.href='board_control.jsp?action=list'"></td>
</tr>
</table>
</form>
</div>
</body>
</html>