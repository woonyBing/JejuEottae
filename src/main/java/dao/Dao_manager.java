package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dao.Review;


public class Dao_manager {

	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;

	

	//연결부분
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




	//관광 테이블 생성
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
	
	
	//예약 테이블 생성
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
	
	//예약 테이블 추가
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
	
	
	//관광지 리스트 추가
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
	
	//이미지 테이블 불러오기
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
	
	
	//로그인 서비스
	public int login(String userID, String userPassword) { // 어떤 계정에 대한 실제로 로그인을 시도하는 함수, 인자값으로 ID와 Password를 받아 login을 판단함.
		String SQL = "SELECT passworld FROM user_info WHERE ID = ?"; // 실제로 DB에 입력될 명령어를 SQL 문장으로 만듬.
		try {
			psmt = conn.prepareStatement(SQL);
			psmt.setString(1,  userID);
			rs = psmt.executeQuery(); // 어떠한 결과를 받아오는 ResultSet 타입의 rs 변수에 쿼리문을 실행한 결과를 넣어줌 
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
	
	
	//회원가입, 유저테이블에 정보 추가
	public int join(User user) {
		String SQL = "INSERT INTO user_info VALUES (?, ?, ?, ?, ?)";
		try {
			psmt = conn.prepareStatement(SQL);
			psmt.setString(1, user.getUserID());
			psmt.setString(2, user.getUserPassword());
			psmt.setString(3, user.getUserEmail());
			psmt.setString(4, user.getUserName());
			psmt.setString(5, user.getUserTel());
			return psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	
	//리뷰 가져오기
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
	
	//유저 예약 확인
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
	
	
	//호텔에 대한 평점 평균구하기
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
	
	//예약 테이블 정보 가져오기
	public ResultSet get_booking_datas(String id)
	{
		ResultSet return_val = null;
		try {
			connect();
			String sqlQuery = "select * from booking,(select name,id from user_info) where user_id=id and user_id=?";
			
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
	
	//booking datas
	//ResultSet
	
	//호텔에 리뷰남기기
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
	
	
	//리뷰 저장
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
	
	//리뷰보기
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

	//리뷰 수정
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
		System.out.println(result);
	}catch(Exception e) {
		e.printStackTrace();
	}finally {
		disconnect();
	}
	return result;
	
	}
	
	//리뷰 삭제
	public int deleteReview(int revNum) {
		String sql = "delete from review "
				+ "where rev_num=?";
	int result = 0;
	
	try {
		connect();
		psmt = conn.prepareStatement(sql);
		psmt.setInt(1,revNum);
		
		result = psmt.executeUpdate();
		
	}catch(Exception e) {
		e.printStackTrace();
	}finally {
		disconnect();
	}
	return result;
	
	}
	
	
	//

}
