package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.TourImgItem;

public class TourImg {

	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;

	/*
	 * 연결 메소드
	 * 
	 */
	public void connect() throws Exception {
		String db_url = "jdbc:oracle:thin:@localhost:1521:orcl";
		String db_id = "scott";
		String db_pw = "tiger";

		Class.forName("oracle.jdbc.driver.OracleDriver");

		if (conn != null) {
			conn.close();
		}
		conn = DriverManager.getConnection(db_url, db_id, db_pw);
	}

	/*
	 * 연결 종료
	 * 
	 */
	public void disConnect() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (psmt != null) {
				psmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/*
	 * tour_img SELECT
	 * 
	 */
	public List<TourImgItem> selectTourImgList() {
		String sql = "SELECT * FROM tour_img";
		List<TourImgItem> tourImgList = null;

		try {
			connect();

			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			tourImgList = new ArrayList<TourImgItem>();

			while (rs.next()) {
				TourImgItem tourImgItem = new TourImgItem();
				tourImgItem.setImg_no(rs.getInt("img_no"));
				tourImgItem.setTour_name(rs.getString("tour_name"));
				tourImgItem.setAddress(rs.getString("address"));
				tourImgItem.setImg_url(rs.getString("img_url"));

				tourImgList.add(tourImgItem);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			disConnect();
		}

		return tourImgList;
	}

}
