package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;


public class Reservation {

	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;

	

	public void connect() throws Exception
	{
		String db_url = "jdbc:oracle:thin:@localhost:1521:orcl"; // 접속 DB정보
		String db_id = "scott"; // 접속 아이디
		String db_pw = "tiger"; // 접속 아이디의 비밀번호


		Class.forName("oracle.jdbc.driver.OracleDriver");
		if(conn != null)
		{
			conn.close();
		}
		conn = DriverManager.getConnection(db_url, db_id, db_pw);
	}

	public void disconnect()
	{
		try {
			if(rs != null)
			{
				rs.close();
			}
			if(psmt != null)
			{
				psmt.close();
			}
			if(conn != null)
			{
				conn.close();
			}
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
	}



	public void create_tour_list() {
		try {
			// 연결하는 메소드
			connect();
			String sqlQuery = "CREATE TABLE tour_list(tour_name varchar(80),address varchar(150))";

			psmt = conn.prepareStatement(sqlQuery);
			int resultCnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			// 연결 종료 메소드
			disconnect();
		}


	}
	
	public void create_Booking() {
		try {
			// 연결하는 메소드
			connect();
			String sqlQuery = "CREATE TABLE Booking(bo_num NUMBER(2),ro_num NUMBER(2),ro_name VARCHAR2(60),hotel_namero_name VARCHAR2(60),payment NUMBER(8),checkin DATE,checkout DATE,user_email ro_name VARCHAR2(60))";

			psmt = conn.prepareStatement(sqlQuery);
			int resultCnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			// 연결 종료 메소드
			disconnect();
		}


	}
	
	public void insert_Booking(Booking target)
	{
		try {
			// 연결하는 메소드
			connect();
			String sqlQuery = "INSERT INTO Booking VALUES(?,?,?,?,?,?,?,?)";

			int resultCnt =0;
			
			psmt = conn.prepareStatement(sqlQuery);
			psmt.setInt(1,target.bo_num);
			psmt.setInt(2,target.ro_num);
			psmt.setString(3,target.ro_name);
			psmt.setString(4,target.hotel_name);
			psmt.setInt(5,target.payment);
			psmt.setString(6,target.checkin);
			psmt.setString(7,target.checkout);
			psmt.setString(8,target.user_email);
			resultCnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			// 연결 종료 메소드
			disconnect();
		}

	}
	
	public void insert_tour_list(List<String> name_data,List<String> address_data)
	{
		try {
			// 연결하는 메소드
			connect();
			String sqlQuery = "INSERT INTO tour_list VALUES(?, ?)";

			int resultCnt =0;
			for(int i=0;i<name_data.size();i++)	
			{
				psmt = conn.prepareStatement(sqlQuery);
				psmt.setString(1,name_data.get(i));
				psmt.setString(2,address_data.get(i).split(" ", 2)[1]);
				 resultCnt = psmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			// 연결 종료 메소드
			disconnect();
		}
	}
	
	public String find_match_IMGlink(String img_table,int val)
	{
		String return_val = "";
		try {
			connect();
			String sqlQuery = "SELECT IMG_URL from "+img_table+" where HOTEL_ID = "+val;
			psmt = conn.prepareStatement(sqlQuery);
			
			rs = psmt.executeQuery();
			while (rs.next()) 
			{	
				return_val = rs.getString("IMG_URL");
				return return_val;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			// 연결 종료 메소드
			disconnect();
		}
		return return_val;
	}

}
