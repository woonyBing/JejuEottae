package dto;

public class Rooms {
	int ro_num;
	int hotel_id;
	String ro_type;
	int ro_price;
	int ro_count;
	int checkin;
	int checkout;
	
	
	public int getRo_num() {
		return ro_num;
	}


	public void setRo_num(int ro_num) {
		this.ro_num = ro_num;
	}


	public int getHotel_id() {
		return hotel_id;
	}


	public void setHotel_id(int hotel_id) {
		this.hotel_id = hotel_id;
	}


	public String getRo_type() {
		return ro_type;
	}


	public void setRo_type(String ro_type) {
		this.ro_type = ro_type;
	}


	public int getRo_price() {
		return ro_price;
	}


	public void setRo_price(int ro_price) {
		this.ro_price = ro_price;
	}


	public int getRo_count() {
		return ro_count;
	}


	public void setRo_count(int ro_count) {
		this.ro_count = ro_count;
	}


	public int getCheckin() {
		return checkin;
	}


	public void setCheckin(int checkin) {
		this.checkin = checkin;
	}


	public int getCheckout() {
		return checkout;
	}


	public void setCheckout(int checkout) {
		this.checkout = checkout;
	}


	@Override
	public String toString() {
		return "Rooms [ro_num=" + ro_num + ", hotel_id=" + hotel_id + ", ro_type=" + ro_type + ", ro_price=" + ro_price
				+ ", ro_count=" + ro_count + ", checkin=" + checkin + ", checkout=" + checkout + "]";
	}
	
	
}
