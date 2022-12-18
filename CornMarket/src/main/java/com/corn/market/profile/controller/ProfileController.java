package com.corn.market.profile.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.corn.market.profile.service.ProfileService;

@Controller
public class ProfileController {
	
	@Autowired
	ProfileService service;
	
	//본인 프로필 기본 페이지 (판매중)
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String profileOnSale(HttpSession session,HttpServletRequest request) { 
		//인터셉터가 true (아이디가 세션이 있음)
		String id = (String) session.getAttribute("id");
		request.setAttribute("id", id);
		
		return "profile/profile_onsale";
	}
	//본인 프로필 판매완료 페이지
	@RequestMapping(value = "/profile/offsale", method = RequestMethod.GET)
	public String profileOffSale() { 
		return "profile/profile_offsale";
	}
	//본인 프로필 거래후기 페이지
	@RequestMapping(value = "/profile/review", method = RequestMethod.GET)
	public String profileReview() { 
		return "profile/profile_review";
	}
	
	//본인 프로필 수정 페이지
	@RequestMapping(value = "/profile/update", method = RequestMethod.GET)
	public String otherProfileUpdate() { 
		return "profile/other_profile_review";
	}
	
}
