package com.corn.market.account.domain;

public class SearchPw {
	
	private String user_id;
	private String user_name;
	private String email;
	
	public SearchPw() {
		// TODO Auto-generated constructor stub
	}
	
	public SearchPw(String user_id, String user_name, String email) {
		super();
		this.user_id = user_id;
		this.user_name = user_name;
		this.email = email;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "AccountPw [user_id=" + user_id + ", user_name=" + user_name + ", email=" + email + "]";
	}
	
}
