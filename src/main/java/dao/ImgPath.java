package dto;

public class ImgPath {
<<<<<<<< HEAD:src/main/java/dao/ImgPath.java
	
	
========
>>>>>>>> ft-rsv-bing:src/main/java/dto/ImgPath.java
	private int Img_no;
	private int Hotel_id;
	private String Img_url;
	public int getImg_no() {
		return Img_no;
	}
	public void setImg_no(int img_no) {
		Img_no = img_no;
	}
	public int getHotel_id() {
		return Hotel_id;
	}
	public void setHotel_id(int hotel_id) {
		Hotel_id = hotel_id;
	}
	public String getImg_url() {
		return Img_url;
	}
	public void setImg_url(String img_url) {
		Img_url = img_url;
	}
	@Override
	public String toString() {
		return "imgPath [Img_no=" + Img_no + ", Hotel_id=" + Hotel_id + ", Img_url=" + Img_url + "]";
	}
}