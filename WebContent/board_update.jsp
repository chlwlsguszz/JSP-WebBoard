<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="jspbook3.board.*"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE HTML>
<html>
<head>
<link rel="stylesheet" href="board.css" type="text/css" media="screen" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판:수정화면</title>
</head>

<jsp:useBean id="board" scope="request" class="jspbook3.board.Board" />

<body>
<div align="center">
<H2>게시판:수정화면 </H2>
<HR>
<!-- submit시 컨트롤 페이지에 제목, 내용의 수정 정보를 updateProc 액션으로 보내는 폼 -->
<!-- 게시글 번호, 작성자, 작성일은 임의로 수정 불가하게 disabled -->
<!-- 따라서 게시글 번호는 전송이 안됨, hidden으로 추가로 따로 보냄 -->
<form name=form1 method=post action=board_control.jsp>
<input type=hidden name="action" value="updateProc">
<input type=hidden name="board_num" value=<%=board.getBoard_num() %>>
<table>
  <tr>
  <th>번호</th>
  	<td align=left><input type="text" value="<%=board.getBoard_num()%>" disabled></td>
  </tr>
  <tr>
    <th>제목</th>	
    <td align=left><input type="text" name="board_title" maxlength="20" value="<%=board.getBoard_title()%>"></td>
  </tr>
  <tr>
    <th>작성자</th>
    <td align=left><input type="text" name="board_name" value="<%=board.getBoard_name()%>" maxlength="20" disabled></td>
  </tr>
  <tr>
    <th>작성일</th>
    <td align=left><input type="text" value="<%=board.getBoard_date()%>" disabled></td>
  </tr>
  <tr>
    <th>내용</th>
    <td><textarea name="board_content" cols="50" rows="10"><%=board.getBoard_content()%></textarea></td>
  </tr>  
  <tr>
    <td colspan=2 align=right><input type=submit value="수정하기"> 
    <input type=button value="목록" onclick="location.href='board_control.jsp?action=list'"></td>
</tr>
</table>
</form>

</div>
</body>
</html>