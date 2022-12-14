package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dto.User;


public class UserDAO {
	
	private Connection conn; // Connection : 데이터베이스에 접근하게 해주는 하나의 객체 
	private PreparedStatement pstmt;
	private ResultSet rs; // ResultSet : 어떠한 정보를 담을 수 있는 객체
	
	
	
	public void connect() throws Exception {
		String db_url = "jdbc:oracle:thin:@192.168.0.62:1521:orcl"; // 접속 DB정보
		String db_id = "scott"; // 접속 아이디
		String db_pw = "tiger"; // 접속 아이디의 비밀번호

		Class.forName("oracle.jdbc.driver.OracleDriver");

		if(conn != null) {
			conn.close();
		}
		conn = DriverManager.getConnection(db_url, db_id, db_pw);
	}

	public void disConnect() {
		try {
			if(rs != null) {
				rs.close();	
			}
			if(pstmt != null) {
				pstmt.close();
			}
			if(conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public UserDAO() { // 생성자를 통해 UserDAO의 인스턴스가 생성되었을 때 자동으로 DB 커넥션이 이루어지도록함
		try {
			String dbUrl = "jdbc:oracle:thin:@192.168.0.62:1521:orcl";// localhost:3306 : 우리 서버에 설치된 mysql을 의미, /BBS : mysql안의 BBS라는 데이터 베이스에 접속할 수 있도록 함.
			String dbID = "scott"; // dbID = "root" : root 계정에 접근할 수 있도록 함
			String dbPassword = "tiger"; // 패스워드나 ID를 다르게 입력하면 정상적으로 DB에 접속할 수 없음
			Class.forName("oracle.jdbc.driver.OracleDriver"); // Class.forName : mysql driver를 찾을 수 있도록 함 *Driver : mysql에 접속할 수 있도록 매개체 역할을 해주는 하나의 라이브러리 
			conn = DriverManager.getConnection(dbUrl, dbID, dbPassword); //conn : getConnection(db URL, dbID, dbPassword)를 이용하여 DB에 접속하고 접속이 완료가 되면 conn 객체안에 접속된 정보가 담긴다
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public User selectUserById(String id){
		String sql = "select * from user_info where id = ?";
		User user = null;
		
		try {
			connect();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			user = new User();
			if(rs.next()) {
				user.setUserID(rs.getString("id"));
				user.setUserPassword(rs.getString("password"));
				user.setUserEmail(rs.getString("email"));
				user.setUserTel(rs.getString("tel"));
				user.setUserTel(rs.getString("Name"));
			}		
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnect();
		}
		
		return user;
	}

	public int login(String userID, String userPassword) { // 어떤 계정에 대한 실제로 로그인을 시도하는 함수, 인자값으로 ID와 Password를 받아 login을 판단함.
		String SQL = "SELECT Password FROM user_info WHERE ID = ?"; // 실제로 DB에 입력될 명령어를 SQL 문장으로 만듬.
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,  userID);
			rs = pstmt.executeQuery(); // 어떠한 결과를 받아오는 ResultSet 타입의 rs 변수에 쿼리문을 실행한 결과를 넣어줌 
			if (rs.next()) {
				if (rs.getString(1).contentEquals(userPassword)) {
					return 1; // 로그인 성공
				}
				else {
					return 0; // 비밀번호 불일치
				}
			}
			return -1; // 아이디가 없음
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; // DB 오류
	}
	
	public int join(User user) {
		String SQL = "INSERT INTO user_info VALUES (?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserEmail());
			pstmt.setString(4, user.getUserName());
			pstmt.setString(5, user.getUserTel());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	
	public int update(User user) {
		String sql = "update user_info set password=? , email=? , tel=? "
				+ " where id = ? ";
		
		int result = 0;
		
		try {
			connect();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUserPassword());
			pstmt.setString(2, user.getUserEmail());
			pstmt.setString(3, user.getUserTel());
			pstmt.setString(4, user.getUserID());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnect();
		}
		
		return result;
	}
	
	public int delete(String id,String password) {
		String sql = "delete user_info where id= ? and password= ?";
		
		int result = 0;
		
		try {
			connect();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnect();
		}
		
		return result;
	}

}