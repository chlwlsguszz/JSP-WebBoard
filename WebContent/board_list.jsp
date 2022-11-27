<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*,jspbook3.board.*"%>
<!DOCTYPE HTML><html><head>
<link rel="stylesheet" href="board.css" type="text/css" media="screen" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판:목록화면</title></head>
<jsp:useBean id="boards" scope="request" class="java.util.ArrayList" />
<body><div align="center"> 


<%
	// 페이지 인덱스, 1일 경우 맨 앞 페이지
	// index가 null일 시 페이지를 1로 줌
	// 이후 index를 다음/이전 버튼에 따라 갱신함
	int index;
	if(request.getParameter("index")!=null)
		index = Integer.parseInt(request.getParameter("index")); 
	else
		index = 1;
%>

<script type="text/javascript">
	// 이전 페이지 버튼, 인덱스를 1 줄이고 submit
	function previous() {
		var index = document.getElementById("index");
	 	document.form1.index.value = parseInt(index.value)+parseInt(1);
	 	document.form1.submit();				
	}
	// 다음 페이지 버튼
	function next() {
		var index = document.getElementById("index");
	 	document.form1.index.value = parseInt(index.value)-parseInt(1);
	 	document.form1.submit();				
	}
</script>
<H2>게시판:목록화면</H2>
<HR>
<table>
  <tr><th>번호</th><th>제목</th><th>작성자</th><th>작성일</th></tr>
	<%
		int count=-1; // 게시글을 한 페이지에 10개만 표시하기 위한 변수
		int showCount = 0; // 표시한 게시글이 10개 미만이라면, 마지막 페이지 이므로 이전 버튼을 없애려고
		for(Board b : (ArrayList<Board>)boards) {
			count++;
			if(count<index*10 && count>=(index-1)*10) { // 1페이지면 0~9, 2페이지면 10~19 출력
				showCount++;
	%>
	<!-- 게시글 번호와 제목에 상세화면 페이지 링크 생성 -->
  <tr><td><a href="board_control.jsp?action=detail&board_num=<%=b.getBoard_num()%>"> <%=b.getBoard_num() %></a></td> 
  				<td><a href="board_control.jsp?action=detail&board_num=<%=b.getBoard_num()%>"><%=b.getBoard_title() %></a></td>
				<td><%=b.getBoard_name() %></td>
				<td><%=b.getBoard_date() %></td>
			  </tr>
			 <%
					}
			}	
			 %>
	<tr align=right><td colspan='4'>
	<button type="button" onclick="location.href='board_form.jsp'">글쓰기</button>
	<button type="button" onclick="location.href='board_control.jsp?action=search'">검색</button>
	<button type="button" onclick="location.href='board_control.jsp?action=logOut'">로그아웃</button></td>
	</tr>
	<form name="form1" method="post">
	<tr>
	<td colspan='2' align=left>
	<input type="hidden" id="index" name="index" value="<%=index%>">
	<%
		if(index!=1) {  // 첫 페이지 다음 버튼은 표시하지 않음
	%>
		<input type="button" value="다음" onclick="next()"></button>
	<% } %>
	</td>
	<td colspan='2' align=right>
	<% if(!(showCount<10)) { // 마지막 페이지 이전버튼은 표시하지 않음
	%>
	<input type="button" value="이전" onclick="previous()"></button>
	<% } %>
	</td>
	</tr>
	</form>
</table>
</div>
</body>
</html>