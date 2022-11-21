<<<<<<<< HEAD:src/main/java/dao/HotelInfo.java
package dao;
========
package dto;
>>>>>>>> ft-rsv-bing:src/main/java/dto/HotelInfo.java
public class HotelInfo {
	
	private int ID; 
	private String NAME; 
	private String ADDRESS;
	private String TYPE;
	private String TEL;
	private String EMAIL;
	private int RATING;
	

	
	
	
	private String X;
	private String Y;
	
	
	public String getY() {
		return Y;
	}
	public void setY(String y) {
		Y = y;
	}
	public String getX() {
		return X;
	}
	public void setX(String x) {
		X = x;
	}
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public String getNAME() {
		return NAME;
	}
	public void setNAME(String nAME) {
		NAME = nAME;
	}
	public String getADDRESS() {
		return ADDRESS;
	}
	public void setADDRESS(String aDDRESS) {
		ADDRESS = aDDRESS;
	}
	public String getTYPE() {
		return TYPE;
	}
	public void setTYPE(String tYPE) {
		TYPE = tYPE;
	}
	public String getTEL() {
		return TEL;
	}
	public void setTEL(String tEL) {
		TEL = tEL;
	}
	public String getEMAIL() {
		return EMAIL;
	}
	public void setEMAIL(String eMAIL) {
		EMAIL = eMAIL;
	}
	public int getRATING() {
		return RATING;
	}
	public void setRATING(int rATING) {
		RATING = rATING;
	}
	@Override
	public String toString() {
		return "hotelInfo [ID=" + ID + ", NAME=" + NAME + ", ADDRESS=" + ADDRESS + ", TYPE=" + TYPE + ", TEL=" + TEL
				+ ", EMAIL=" + EMAIL + ", RATING=" + RATING + ", X=" + X + ", Y=" + Y + "]";
	}
	
	

}
