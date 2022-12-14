package dao;

import java.sql.Date;

public class Booking {
	int bo_num;
	int ro_num;
	String hotel_name;
	int payment;
	Date checkin;
	Date checkout;
	String user_id;
	int person_cnt;
	Dao_manager dao_manager =null;
	
	public Booking()
	{
		if(this.dao_manager==null)
		{
			this.dao_manager = new Dao_manager();

		}
	}
	
	public void all_setter(int ro_num,String hotel_name,int payment,Date checkin,Date checkout, int personCnt, String user_id)
	{
//		 this.bo_num=bo_num;
		 this.ro_num=ro_num;
		 this.hotel_name=hotel_name;
		 this.payment=payment;
		 this.checkin=checkin;
		 this.checkout=checkout;
		 this.person_cnt=personCnt;
		 this.user_id=user_id;
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

	@Override
	public String toString() {
		return "Booking [bo_num=" + bo_num + ", ro_num=" + ro_num + ", hotel_name=" + hotel_name + ", payment="
				+ payment + ", checkin=" + checkin + ", checkout=" + checkout + ", user_id=" + user_id
				+ ", person_cnt=" + person_cnt +  "]";
	}

	
	
}