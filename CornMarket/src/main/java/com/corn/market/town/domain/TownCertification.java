package com.corn.market.town.domain;

public class TownCertification {
	
	private String addr_id;
	private String user_id;
	private String town_code;
	private String latitude;
	private String longitude;
	private String addr_date;
	
	public TownCertification() {
		// TODO Auto-generated constructor stub
	}

	public TownCertification(String addr_id, String user_id, String town_code, String latitude, String longitude,
			String addr_date) {
		super();
		this.addr_id = addr_id;
		this.user_id = user_id;
		this.town_code = town_code;
		this.latitude = latitude;
		this.longitude = longitude;
		this.addr_date = addr_date;
	}

	public String getAddr_id() {
		return addr_id;
	}

	public void setAddr_id(String addr_id) {
		this.addr_id = addr_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getTown_code() {
		return town_code;
	}

	public void setTown_code(String town_code) {
		this.town_code = town_code;
	}

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	public String getAddr_date() {
		return addr_date;
	}

	public void setAddr_date(String addr_date) {
		this.addr_date = addr_date;
	}

	@Override
	public String toString() {
		return "TownCertification [addr_id=" + addr_id + ", user_id=" + user_id + ", town_code=" + town_code
				+ ", latitude=" + latitude + ", longitude=" + longitude + ", addr_date=" + addr_date + "]";
	}

}
