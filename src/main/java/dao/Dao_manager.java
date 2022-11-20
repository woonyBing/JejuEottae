package dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.Review;
import dto.User;
import dto.ImgPath;
import dto.HotelInfo;


public class Dao_manager {

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
			String sqlQuery = "CREATE TABLE tour_list(id number,tour_name varchar(80),address varchar(150))";

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
			String sqlQuery = "CREATE TABLE Booking(bo_num NUMBER(2),ro_num NUMBER(2),hotel_name VARCHAR2(60),payment NUMBER(8),checkin DATE,checkout DATE,user_email VARCHAR2(60))";

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
			String sqlQuery = "INSERT INTO Booking VALUES(?,?,?,?,?,?,?)";

			int resultCnt =0;
			
			psmt = conn.prepareStatement(sqlQuery);
			psmt.setInt(1,target.bo_num);
			psmt.setInt(2,target.ro_num);
//			psmt.setString(3,target.ro_name);
			psmt.setString(3,target.hotel_name);
			psmt.setInt(4,target.payment);
			psmt.setDate(5, target.checkin);
			psmt.setDate(6,target.checkout);
			psmt.setString(7,target.user_email);
			
			resultCnt = psmt.executeUpdate();
			System.out.println(resultCnt);

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
	
	public void delete_Booking(int bo_num)
	{
		try {
			// 연결하는 메소드
			connect();
			String sqlQuery = "DELETE Booking where BO_NUM = ?";

			int resultCnt =0;
			
			psmt = conn.prepareStatement(sqlQuery);
			psmt.setInt(1,bo_num);
			
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
			String sqlQuery = "INSERT INTO tour_list VALUES((select NVL(max(id),0)+1 from tour_list),?, ?)";

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
	
	
	
	
	public int user_review_count(String id)
	{
		int return_val =0;
		try {
			connect();
			String sqlQuery = "Select count(user_id) from review where user_id ="+id;
			psmt = conn.prepareStatement(sqlQuery);
			
			rs = psmt.executeQuery();
			while (rs.next()) 
			{	
				return_val = rs.getInt(1);
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
	
	public int user_booking_size(String id)
	{
		int return_val =0;
		try {
			connect();
			String sqlQuery = "Select count(user_id) from booking where user_id ="+id;
			psmt = conn.prepareStatement(sqlQuery);
			
			rs = psmt.executeQuery();
			while (rs.next()) 
			{	
				return_val = rs.getInt(1);
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
	
	
	
	
	public int score_avg_by_hotelname(String hotelname)
	{
		int return_val = 0;
		try {
			connect();
			String sqlQuery = "select avg(SCORE) from review where bo_num in"+"("+"Select bo_num from booking where hotel_name ="+"\'"+hotelname+"\'"+")";
			
			psmt = conn.prepareStatement(sqlQuery);
			
			rs = psmt.executeQuery();
			while (rs.next()) 
			{	
				return_val = rs.getInt(1);
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
	
	public ResultSet get_booking_datas(String id)
	{
		//
		ResultSet return_val = null;
		try {
			connect();
			String sqlQuery = "select * from booking,(select name,id from user_info),(select TEL, name from hotel_info ) h where user_id=id and user_id=? and h.name=hotel_name";
			
			psmt = conn.prepareStatement(sqlQuery);
			psmt.setString(1, id);
			return_val = psmt.executeQuery();

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			// 연결 종료 메소드
		}
		return return_val;
	}
	
	public ResultSet get_booking_datas_F(String category,String period,String id)
	{
		//
		ResultSet return_val = null;
		try {
			connect();
			int per = Integer.parseInt(period)*-1 ;
			String sqlQuery = "select * from booking,(select name,id from user_info) where user_id=id and user_id=?";
			if(per!=0&&!category.equals("0"))
			{
				
				sqlQuery = "select * from booking,(select name,id from user_info) where (user_id=id and user_id=?)and(((select type from hotel_info where name = hotel_name)=?) and (checkin>=ADD_MONTHS(sysdate,?)))";
			}
			else if(per!=0&&category.equals("0"))
			{
				  System.out.println(per);

				sqlQuery = "select * from booking,(select name,id from user_info) where (user_id=id and user_id=?)and(checkin>=ADD_MONTHS(sysdate,?))";

			}
			else if(per==0&&!category.equals("0"))
			{
				sqlQuery = "select * from booking,(select name,id from user_info) where (user_id=id and user_id=?)and((select type from hotel_info where name = hotel_name)=?)";


			}
			
			///////////////////////////////////////////////////////////////////////
			psmt = conn.prepareStatement(sqlQuery);
			psmt.setString(1, id);
			
			
			if(!category.equals("0"))
			{
				String category_val="";
				switch(Integer.parseInt(category))
				{
				case 1:
					category_val="Hotel";
					break;
				case 2:
					category_val="Resort";
					break;

				}
				psmt.setString(2, category_val);
				
				if(per!=0)
				{

					psmt.setInt(3, per);;
				}
			}
			else
			{
				if(per!=0)
				{

					psmt.setInt(2, per);;
				}
			}
			


			return_val = psmt.executeQuery();

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			// 연결 종료 메소드
		}
		return return_val;
	}
	
	//booking datas
	//ResultSet
	
	public List<String> comments_by_hotelname(String hotelname)
	{
		List<String> return_val = new ArrayList<String>();
		try {
			connect();
			String sqlQuery = "select CONTENT from review where bo_num in"+"("+"Select bo_num from booking where hotel_name ="+"\'"+hotelname+"\'"+")";
			
			psmt = conn.prepareStatement(sqlQuery);
			
			rs = psmt.executeQuery();
			while (rs.next()) 
			{	
				return_val.add(rs.getString("CONTENT"));
			}
			return return_val;


		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			// 연결 종료 메소드
			disconnect();
		}
		return null;
	}
	
	public void save_review(String user_id,int bo_num,String content,int score)
	{
		try {
			// 연결하는 메소드
			connect();
			String sqlQuery = "insert into review values((select NVL(max(rev_num),0)+1 from review),?,?,?,sysdate,?)";

			int resultCnt =0;
			
			psmt = conn.prepareStatement(sqlQuery);
			psmt.setString(1,user_id);
			psmt.setInt(2,bo_num);
			psmt.setString(3,content);
			psmt.setInt(4,score);

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
	
	public List<Review> selectReviewList(){
		String sql = "select * from review order by rev_num";
		List<Review> reviewList=null;
		
		try {
			connect();
			
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			reviewList = new ArrayList<Review>();
			while(rs.next()) {
				Review rv = new Review();
				rv.setRevNum(rs.getInt("rev_num"));
				rv.setContent(rs.getString("content"));
				rv.setRevDate(rs.getDate("rev_date"));
				rv.setUserEmail(rs.getString("user_email"));
				rv.setBoNum(rs.getInt("bo_num"));
				rv.setScore(rs.getInt("score"));
				
				reviewList.add(rv);
				
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			disconnect();
		}
		return reviewList;
		
	}
	
	//날짜별 분류
	public Review selectReviewInfoListByDate(String revDate){
		String sql = "select * from Review Order by id";
		Review rv=null;
		
		try {
			connect();
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, revDate);
			rs = psmt.executeQuery();
			
			//수정필요
			rv = new Review();
			if(rs.next()) {
				
				rv.setRevNum(rs.getInt("rev_num"));
				rv.setContent(rs.getString("content"));
				rv.setRevDate(rs.getDate("rev_date"));
				rv.setUserEmail(rs.getString("user_email"));
				rv.setBoNum(rs.getInt("bo_num"));
				rv.setScore(rs.getInt("score"));
				
				
				
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			disconnect();
		}
		return rv;
		
	}

	
	public int updateReview(Review rv) {
		String sql = "update review "
				+ " set content= ? , score =?"
				+ " where user_email = ?"; //앞에 띄어쓰기**
	int result = 0;
	
	try {
		connect();
		psmt = conn.prepareStatement(sql);
		psmt.setString(1,rv.content);
		psmt.setInt(2, rv.score);
		psmt.setString(3, rv.userEmail);
		
		result = psmt.executeUpdate();
		
	}catch(Exception e) {
		e.printStackTrace();
	}finally {
		disconnect();
	}
	return result;
	
	}
	
	
	public int deleteReview(int revNum) {
		String sql = "delete from review where rev_num=?";
	int result = 0;
	
	try {
		connect();
		psmt = conn.prepareStatement(sql);
		
		
		result = psmt.executeUpdate();
		
	}catch(Exception e) {
		e.printStackTrace();
	}finally {
		disconnect();
	}
	return result;
	
	}
	
	public List<HotelInfo> selectHotelInfoList(){
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
			disconnect();
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
			disconnect();
		}
		
		return imgPathList;
	}
	
	public int login(String userID, String userPassword) { // 어떤 계정에 대한 실제로 로그인을 시도하는 함수, 인자값으로 ID와 Password를 받아 login을 판단함.
		String SQL = "SELECT passworld FROM user_info WHERE ID = ?"; // 실제로 DB에 입력될 명령어를 SQL 문장으로 만듬.
		int val=-2;

		try {
			connect();
			psmt = conn.prepareStatement(SQL);
			psmt.setString(1,  userID);
			rs = psmt.executeQuery(); // 어떠한 결과를 받아오는 ResultSet 타입의 rs 변수에 쿼리문을 실행한 결과를 넣어줌 
			if (rs.next()) {
				System.out.println(userPassword);
				System.out.println(rs.getString(1));

				if (rs.getString(1).contentEquals(userPassword)) {
					
					val= 1; // 로그인 성공
				}
				else {
					val= 0; // 비밀번호 불일치
				}
			}
			else
			{
				val=-1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			disconnect();
		}

		return val; // DB 오류 
	}
	
	public int join(User user) {
		String SQL = "INSERT INTO user_info VALUES (?, ?, ?, ?, ?)";
		int val=-1;
		try {
			connect();
			psmt = conn.prepareStatement(SQL);
			psmt.setString(1, user.getUserID());
			psmt.setString(2, user.getUserPassword());
			psmt.setString(3, user.getUserEmail());
			psmt.setString(4, user.getUserName());
			psmt.setString(5, user.getUserTel());
			val =  psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			disconnect();
		}

		return val; // 데이터베이스 오류
	}
	
	
	public List<HotelInfo> selectHotelInfoListByaddNtype(String location, String type) {
		String sql = "select * from hotel_info where address like ? AND type in (?)";
		HotelInfo hotelInfoItem = null;
		List<HotelInfo> hotelInfoItem_list = new ArrayList<HotelInfo>();

		try {
			connect();

			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, location+"%");
			psmt.setString(2, type);
			
			rs = psmt.executeQuery();

			hotelInfoItem = new HotelInfo();

			if (rs.next()) {
				hotelInfoItem.setID(rs.getInt("ID"));
				hotelInfoItem.setEMAIL(rs.getString("EMAIL"));
				hotelInfoItem.setNAME(rs.getString("NAME"));
				hotelInfoItem.setADDRESS(rs.getString("ADDRESS"));
				hotelInfoItem.setTYPE(rs.getString("TYPE"));
				hotelInfoItem.setTEL(rs.getString("TEL"));
				hotelInfoItem.setRATING(rs.getInt("RATING"));
				
				hotelInfoItem_list.add(hotelInfoItem);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			disconnect();
		}

		return hotelInfoItem_list;
	}
	
	
	
	
	//

}
