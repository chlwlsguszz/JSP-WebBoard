package jspbook3.board;

public class Board {
	
	private String board_title; // 제목
	private int board_num; // 게시글 번호 (기본키) (MySql에서 AUTO_INCREASE 지정 필수)
	private String board_name; // 작성자 이름
	private String board_id; // 작성자 id
	private String board_pwd; // 게시글 비밀번호
	private String board_date; // 작성일
	private String board_content; // 내용
	
	public Board() {}
	
	public String getBoard_title() { return board_title; }
	public void setBoard_title(String board_title) { this.board_title = board_title; }
	
	public int getBoard_num() { return board_num; }
	public void setBoard_num(int board_num) { this.board_num = board_num; }
	
	public String getBoard_name() { return board_name; }
	public void setBoard_name(String board_name) { this.board_name = board_name; }
	
	public String getBoard_id() { return board_id; }
	public void setBoard_id(String board_id) { this.board_id = board_id; }
	
	public String getBoard_pwd() { return board_pwd; }
	public void setBoard_pwd(String board_pwd) { this.board_pwd = board_pwd; }
	
	public String getBoard_date() { return board_date; }
	public void setBoard_date(String board_date) { this.board_date = board_date; }
	
	public String getBoard_content() { return board_content; }
	public void setBoard_content(String board_content) { this.board_content = board_content; }
}
