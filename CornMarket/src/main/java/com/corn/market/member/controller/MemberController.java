package com.corn.market.member.controller;

import java.net.http.HttpHeaders;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.corn.market.account.domain.AccountId;
import com.corn.market.account.domain.SearchIdMail;
import com.corn.market.member.dao.MemberDao;
import com.corn.market.member.domain.LoginMember;
import com.corn.market.member.domain.Member;
 

@Controller
public class MemberController {

	@Autowired
	MemberDao dao;


	//----------------------회원가입---------------------//

	// 회원가입 페이지 이동 
	@GetMapping("/signup")
	public String signupForm() {
	return "signup/signUp";
	} 

	//회원가입 완료  
	@PostMapping("/signup")
	public String signupPOST(Member member) throws Exception {
	dao.memberSignup(member);
    return "redirect:/login";
	}

    //아이디 중복체크 
	@ResponseBody
	@PostMapping("/idcheck")
	public int idcheck(Member member) throws Exception {
		
	    int result= dao.idCheck(member);	
	    System.out.println(result);
		return result ;
		
	} 
	
	
	//닉네임 중복체크 
	@ResponseBody
	@GetMapping("/nickcheck")
		public int nickcheck(String nickname) throws Exception {
		int result=dao.nicknameCheck(nickname);
	    return result ;
	} 
	
	
	//----------------------로그인 --------------------//

	
	//카카오 로그인 
	@GetMapping("/market/kakaoLogin")
	public String kakaoLogin(@RequestParam(value = "code", required = false) String code) throws Exception {
	  if(code!=null) {
		System.out.println("code = " + code);
	  }
		
		return "member/testPage";
    	}



	
	

	// 로그인페이지  
	@GetMapping("/login")
	public String loginForm() {
	return "login/login";
	} // loginForm   

	@PostMapping("/login")
	public String login(LoginMember member, boolean rememberMe, 
	HttpServletResponse response,HttpServletRequest request) {

		System.out.println("id : " + member.getUser_id());
		System.out.println("passwd : " + member.getUser_pw());
		System.out.println("rememberMe : " + rememberMe);

	// 1. id 존재여부
		try {
		Member	dbMember = dao.getMemberById(member);
		System.out.println(dbMember);
		if (dbMember == null) { // 존재하지 않는 아이디
				System.out.println("아이디 비밀번호 확인바랍니다."); 
				return "redirect:/login";
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} // 데이터에있는 아이디 가져와 


		// 3. 로그인 유지 체크했는지
		if (rememberMe == true) { // 로그인 유지에 체크 했을 때
			// 쿠키등록하기
			Cookie cookie = new Cookie("userId", member.getUser_id());
			cookie.setMaxAge(60 * 60 * 24 * 7); // 쿠키 수명 설정 초단위
			cookie.setPath("/"); // 모든경로에 적용

			response.addCookie(cookie); //HttpServletResponse response,
		}
		// 4. 세션 등록
		HttpSession session= request.getSession(); // 섹션 얻어오는거임 
		session.setAttribute("id", member.getUser_id());

		// 5. 로그인 성공 메세지 띄우고, 메인화면으로 이동
		System.out.println("로그인성공 ");

		return "redirect:/main";
	}
	
	//로그아웃 
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("id");
		session.invalidate();
		return "redirect:/login";
	}



}

	 


