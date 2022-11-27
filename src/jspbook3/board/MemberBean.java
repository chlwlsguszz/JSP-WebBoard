package jspbook3.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;

public class MemberBean { 
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String jdbc_driver = "com.mysql.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://127.0.0.1:3306/jspdb?useSSL=false&serverTimezone=Asia/Seoul&aloowPublicKeyRetrieval=true"; 
	
	// DB연결 메서드
	void connect() {
		try {
			Class.forName(jdbc_driver);
			conn = DriverManager.getConnection(jdbc_url,"jspbook","hansung");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	void disconnect() {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} 
		if(conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	// 회원가입
	public boolean insertMember(Member member) throws SQLException {
		connect();
				
		String sql ="insert into member2(m_id, m_pw, m_name) values(?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getM_id());
			pstmt.setString(2, member.getM_pw());
			pstmt.setString(3, member.getM_name());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		finally {
			disconnect();
		}
		return true;
	}
	// id 존재여부 확인
	public boolean checkIdValidation(String id) {
		connect();
		String sql = " SELECT m_id FROM member2 WHERE m_id = ? ";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		finally {
			disconnect();
		}
		return false; 
	}
	// id 리스트 리턴
	public ArrayList<String> getIdList() {
		connect();
		ArrayList<String> list = null;
		String sql = "select m_id from member2 ";
		try { 
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				list=new ArrayList<String>();
				do {
					list.add(rs.getString("m_id"));
				} while(rs.next());
			}
			rs.close();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		finally { disconnect(); }
		return list;
	}
	// 회원인지 id, pw 검사
	public boolean checkMember(String id, String pw) {
		connect();
		String sql = " SELECT m_id, m_pw FROM member2 WHERE m_id = ? and m_pw = ?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		finally {
			disconnect();
		}
		return false; 
	}
	//회원 이름 얻기 
	public String getUserName(String id) throws SQLException {
		connect();
		String m_name = "";
		String sql = "select m_name from member2 where m_id=?";
		try {
			conn.setAutoCommit(false);
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,id);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				m_name = rs.getString("m_name");
			}
			rs.close();
			conn.commit();
		}
		catch (SQLException e) {
			e.printStackTrace();
			conn.rollback();
		}
		finally {
			disconnect();
		}
		return m_name;
	}
	//회원탈퇴
	public boolean deleteUser(String id, String pw) {
		connect();
		String sql = "DELETE FROM member2 WHERE m_id = ? AND m_pw = ? ";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
			return false;
		}
		finally {
			disconnect();
		}
		return true;
	}
}