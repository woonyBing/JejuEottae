package dto;

public class TourImg {
	private int img_no;
	private String tour_name;
	private String address;
	private String img_url;
	public int getImg_no() {
		return img_no;
	}
	public void setImg_no(int img_no) {
		this.img_no = img_no;
	}
	public String getTour_name() {
		return tour_name;
	}
	public void setTour_name(String tour_name) {
		this.tour_name = tour_name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getImg_url() {
		return img_url;
	}
	public void setImg_url(String img_url) {
		this.img_url = img_url;
	}
	@Override
	public String toString() {
		return "TourImg [img_no=" + img_no + ", tour_name=" + tour_name + ", address=" + address + ", img_url="
				+ img_url + "]";
	}
	
	
}
