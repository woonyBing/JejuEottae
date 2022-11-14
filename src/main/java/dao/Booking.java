package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Booking {
	
	int bo_num;
	int ro_num;
	String ro_name;
	String hotel_name;
	int payment;
	String checkin;
	String checkout;
	String user_email;
	Reservation reservation =null;
	
	public Booking()
	{
		if(this.reservation==null)
		{
			this.reservation = new Reservation();

		}	
	}
	
	public void all_setter(int bo_num,int ro_num,String ro_name,String hotel_name,int payment,String checkin,String checkout,String user_email)
	{
		 this.bo_num=bo_num;
		 this.ro_num=ro_num;
		 this.ro_name=ro_name;
		 this.hotel_name=hotel_name;
		 this.payment=payment;
		 this.checkin=checkin;
		 this.checkout=checkout;
		 this.user_email=user_email;
	}
	
	

	public void create_data_table()
	{
		if(this.reservation==null)
		{
			this.reservation = new Reservation();

		}	
		reservation.create_Booking();
	}
	
	public void add_booking()
	{
		if(this.reservation==null)
		{
			this.reservation = new Reservation();

		}		
		reservation.insert_Booking(this);
	}
}
