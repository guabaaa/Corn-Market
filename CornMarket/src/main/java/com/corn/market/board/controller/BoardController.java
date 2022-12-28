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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.corn.market.board.dao.BoardDao;
import com.corn.market.board.domain.BoardVO;
import com.corn.market.member.dao.MemberDao;
import com.corn.market.member.domain.Member;

@Controller
public class BoardController {
	
	@Autowired
	BoardDao dao;
	
	/*게시판 진입*/
	@GetMapping("/list")
	public String list(HttpServletRequest request) throws Exception {
	//if(!loginCheck(request))
	//		return "redirect:/login/login?toURL="+request.getRequestURL();  // 로그인을 안했으면 로그인 화면으로 이동

		dao.selectAll();
		return "board/view"; // 로그인을 한 상태이면, 게시판 화면으로 이동
		//return "board/list"
	} 
	
	
	/*게시물 작성 폼 */

	@GetMapping("/enroll")
	public String mainPageGet() {
	System.out.println("메인 페이지 ");
	return "board/list";
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
	   
	    return "board/list";
	    
	   }
	

	  // 게시물 조회
		//주소는 board/view?post_id=[고유번호] 방식으로 되기 때문에, param을 이용해서 주소에서 bno의 값을 걸러내야함 
	   @GetMapping("/view")
		 public void getView(@RequestParam("bno") int post_id , Model model) throws Exception {

			BoardVO vo = dao.view (post_id);
			// 매견변수 post_id로 서비스 받고 
			model.addAttribute("view", vo);
			 //뷰로 넘겨주기 
		 }
		
		// 게시물 수정 위와동일한 방법임 jsp 가서 value값 지정해주면 값나옴 value="${view.title}"
	   @GetMapping("/modify")
		public void getModify(@RequestParam("bno") int bno, Model model) throws Exception {

		  BoardVO vo = dao.view(bno);

		  model.addAttribute("view", vo);
		 }
		 
		// 게시물 수정
	   
		 @PostMapping("/modify")
		 public String postModify(BoardVO vo) throws Exception {

		  dao.modify(vo);
		    
		  //수정한 bno  조회페이지로 넘어오게함 
		  return "redirect:/board/view?post_id=" + vo.getPost_id();
		 }
	
		 
		 
		 
		 
		 
		 
	
	/* 수정 페이지 이동 
	@GetMapping("/modify")
	public void boardModifyGET(int post_id, Model model ) {
		
		model.addAttribute("pageInfo", dao.getPage(post_id));
		
		
	}
	
	/* 페이지 수정
	@PostMapping("/modify")
	public String boardModifyPOST(BoardVO board, RedirectAttributes rttr) {
		
		dao.modify(board);
		
		rttr.addFlashAttribute("result", "modify success");
		
		return "redirect:/board/list";
		
	} */
	
	
	/* 페이지 삭제 */
	@PostMapping("/delete")
	public String boardDeletePOST(int post_id, RedirectAttributes rttr) throws Exception {
		
	dao.delete(post_id);
		
	rttr.addFlashAttribute("result", "delete success"); // 알람 뜨게해줄거임 (삭제)
		
	return "redirect:/board/list";
	}
	
	
	
	

}
