package com.corn.market.chatting.domain;

public class CheckChattingRoom {
	
	String room_id;
	int room_count;
	
	public CheckChattingRoom() {
		// TODO Auto-generated constructor stub
	}
	
	public CheckChattingRoom(String room_id, int room_count) {
		super();
		this.room_id = room_id;
		this.room_count = room_count;
	}

	public String getRoom_id() {
		return room_id;
	}

	public void setRoom_id(String room_id) {
		this.room_id = room_id;
	}

	public int getRoom_count() {
		return room_count;
	}

	public void setRoom_count(int room_count) {
		this.room_count = room_count;
	}

	@Override
	public String toString() {
		return "CheckChattingRoom [room_id=" + room_id + ", room_count=" + room_count + "]";
	}
	
}
