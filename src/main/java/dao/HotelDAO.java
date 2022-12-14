package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.HotelInfo;
import dto.ImgPath;


public class HotelDAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;

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
			if(psmt != null) {
				psmt.close();
			}
			if(conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public List<HotelInfo> selectHotelInfoListJoinImg(){
		String sql = "select *"
				+ " from hotel_info i, hotel_img ig"
				+ " where i.id =ig.hotel_id";
		List<HotelInfo> hotelInfoList = null;
		
		try {
			connect();
			
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			hotelInfoList = new ArrayList<HotelInfo>();
			while(rs.next()) {
				HotelInfo hotelInfo = new HotelInfo();
				hotelInfo.setID(rs.getInt("id"));
				hotelInfo.setNAME(rs.getString("name"));
				hotelInfo.setADDRESS(rs.getString("address"));
				hotelInfo.setTYPE(rs.getString("type"));
				hotelInfo.setTEL(rs.getString("tel"));
				hotelInfo.setX(rs.getString("x"));
				hotelInfo.setY(rs.getString("y"));
				hotelInfo.setRATING(rs.getInt("rating"));
				
				hotelInfoList.add(hotelInfo);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnect();
		}
		
		return hotelInfoList;
	}
	
	public List<HotelInfo> selectHotelInfoListById(int hotelId){
		String sql = "select *"
				+ " from hotel_info"
				+ " where id = ?";
		List<HotelInfo> hotelInfoList = null;
		
		try {
			connect();
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, hotelId);
			rs = psmt.executeQuery();
			
			hotelInfoList = new ArrayList<HotelInfo>();
			while(rs.next()) {
				HotelInfo hotelInfo = new HotelInfo();
				hotelInfo.setID(rs.getInt("id"));
				hotelInfo.setNAME(rs.getString("name"));
				hotelInfo.setADDRESS(rs.getString("address"));
				hotelInfo.setTYPE(rs.getString("type"));
				hotelInfo.setTEL(rs.getString("tel"));
				hotelInfo.setX(rs.getString("x"));
				hotelInfo.setY(rs.getString("y"));
				hotelInfo.setRATING(rs.getInt("rating"));
				
				hotelInfoList.add(hotelInfo);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnect();
		}
		
		return hotelInfoList;
	}
	
	
	
	public List<ImgPath> selectImgPath(){
		String sql = "select * from hotel_img";
		List<ImgPath> imgPathList = null;
		
		try {
			connect();
			
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			imgPathList = new ArrayList<ImgPath>();
			while(rs.next()) {
				ImgPath img = new ImgPath();
				img.setImg_no(rs.getInt("img_no"));
				img.setHotel_id(rs.getInt("hotel_id"));
				img.setImg_url(rs.getString("img_url"));
				
				
				imgPathList.add(img);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnect();
		}
		
		return imgPathList;
	}
	
	public List<HotelInfo> selectHotelInfoListByaddNtype(String location, String type) {
		String sql = "select * from hotel_info where address like ? AND type in (?)";
		
		List<HotelInfo> hotelInfoList = null;

		try {
			connect();

			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, location+"%");
			psmt.setString(2, type);
			
			rs = psmt.executeQuery();

			hotelInfoList = new ArrayList<HotelInfo>();

			while (rs.next()) {
				HotelInfo infoItem = new HotelInfo();
				infoItem.setID(rs.getInt("ID"));
				infoItem.setEMAIL(rs.getString("EMAIL"));
				infoItem.setNAME(rs.getString("NAME"));
				infoItem.setADDRESS(rs.getString("ADDRESS"));
				infoItem.setTYPE(rs.getString("TYPE"));
				infoItem.setTEL(rs.getString("TEL"));
				infoItem.setRATING(rs.getInt("RATING"));
				infoItem.setX(rs.getString("X"));
				infoItem.setY(rs.getString("Y"));
				
				hotelInfoList.add(infoItem);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			disConnect();
		}

		return hotelInfoList;
	}
	

	public List<ImgPath> selectHotelInfoListByHotelId(int hotelId) {
		String sql = "select img_url from hotel_img where hotel_id = ?";
		
		List<ImgPath> hotelImgList = null;

		try {
			connect();

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, hotelId);
			
			rs = psmt.executeQuery();

			hotelImgList = new ArrayList<ImgPath>();

			while (rs.next()) {
				ImgPath ImgPath = new ImgPath();
				ImgPath.setImg_url(rs.getString("IMG_URL"));
				
				hotelImgList.add(ImgPath);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			disConnect();
		}

		return hotelImgList;
	}
	


}















