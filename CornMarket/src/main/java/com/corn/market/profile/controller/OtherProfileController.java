package com.corn.market.profile.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
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
	@RequestMapping(value = "/profile/{user_id}", method = RequestMethod.GET)
	public String otherProfileOnSale(@PathVariable String user_id, Model model) { 
		ProfileSale profileSale = service.getProfileSales(user_id, "판매중");
		model.addAttribute("profile", profileSale);
		return "profile/profile_page";
	}
	//타인 프로필 판매완료 페이지
	@RequestMapping(value = "/profile/{user_id}/offsale", method = RequestMethod.GET)
	public String otherProfileOffSale(@PathVariable String user_id, Model model) { 
		ProfileSale profileSale = service.getProfileSales(user_id, "거래완료");
		model.addAttribute("profile", profileSale);
		return "profile/profile_page";
	}
	//타인 프로필 거래후기 페이지
	@RequestMapping(value = "/profile/{user_id}/review", method = RequestMethod.GET)
	public String otherProfileReview(@PathVariable String user_id, Model model) { 
		ProfileReview profileReview = service.getProfileReviews(user_id);
		model.addAttribute("profile", profileReview);
		return "profile/profile_review";
	}
	
}
