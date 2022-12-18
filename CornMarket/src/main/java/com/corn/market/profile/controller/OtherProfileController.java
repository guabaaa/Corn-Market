package com.corn.market.profile.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.corn.market.profile.service.ProfileService;

@Controller
public class OtherProfileController {
	
	@Autowired
	ProfileService service;
			
	//타인 프로필 기본 페이지 (판매중)
	@RequestMapping(value = "/profile/user", method = RequestMethod.GET)
	public String otherProfileOnSale(String id) { 
		System.out.println("타인 아이디:"+id);
		return "profile/other_profile_onsale";
	}
	//타인 프로필 판매완료 페이지
	@RequestMapping(value = "/profile/user/offsale", method = RequestMethod.GET)
	public String otherProfileOffSale(String id) { 
		System.out.println("타인 아이디:"+id);
		return "profile/other_profile_offsale";
	}
	//타인 프로필 거래후기 페이지
	@RequestMapping(value = "/profile/user/review", method = RequestMethod.GET)
	public String otherProfileReview(String id) { 
		System.out.println("타인 아이디:"+id);
		return "profile/other_profile_review";
	}
	
}
