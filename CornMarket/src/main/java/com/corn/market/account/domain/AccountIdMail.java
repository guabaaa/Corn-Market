package com.corn.market.account.domain;

public class AccountIdMail {

	String user_name;
	String email;
	
	public AccountIdMail() {
		// TODO Auto-generated constructor stub
	}
	
	public AccountIdMail(String user_name, String email) {
		super();
		this.user_name = user_name;
		this.email = email;
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
		return "AccountIdMail [user_name=" + user_name + ", email=" + email + "]";
	}
	
	
	
}
