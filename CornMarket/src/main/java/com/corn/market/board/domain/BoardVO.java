package com.corn.market.board.domain;

import java.util.Date;

public class BoardVO {
	/*
	DROP TABLE post_tbl22;
	CREATE TABLE post_tbl22(
	  post_id NUMBER(6) 
	    CONSTRAINT post_id_pk PRIMARY KEY,
	  user_id VARCHAR2(20) 
	    CONSTRAINT post_user_id_nn NOT NULL 
	    CONSTRAINT post_user_id_fk REFERENCES user_tbl22(user_id),
	  category_id VARCHAR2(20) 
	    CONSTRAINT post_category_id_nn NOT NULL 
	    CONSTRAINT post_category_id_fk REFERENCES category_tbl22(category_id),
	  town_code NUMBER(5) 
	    CONSTRAINT post_town_code_nn NOT NULL 
	    CONSTRAINT post_town_code_fk REFERENCES town_tbl22(town_code),
	  title VARCHAR2(90) 
	    CONSTRAINT post_title_nn NOT NULL,
	  price NUMBER(8) 
	    CONSTRAINT post_price_nn NOT NULL,
	  content VARCHAR2(900),
	  created TIMESTAMP DEFAULT SYSTIMESTAMP 
	    CONSTRAINT post_created_nn NOT NULL,
	  updated TIMESTAMP DEFAULT SYSTIMESTAMP,
	  post_status VARCHAR2(15) DEFAULT '판매중' 
	    CONSTRAINT post_status_ck CHECK(post_status IN('판매중','거래완료','삭제'))
	    CONSTRAINT post_status_nn NOT NULL,
	  post_img VARCHAR2(900) DEFAULT '/resources/images/profile/post_img_thumbnail.png',
	  count_view NUMBER(5)
	);
		 */
	
	
	private int post_id; // 게시글 번호
	private String user_id; // 글쓴이   
	private String category_id; //카테고리 아이디 
	private String title; // 제목
	private int price; // 가격
	private String content; //내용 
	private Date created; // 등록일
	private Date updated; // 수정일
	private int count_view; // 조회수
	
	
	
	
	
	
	
	@Override
	public String toString() {
		return "BoardVO [post_id=" + post_id + ", user_id=" + user_id + ", category_id=" + category_id + ", title="
				+ title + ", price=" + price + ", content=" + content + ", created=" + created + ", updated=" + updated
				+ ", count_view=" + count_view + "]";
		
		
	}
	public BoardVO() {};
	public BoardVO(int post_id, String user_id, String category_id, String title, int price, String content,
			Date created, Date updated, int count_view) {
		super();
		this.post_id = post_id;
		this.user_id = user_id;
		this.category_id = category_id;
		this.title = title;
		this.price = price;
		this.content = content;
		this.created = created;
		this.updated = updated;
		this.count_view = count_view;
	}
	
	
	public int getPost_id() {
		return post_id;
	}
	public void setPost_id(int post_id) {
		this.post_id = post_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getCategory_id() {
		return category_id;
	}
	public void setCategory_id(String category_id) {
		this.category_id = category_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getCreated() {
		return created;
	}
	public void setCreated(Date created) {
		this.created = created;
	}
	public Date getUpdated() {
		return updated;
	}
	public void setUpdated(Date updated) {
		this.updated = updated;
	}
	public int getCount_view() {
		return count_view;
	}
	public void setCount_view(int count_view) {
		this.count_view = count_view;
	}
	
	
	
	

}
