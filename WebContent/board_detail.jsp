<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*,jspbook3.board.*"%>
<!DOCTYPE HTML><html><head>
<link rel="stylesheet" href="board.css" type="text/css" media="screen" />
<jsp:useBean id="mb" scope="page" class="jspbook3.board.MemberBean"/> 
<jsp:useBean id="board" scope="request" class="jspbook3.board.Board"/>
<% request.setCharacterEncoding("UTF-8"); %>
<% 
	// 세션의 회원정보를 받아옴
	String s_id = (String)session.getAttribute("s_id"); 
	String s_pw = (String)session.getAttribute("s_pw"); 
%>
<% System.out.println("detail"); %>
<% System.out.println(board.getBoard_pwd()); %>

<script type="text/javascript">
	// 삭제버튼을 누를 시 호출되는 함수
	function delcheck() {
		var s_pw = document.getElementById("s_pw").value;
		var s_id = document.getElementById("s_id").value;
		var board_id = document.getElementById("board_id").value;
		var admin_id = document.getElementById("admin_id").value;
		var board_pwd = document.getElementById("board_pwd").value;
		if (s_id == admin_id) {
			document.form1.action.value="delete";
			document.form1.submit();
			return;
		}
		var pwd = prompt('비밀번호를 입력하세요');
		if(pwd == board_pwd) // 현재 게시글의 패스워드와 prompt에 입력한 패스워드를 비교
			if(s_id == board_id) { // 현재 세션의 id와 게시글 작성자 id를 비교
				result = confirm("정말로 삭제하시겠습니까 ?"); // 모든 정보가 일치하면 정말로 삭제할건지 confirm
				if(result == true){ // 삭제 시 form의 action을 delete로 바꾸고 submit
					document.form1.action.value="delete";
					document.form1.submit();
				}
				else // 삭제 confirm 취소
					return;
			}
			else // 세션의 id와 작성자 id가 다름
				confirm("작성자가 아닙니다.");
		else  // 세션의 pwd와 입력한 pwd가 다름
			confirm("비밀번호가 틀립니다.");
	}
	
	// 수정 버튼을 누를 시 호출되는 함수
	function updatecheck() {
		var s_pw = document.getElementById("s_pw").value; 
		var s_id = document.getElementById("s_id").value;
		var admin_id = document.getElementById("admin_id").value;
		var board_id = document.getElementById("board_id").value;
		var board_pwd = document.getElementById("board_pwd").value;
		if (s_id == admin_id) {
			document.form1.action.value="delete";
			document.form1.submit();
		}
		
		pwd = prompt('비밀번호를 입력하세요'); 
		if(pwd == board_pwd) // 현재 세션의 pw와 prompt에 입력한 pw 비교
			if(s_id == board_id)  // 현재 세션의 id와 게시글 작성자 id를 비교
				document.form1.submit(); // 현재 수정 form sumbit	
			else  // 세션의 id와 작성자 id가 다름
				result = confirm("작성자가 아닙니다.");
		else // 세션의 pwd와 입력한 pwd가 다름
			result = confirm("비밀번호가 틀립니다.");
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판:상세화면</title></head>
<body><div align="center"> 
<H2>게시판:상세화면</H2>
<HR>

<!-- 버튼을 눌렀을때 세션의 id/pw와 게시글 id를 자바스크립트에서 getElemetByid로 받기 위해서 -->
<input type=hidden id="s_id" value="<%=s_id%>">
<input type=hidden id="s_pw" value="<%=s_pw%>">
<input type=hidden id="board_pwd" value="<%=board.getBoard_pwd()%>">
<input type=hidden id="admin_id" value="admin">
<input type=hidden id="board_id" value="<%=board.getBoard_id()%>">

<!-- submit시 게시글 번호를 control 페이지에 update 액션으로 보내는 폼 -->
<form name=form1 method=post action=board_control.jsp>
<input type=hidden name="action" value="update">
<input type=hidden name="board_num" value="<%=board.getBoard_num()%>">
<table>
  <tr>
  <th>번호</th>
  	<td align=left><%=board.getBoard_num()%></td>
  </tr>
  <tr>
    <th>제목</th>	
    <td align=left><%=board.getBoard_title()%></td>
  </tr>
  <tr>
    <th>작성자</th>
    <td align=left><%=board.getBoard_name()%></td>
  </tr>
  <tr>
    <th>작성일</th>
    <td align=left><%=board.getBoard_date()%></td>
  </tr>
  <tr>
    <th>내용</th>
    <td align=left width=450><%=board.getBoard_content()%></td>
  </tr>  
  <tr>
    <td colspan=2 align=right>
	<input type=button value="수정" onclick="updatecheck()">
    <input type=button value="삭제" onclick="delcheck()">
    <input type=button value="목록" onclick="location.href='board_control.jsp?action=list'"></td>
</tr>
</table>
</form>
</div>
</body>
</html>