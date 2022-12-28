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

@Controller
public class BoardController {
	
	@Autowired
	BoardDao dao;
	
	
	@GetMapping("/list")
	public String list(HttpServletRequest request) {
	//if(!loginCheck(request))
	//		return "redirect:/login/login?toURL="+request.getRequestURL();  // 로그인을 안했으면 로그인 화면으로 이동

		return "board/write"; // 로그인을 한 상태이면, 게시판 화면으로 이동
	}
	
	/*게시물 폼  */

	@GetMapping("/enroll")
	public String mainPageGet() {
	System.out.println("메인 페이지 ");
	return "board/write";
	} 
	

	/* 게시물 등록 */
	/* 제목 글내용 가격  사용자가 넣는 값 */
	/* 아이디 session으로 가지고와야하는 값  */
	
	@PostMapping("/enroll")
	public String write(BoardVO boardVO, HttpSession session)
			throws Exception {
		
		System.out.println("수정 전 boardVO : " + boardVO);
		
		//글쓴이 추가 
		String id = (String) session.getAttribute("id");
		boardVO.setUser_id(id);
  
	   dao.enroll(boardVO);
	   
	   System.out.println("수정 후  boardVO : " + boardVO);
	   
	    return "board/List";
	    
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
