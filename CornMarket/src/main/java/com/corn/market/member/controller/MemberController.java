package com.corn.market.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.corn.market.member.dao.MemberDao;
import com.corn.market.member.domain.Member;
 

@Controller
public class MemberController {
	
	@Autowired
	MemberDao dao;
	 
		//----------------------회원가입---------------------//
		
		// 회원가입 페이지 이동 
		@GetMapping("/signup")
		public String signupForm() {
		System.out.println("회원가입 페이지 ");
		return "signup/signUp";
		} // loginForm
		
		
		//회원가입 db 전달  
		@PostMapping("/signup")
		public String signupPOST(Member member) throws Exception {
			
		System.out.println(" signupform 호출  ");
			// 회원가입 실행
		
			dao.memberSignup(member);
			System.out.println(" signup service 성공   ");
			return "redirect:/login/login";
		}
		
		
		
		
		//----------------------로그인 --------------------//

		// 로그인 페이지 이동 
		@GetMapping("/member/login")
		public String loginForm() {
		System.out.println("로그인 페이지 ");
		return "login/login";
		} // loginForm
		
		
		@PostMapping("/login")
		public String loginPOST(HttpServletRequest request, Member member, RedirectAttributes rttr,boolean rememberMe) throws Exception{
		//MemberVo는 데이터를 전달받기 위해
		//HttpServletRequest는 로그인 성공 시 session처리
	    //RedirectAttributes는 로그인 실패 시 리다이렉트 된 로그인 페이지에 실패를 의미하는 데이터를 전송
			
		System.out.println("login 진행 중 ");
		System.out.println("전달된 데이터 : " + member);
			
		HttpSession session = request.getSession();
	    Member dbmomberVO =dao.memberLogin(member);
			 
	 	if(dbmomberVO == null) { // 일치하지 않는 아이디, 비밀번호 입력 경우
		            
		 int result = 0; //영현아 0주면 알람 띄어줭 el써줭 
		 rttr.addAttribute("result", result);
		 
		 return "redirect:/login/login";
		            
		 }
	 	System.out.println("로그인 버튼동작여부  ");       
	 	session.setAttribute("member", dbmomberVO);  // 일치하는 아이디, 비밀번호 경우 (로그인 성공)
	 	System.out.println("로그인 성공 ");
	 	return "redirect:/main/after_login";
			               
			        
			    }
		

	}
	
	 


