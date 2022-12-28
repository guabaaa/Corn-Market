package com.corn.market.board.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.corn.market.board.dao.BoardDao;
import com.corn.market.board.domain.BoardVO;
import com.corn.market.member.dao.MemberDao;
import com.corn.market.member.domain.Member;

@Controller
public class BoardController {
	
	@Autowired
	BoardDao dao;
	
	
	/* 게시판 등록 페이지 접속 */
	@GetMapping("/enroll")
	public void boardEnrollGET() {
		
		
	}
	
	/* 게시판 등록 */
	/* 제목 글내용 가격 첨부파일 사용자가 넣는 값 */
	/* 아이디 session으로 가지고와야하는 값  */
	
	@PostMapping("/enroll")
	public String write(BoardVO boardVO, HttpSession session)
			throws IllegalStateException, IOException {
		
		System.out.println("수정 전 boardVO : " + boardVO);
		
		//글쓴이 추가 
		String id = (String) session.getAttribute("id");
		boardVO.getUser_id();
		
		//조회수0으로 셋팅 
	    boardVO.setCount_view(0);
	    
	    // 글 쓴 날짜 추가
	   boardVO.setCreated(new Date());
	     
	   dao.enroll(boardVO);
	   
	   System.out.println("수정 후  boardVO : " + boardVO);
	    
	   }
	      
	
	/* 페이지 수정 */
	@PostMapping("/modify")
	public String boardModifyPOST(BoardVO board, RedirectAttributes rttr) throws Exception {
		
	dao.modify(board);
		
	rttr.addAttribute("result", "modify success"); //알람 (수정) 
		
    return "redirect:/board/list";
		
	}
	
	/* 페이지 삭제 */
	@PostMapping("/delete")
	public String boardDeletePOST(int post_id, RedirectAttributes rttr) throws Exception {
		
	dao.delete(post_id);
		
	rttr.addFlashAttribute("result", "delete success"); // 알람 뜨게해줄거임 (삭제)
		
	return "redirect:/board/list";
	}
	
	
	
	

}
