package com.corn.market.profile.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.corn.market.common.api.fileUpload.FileUploadService;
import com.corn.market.profile.domain.ProfileReview;
import com.corn.market.profile.domain.ProfileSale;
import com.corn.market.profile.domain.ProfileUpdate;
import com.corn.market.profile.domain.Review;
import com.corn.market.profile.service.ProfileService;

@Controller
public class ProfileController {
	
	@Autowired
	ProfileService service;
	@Autowired
	private FileUploadService uploadService;
	
	//본인 프로필 기본 페이지 (판매중)
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String profileOnSale(HttpSession session,HttpServletRequest request) { 
		session.setAttribute("id", "fourkimm"); //세션 테스트
		//인터셉터가 true (아이디가 세션이 있음)
		String id = (String) session.getAttribute("id");
		ProfileSale profileSale = service.getProfileSales(id, "판매중");
		System.out.println("판매글 리스트 \n"+profileSale.getSaleList());
		request.setAttribute("profile", profileSale);
		return "profile/profile_onsale";
	}
	//본인 프로필 판매완료 페이지
	@RequestMapping(value = "/profile/offsale", method = RequestMethod.GET)
	public String profileOffSale(HttpSession session,HttpServletRequest request) { 
		//인터셉터가 true (아이디가 세션이 있음)
		String id = (String) session.getAttribute("id");
		ProfileSale profileSale = service.getProfileSales(id, "거래완료");
		request.setAttribute("profile", profileSale);
		return "profile/profile_offsale";
	}
	//본인 프로필 거래후기 페이지
	@RequestMapping(value = "/profile/review", method = RequestMethod.GET)
	public String profileReview(HttpSession session,HttpServletRequest request) { 
		//인터셉터가 true (아이디가 세션이 있음)
		String id = (String) session.getAttribute("id");
		
		//ProfileReview profileReview = service.getProfileReviews(id);
		
		//  테스트용 데이터
		ArrayList<Review> list = new ArrayList<Review>();
		list.add(new Review("a누나", "거래후기 입니다1"));
		list.add(new Review("b누나", "거래후기 입니다2"));
		list.add(new Review("c누나", "거래후기 입니다3"));
		String[] date = {"2022년","10월","18일"};
		ProfileReview profileReview = new ProfileReview("꿍디누나", "36.5", "마포구", date, "/resources/images/profile/profile_img_default.png", list);
		//
		
		request.setAttribute("profile", profileReview);
		return "profile/profile_review";
	}
	
	//본인 프로필 수정 페이지
	@RequestMapping(value = "/profile/update", method = RequestMethod.GET)
	public String otherProfileUpdate(HttpSession session,HttpServletRequest request) { 
		//인터셉터가 true (아이디가 세션이 있음)
		String id = (String) session.getAttribute("id");
		ProfileUpdate profileUpdate = service.getProfileInfo(id);
		request.setAttribute("profile", profileUpdate);
		return "profile/popup_profile_update";
	}
	//닉네임 중복 확인
	@ResponseBody
	@RequestMapping(value = "/profile/update/check", method = RequestMethod.GET)
	public String checkNickname(HttpSession session, String nickname) {
		System.out.println("중복확인: "+nickname);
		if(service.checkNickname(nickname)) return "0"; //중복아닐때
		else return "1"; //중복일때
	}
	//닉네임 수정
	@RequestMapping(value = "/profile/update/nickname", method = RequestMethod.POST)
	public String modifyNickname(HttpSession session, String nickname) {
		//인터셉터가 true (아이디가 세션이 있음)
		String id = (String) session.getAttribute("id");
		System.out.println("닉네임수정: "+nickname);
		service.modifyNickname(id, nickname);
		return "redirect:/profile"; //프로필페이지 맵핑으로
	}
	//프로필이미지 수정페이지
	@RequestMapping(value = "/profile/update/image", method = RequestMethod.GET)
	public String modifyProfileImagePage() {
		return "profile/popup_profile_img";
	}
	//프로필이미지 수정
	@RequestMapping(value = "/profile/update/image", method = RequestMethod.POST)
	public String modifyProfileImage(HttpSession session, MultipartFile file, HttpServletRequest request) {
		//인터셉터가 true (아이디가 세션이 있음)
		String id = (String) session.getAttribute("id");
		//서비스 메서드로 파일 업로드
		String url = uploadService.oneFileUpload(file, request);
		//DB에 이미지데이터 등록
		service.modifyProfileImage(id, url);
		
		return "redirect:/profile/update"; //프로필수정페이지 맵핑으로
	}
	
}
