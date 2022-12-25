package com.corn.market.chatting.service;

import java.util.ArrayList;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.corn.market.chatting.dao.ChattingDao;
import com.corn.market.chatting.domain.ChattingContent;
import com.corn.market.chatting.domain.ChattingInfo;
import com.corn.market.chatting.domain.ChattingRoom;
import com.corn.market.chatting.domain.ChattingRoomInfo;

@Service
public class ChattingService {
	
	@Autowired
	private ChattingDao dao;
	
	//채팅방 새로 등록
	public void regNewChattingRoom(ChattingRoom chattingRoom) {
		dao.insertChattingRoom(chattingRoom);
	}
	//채팅방 번호 UUID 생성
	public String getChattingRoomId() {
		String room_id = UUID.randomUUID().toString();
		return room_id;
	}
	//판매글 아이디로 판매자 아이디 가져오기
	public String getSellerId(String post_id) {
		String seller_id = dao.selectSellerId(post_id);
		return seller_id;
	}
	
	//채팅 내용 등록
	public void regChattingContent(ChattingContent chattingContent) {
		dao.insertChattingContent(chattingContent);
	}
	
	//채팅방 목록 조회
	public ArrayList<ChattingRoomInfo> getChattingList(String user_id) {
		ArrayList<ChattingRoomInfo> list = dao.selectChattingRoom(user_id);
		return list;
	}
	
	//채팅창 정보 조회 (채팅내용)
	public ChattingInfo getChattingInfo(String room_id, String user_id) {
		ChattingInfo chattingInfo = dao.selectChattingInfo(room_id, user_id);
		return chattingInfo;
	}

}
