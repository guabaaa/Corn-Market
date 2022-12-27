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
import org.springframework.web.bind.annotation.ResponseBody;

import com.corn.market.chatting.domain.ChattingContent;
import com.corn.market.chatting.domain.ChattingInfo;
import com.corn.market.chatting.domain.ChattingRoom;
import com.corn.market.chatting.domain.ChattingRoomInfo;
import com.corn.market.chatting.domain.CheckChattingRoom;
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
		for(ChattingRoomInfo chat : list) System.out.println(chat); //콘솔 테스트
		model.addAttribute("list", list);
		return "chatting/chatting_list_sample";
	}
	//채팅방 새로 등록
	@PostMapping("/chatting/list")
	public String chattingRoomReg(String post_id,HttpSession session) {
		//판매글 하나에 구매자 하나의 채팅만 등록해야함
		String buyer_id = (String) session.getAttribute("id"); //구매자 id
		String room_id = chattingService.getChattingRoomId(); //UUID 생성
		ChattingRoom chattingRoom = new ChattingRoom(room_id, post_id, chattingService.getSellerId(post_id), buyer_id);
		chattingService.regNewChattingRoom(chattingRoom);
		//채팅방으로 이동
		return "redirect:/chatting/list/"+room_id;
	}
	//채팅방id로 내용 조회
	@GetMapping("/chatting/list/{room_id}")
	public String chattingRoom(@PathVariable String room_id,Model model,HttpSession session) {
		String user_id = (String) session.getAttribute("id");
		ChattingInfo chattingInfo = chattingService.getChattingInfo(room_id, user_id);
		model.addAttribute("chat", chattingInfo);
		model.addAttribute("id", user_id);
		return "chatting/chatting_sample";
	}
	//채팅 내용 등록
	@ResponseBody
	@PostMapping("/chatting/list/{room_id}")
	public void chattingContentReg(@PathVariable String room_id, @RequestBody ChattingContent chattingContent) {
		chattingService.regChattingContent(chattingContent);
		System.out.println(chattingContent);
	}
	//판매글id와 구매자id(세션)로 채팅방 확인 (채팅방 생성시)
	@ResponseBody
	@PostMapping("/chatting/list/check")
	public String checkChatRoom(@RequestBody String post_id,HttpSession session) {
		String user_id = (String) session.getAttribute("id");
		//room_count 0이면 채팅방 없음, 1이면 채팅방 있음'
		System.out.println(user_id+","+post_id);
		String room = chattingService.checkChatRoom(post_id, user_id);
		System.out.println("방id:"+room);
		return room;
	}
}
