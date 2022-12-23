package com.corn.market.profile.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.corn.market.profile.domain.ProfileReview;
import com.corn.market.profile.domain.ProfileSale;
import com.corn.market.profile.domain.Review;
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
		//ProfileReview profileReview = service.getProfileReviews(id);
		
		//  테스트용 데이터
		ArrayList<Review> list = new ArrayList<Review>();
		list.add(new Review("d누나", "거래후기 입니다1"));
		list.add(new Review("e누나", "거래후기 입니다2"));
		list.add(new Review("f누나", "거래후기 입니다3"));
		String[] date = {"2022년","10월","19일"};
		ProfileReview profileReview = new ProfileReview("CH", "36.5", "마포구", date, "/resources/images/profile/profile_img_default.png", list);
		//
		
		request.setAttribute("id", id);
		request.setAttribute("profile", profileReview);
		return "profile/other_profile_review";
	}
	
}
