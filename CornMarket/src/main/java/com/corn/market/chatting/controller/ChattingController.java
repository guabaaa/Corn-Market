package com.corn.market.chatting.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ChattingController {

	@GetMapping("/chatting")
	public String chattingPage(String room,Model model) {
		//해당 채팅방 데이터 가져오기
		
		model.addAttribute("room_id", room);
		return "chatting/chatting_sample";
	}
	
	@GetMapping("/chatting-list")
	public String chattingRoomList(String room,HttpSession session) {
		//세션의 아이디로 채팅방 목록 가져오기
		session.getAttribute("id");
		
		return "chatting/chatting_list_sample";
	}
}
