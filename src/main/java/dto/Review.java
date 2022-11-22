package dto;


import java.util.Date;

public class Review {

	public int revNum; //리뷰번호
	public String userId; //리뷰 제목? -> 이메일
	public int boNum; //예약번호
	public String content; //리뷰 본문
	public Date revDate; // 리뷰작성날짜
	public int score; //별점, 평점
	
	
	
	public int getRevNum() {
		return revNum;
	}
	
	public void setRevNum(int revNum) {
		this.revNum = revNum;
	}
	
	public String getUserEmail() {
		return userId;
	}
	
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public int getBoNum() {
		return boNum;
	}
	
	public void setBoNum(int boNum) {
		this.boNum = boNum;
	}
	
	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	
	public Date getRevDate() {
		return revDate;
	}
	
	public void setRevDate(Date revDate) {
		this.revDate = revDate;
	}
	
	public int getScore() {
		return score;
	}
	
	@Override
	public String toString() {
		return "Review [revNum=" + revNum + ", userId=" + userId + ", boNum=" + boNum + ", content=" + content
				+ ", revDate=" + revDate + ", score=" + score + "]";
	}
	public void setScore(int score) {
		this.score = score;
	}

	
	
	
}
