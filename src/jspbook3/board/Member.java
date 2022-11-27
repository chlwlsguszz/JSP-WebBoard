package jspbook3.board;

public class Member {
	private String m_id; // sql에서 id를 기본키로 하였음 (id 중복 불가)
	private String m_pw;
	private String m_name;
	
	public Member() {}
	
	public String getM_name() { return m_name; }
	public void setM_name(String m_name) { this.m_name = m_name; }
	
	public String getM_id() { return m_id; }
	public void setM_id(String m_id) { this.m_id = m_id; }

	public String getM_pw() { return m_pw; }
	public void setM_pw(String m_pw) { this.m_pw = m_pw; }
}
