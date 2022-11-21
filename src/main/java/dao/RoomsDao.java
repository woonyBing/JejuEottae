package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.Rooms;

public class RoomsDao {

	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;

	public void connect() throws Exception {
		String db_url = "jdbc:oracle:thin:@localhost:1521:orcl"; // 접속 DB정보
		String db_id = "scott"; // 접속 아이디
		String db_pw = "tiger"; // 접속 아이디의 비밀번호

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			if(conn != null) {
				conn.close();
			}
			conn = DriverManager.getConnection(db_url, db_id, db_pw);

		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw e; //밖으로 던지기 , 익셉션이 생기면
		}
	} //exception을 설정해주면 예외처리를 해줘야함
	
	public void disConnect() {
		try {
			if(rs != null) {
				rs.close();
			}
			if(rs != null) {
				psmt.close();	
			}
			if(rs != null) {
				conn.close();
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public List<Rooms> selectReviewList(){
		String sql = "select * from Rooms";
		List<Rooms> roomList=null;
		
		try {
			connect();
			
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			roomList = new ArrayList<Rooms>();
			while(rs.next()) {
				Rooms room = new Rooms();
				room.setCheckin(rs.getInt("CHECKIN"));
				room.setCheckout(rs.getInt("CHECKOUT"));
				room.setHotel_id(rs.getInt("HOTEL_ID"));
				room.setRo_count(rs.getInt("RO_COUNT"));
				room.setRo_num(rs.getInt("RO_NUM"));
				room.setRo_price(rs.getInt("RO_PRICE"));
				room.setRo_type(rs.getString("RO_TYPE"));
				
				roomList.add(room);
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			disConnect();
		}
		return roomList;
		
	}
	
}
