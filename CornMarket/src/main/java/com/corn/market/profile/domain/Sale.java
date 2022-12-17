package com.corn.market.profile.domain;

public class Sale {
	
	String post_img;
	String title;
	String price;
	String town_name;
	
	public Sale() {
		// TODO Auto-generated constructor stub
	}

	public Sale(String post_img, String title, String price, String town_name) {
		super();
		this.post_img = post_img;
		this.title = title;
		this.price = price;
		this.town_name = town_name;
	}

	public String getPost_img() {
		return post_img;
	}

	public void setPost_img(String post_img) {
		this.post_img = post_img;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getTown_name() {
		return town_name;
	}

	public void setTown_name(String town_name) {
		this.town_name = town_name;
	}

	@Override
	public String toString() {
		return "Sale [post_img=" + post_img + ", title=" + title + ", price=" + price + ", town_name=" + town_name
				+ "]";
	}
	
}
