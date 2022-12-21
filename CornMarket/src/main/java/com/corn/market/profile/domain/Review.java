package com.corn.market.profile.domain;

public class Review {
	
	private String nickname;
	private String review;
	
	public Review() {
		// TODO Auto-generated constructor stub
	}

	public Review(String nickname, String review) {
		super();
		this.nickname = nickname;
		this.review = review;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	@Override
	public String toString() {
		return "Review [nickname=" + nickname + ", review=" + review + "]";
	}
	
}
