package com.corn.market.chatting.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.corn.market.chatting.domain.ChattingContent;
import com.corn.market.chatting.domain.ChattingInfo;
import com.corn.market.chatting.domain.ChattingRoom;
import com.corn.market.chatting.domain.ChattingRoomInfo;
import com.corn.market.chatting.service.ChattingService;

@Controller
public class ChattingController {

	@Autowired
	private ChattingService chattingService;
	
	//채팅방 목록
	@GetMapping("/chatting/list")
	public String chattingRoomList(Model model,HttpSession session) {
		session.setAttribute("id", "ch11"); //테스트용
		//세션의 아이디로 채팅방 목록 가져오기
		String user_id = (String) session.getAttribute("id");
		ArrayList<ChattingRoomInfo> list = chattingService.getChattingList(user_id);
		model.addAttribute("list", list);
		return "chatting/chatting_list_sample";
	}
	//채팅방 새로 등록
	@PostMapping("/chatting/list")
	public String chattingRoomReg(String post_id,HttpSession session) {
		//
		String buyer_id = (String) session.getAttribute("id"); //구매자 id
		String room_id = chattingService.getChattingRoomId(); //UUID 생성
		ChattingRoom chattingRoom = new ChattingRoom(room_id, post_id, chattingService.getSellerId(post_id), buyer_id);
		chattingService.regNewChattingRoom(chattingRoom);
		return "redirect:/chatting/list";
	}
	//채팅방id로 내용 조회
	@GetMapping("/chatting/list/{room_id}")
	public String chattingRoom(@PathVariable String room_id,Model model,HttpSession session) {
		String user_id = (String) session.getAttribute("id");
		ChattingInfo chattingInfo = chattingService.getChattingInfo(room_id, user_id);
		model.addAttribute("chat", chattingInfo);
		return "chatting/chatting_sample";
	}
	//채팅 내용 등록
	@PostMapping("/chatting/list/{room_id}")
	public void chattingContentReg(@PathVariable String room_id, @RequestBody ChattingContent chattingContent) {
		chattingService.regChattingContent(chattingContent);
	}
}
