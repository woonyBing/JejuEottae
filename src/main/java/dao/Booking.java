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
	Dao_manager dao_manager =null;
	
	public Booking()
	{
		if(this.dao_manager==null)
		{
			this.dao_manager = new Dao_manager();

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
	}
	

	public void create_data_table()
	{
		if(this.dao_manager==null)
		{
			this.dao_manager = new Dao_manager();

		}	
		dao_manager.create_Booking();
	}
	
	public void add_booking()
	{
		if(this.dao_manager==null)
		{
			this.dao_manager = new Dao_manager();

		}		
		dao_manager.insert_Booking(this);
	}
}
