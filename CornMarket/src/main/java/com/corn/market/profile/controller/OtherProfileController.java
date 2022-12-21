package com.corn.market.profile.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.corn.market.profile.domain.ProfileReview;
import com.corn.market.profile.domain.ProfileSale;
import com.corn.market.profile.service.ProfileService;

@Controller
public class OtherProfileController {
	
	@Autowired
	ProfileService service;
			
	//타인 프로필 기본 페이지 (판매중)
	@RequestMapping(value = "/profile/user", method = RequestMethod.GET)
	public String otherProfileOnSale(String id,HttpServletRequest request) { 
		System.out.println("타인 아이디:"+id);
		request.setAttribute("id", id);
		ProfileSale profileSale = service.getProfileSales(id, "판매중");
		request.setAttribute("profile", profileSale);
		return "profile/other_profile_onsale";
	}
	//타인 프로필 판매완료 페이지
	@RequestMapping(value = "/profile/user/offsale", method = RequestMethod.GET)
	public String otherProfileOffSale(String id,HttpServletRequest request) { 
		System.out.println("타인 아이디:"+id);
		request.setAttribute("id", id);
		ProfileSale profileSale = service.getProfileSales(id, "거래완료");
		request.setAttribute("profile", profileSale);
		return "profile/other_profile_offsale";
	}
	//타인 프로필 거래후기 페이지
	@RequestMapping(value = "/profile/user/review", method = RequestMethod.GET)
	public String otherProfileReview(String id,HttpServletRequest request) { 
		System.out.println("타인 아이디:"+id);
		request.setAttribute("id", id);
		ProfileReview profileReview = service.getProfileReviews(id);
		request.setAttribute("profile", profileReview);
		return "profile/other_profile_review";
	}
	
}
