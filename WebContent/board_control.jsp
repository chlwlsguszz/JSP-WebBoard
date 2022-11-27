<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="jspbook3.board.Board"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="jspbook3.board.Member"%>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="mb" scope="page" class="jspbook3.board.MemberBean"/> 
<jsp:useBean id="member" class="jspbook3.board.Member"/>
<jsp:setProperty name="member" property="*"/> 

<jsp:useBean id="boardbean" scope="page" class="jspbook3.board.BoardBean"/> 
<jsp:useBean id="board" class="jspbook3.board.Board"/>
<jsp:setProperty name="board" property="*"/> 

<% // 컨트롤러 요청 파라미터
	String action = request.getParameter("action");	// 파라미터에 따른 요청 처리
	
	// 게시판 목록
	if(action.equals("list")) {
		ArrayList<Board> boards = boardbean.getBoardList(); 
		request.setAttribute("boards", boards);	
         	pageContext.forward("board_list.jsp");
	}	
	
	// 게시판 검색
	if(action.equals("search")) {
		ArrayList<Board> boards = boardbean.getBoardList(); 
		request.setAttribute("boards", boards);	
         	pageContext.forward("board_search.jsp");
	}	
	
	// 로그인 페이지
	if(action.equals("login")) {
		response.sendRedirect("login.jsp");
	}	
	
	// 회원가입
	if(action.equals("join")) {
		if(mb.insertMember(member)) {
			response.sendRedirect("board_control.jsp?action=login");
			System.out.println("회원가입 성공");
		}
		else {
			throw new Exception("회원가입 오류");
		}
	}
	
	// 로그인 프로세스
	if(action.equals("loginProc")) {
		String m_id=member.getM_id();
		String m_pw=member.getM_pw();
		if(mb.checkMember(m_id, m_pw)){
			session.setAttribute("s_id", m_id);
			session.setAttribute("s_pw", m_pw);
			response.sendRedirect("board_control.jsp?action=list");
			System.out.println("로그인");
		}
		else {
			response.sendRedirect("board_control.jsp?action=login");
			System.out.println("로그인 실패");
		}
	}
	
	// 로그아웃
	if(action.equals("logOut")) {
		session.removeAttribute("s_id");
		response.sendRedirect("board_control.jsp?action=login");
		System.out.println("로그아웃");
	}
	
	// 게시글 삽입
	if(action.equals("insertBoard")){
		if(boardbean.insertBoard(board)) {
			response.sendRedirect("board_control.jsp?action=list");
			System.out.println("게시글작성 완료");
		}
		else {
			throw new Exception("게시글작성 오류");
		}
	}
	
	// 게시글 상세 페이지
	if(action.equals("detail")) {
		int board_num=Integer.parseInt(request.getParameter("board_num"));
		if(boardbean.getBoard(board_num)!=null){
			Board boardData = boardbean.getBoard(board_num);
			request.setAttribute("board",boardData);
			pageContext.forward("board_detail.jsp");
		}
		else {
			throw new Exception("게시글조회 오류");
		}
	}
	
	// 게시글 삭제
	if(action.equals("delete")) {
		int board_num=Integer.parseInt(request.getParameter("board_num"));
		if(boardbean.deleteBoard(board_num)){
			response.sendRedirect("board_control.jsp?action=list");
			System.out.println("DB삭제 완료");
		}
		else {
			throw new Exception("DB삭제 오류");
		}
	}
	
	// 게시글 수정 페이지
	if(action.equals("update")) {
		int board_num=Integer.parseInt(request.getParameter("board_num"));
		if(boardbean.getBoard(board_num)!=null){
			Board boardData = boardbean.getBoard(board_num);
			request.setAttribute("board",boardData);
			pageContext.forward("board_update.jsp");
		}
		else {
			throw new Exception("DB수정 오류");
		}
	}
	
	// 게시글 수정 프로세스
	if(action.equals("updateProc")) {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String today = sdf.format(date);
		board.setBoard_date(today);
		
		if(boardbean.updateBoard(board)) {
			response.sendRedirect("board_control.jsp?action=list");
			System.out.println("DB수정 완료");
		} else {
			throw new Exception("DB수정 오류");
		}
	}
	
	// 회원 탈퇴
	if(action.equals("memberDelete")) {
		String m_id = request.getParameter("m_id");
		String m_pw = request.getParameter("m_pw");
		String re_m_pw = request.getParameter("re_m_pw");
		
	
		//1) 아이디가 존재하는지
		if(mb.checkIdValidation(m_id)){
			//2)비밀번호, 비밀번호 확인 일치여부
			if(m_pw.equals(re_m_pw)) {
				//3) 아이디 비밀번호 체크
				if(mb.checkMember(m_id, m_pw)) {
					if(mb.deleteUser(m_id, m_pw)) {
						pageContext.forward("login.jsp");
						System.out.println("회원탈퇴 완료");
					}
					else {
						throw new Exception("회원탈퇴 실패");
					}
				}
				else {
					request.setAttribute("msg","회원 정보가 일치하지 않습니다.");
					pageContext.forward("member_delete.jsp");
				}
			}
			else {
				request.setAttribute("msg","확인 비밀번호가 일치하지 않습니다.");
				pageContext.forward("member_delete.jsp");
			}
		}
		else {
			request.setAttribute("msg","해당 아이디가 존재하지 않습니다.");
			pageContext.forward("member_delete.jsp");
		}
	}
%>