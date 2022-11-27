<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*,jspbook3.board.*"%>
<%@ page import="java.lang.String.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE HTML><html><head>
<link rel="stylesheet" href="board.css" type="text/css" media="screen" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판:검색화면</title></head>
<jsp:useBean id="boards" scope="request" class="java.util.ArrayList" />
<% 
	// 게시글 검색 단어를 이 페이지에서 지정 후 submit 
	String searchText = request.getParameter("searchText"); 
%>	
<body><div align="center"> 
<H2>게시판:검색화면</H2>
<HR>
<table>
  <tr><th>번호</th><th>제목</th><th>작성자</th><th>작성일</th></tr>
	<%
		for(Board b : (ArrayList<Board>)boards) {
			if(searchText!=null && searchText!="") // searchText의 내용이 있을때만 검색데이터 출력
				if(b.getBoard_title().contains(searchText) || b.getBoard_content().contains(searchText)) { // 제목과 내용이 검색단어를 포함하면 출력
	%>
  <tr><td><a href="board_control.jsp?action=detail&board_num=<%=b.getBoard_num()%>"> <%=b.getBoard_num() %></a></td> 
  				<td><a href="board_control.jsp?action=detail&board_num=<%=b.getBoard_num()%>"><%=b.getBoard_title() %></a></td>
				<td><%=b.getBoard_name() %></td>
				<td><%=b.getBoard_date() %></td>
			  </tr>
			 <%
				
				} 
			}
		if(searchText!=null && searchText!="")
			System.out.println("["+ searchText + "] 검색 완료");
			 %>
	<!-- 검색 데이터를 지정하는 폼  -->
	<form name=form1 method=post>
	<tr align=right><td colspan='4'>
	<input type="text" name="searchText">
	<button type="submit">검색</button>
	</form>
	<!-- 목록으로 돌아가기 -->
	<button type="button" onclick="location.href='board_control.jsp?action=list'">전체보기</button></td>
	</tr>
</table>
</div>
</body>
</html>