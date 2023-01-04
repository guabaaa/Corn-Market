package com.corn.market.profile.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.corn.market.common.fileUpload.FileUploadService;
import com.corn.market.profile.domain.ProfileReview;
import com.corn.market.profile.domain.ProfileSale;
import com.corn.market.profile.domain.ProfileUpdate;
import com.corn.market.profile.service.ProfileService;

@Controller
public class ProfileController {
	
	@Autowired
	ProfileService service;
	@Autowired
	private FileUploadService uploadService;
	
	//본인 프로필 기본 페이지 (판매중)
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String profileOnSale(HttpSession session, Model model) { 
		String id = (String) session.getAttribute("id");
		ProfileSale profileSale = service.getProfileSales(id, "판매중");
		model.addAttribute("profile", profileSale);
		return "profile/profile_page";
	}
	//본인 프로필 판매완료 페이지
	@RequestMapping(value = "/profile/offsale", method = RequestMethod.GET)
	public String profileOffSale(HttpSession session, Model model) { 
		String id = (String) session.getAttribute("id");
		ProfileSale profileSale = service.getProfileSales(id, "거래완료");
		model.addAttribute("profile", profileSale);
		return "profile/profile_page";
	}
	//본인 프로필 거래후기 페이지
	@RequestMapping(value = "/profile/review", method = RequestMethod.GET)
	public String profileReview(HttpSession session, Model model) { 
		String id = (String) session.getAttribute("id");
		ProfileReview profileReview = service.getProfileReviews(id);
		model.addAttribute("profile", profileReview);
		return "profile/profile_review";
	}
	
	//본인 프로필 수정 페이지
	@RequestMapping(value = "/profile/update", method = RequestMethod.GET)
	public String otherProfileUpdate(HttpSession session, Model model) { 
		String id = (String) session.getAttribute("id");
		ProfileUpdate profileUpdate = service.getProfileInfo(id);
		model.addAttribute("profile", profileUpdate);
		return "profile/popup_profile_update";
	}
	//닉네임 중복 확인
	@ResponseBody
	@RequestMapping(value = "/profile/update/check", method = RequestMethod.GET)
	public String checkNickname(HttpSession session, String nickname) {
		int result_ = service.checkNickname(nickname);
		String result = Integer.toString(result_); //중복일때 1, 중복아님 0
		System.out.println("중복확인 (0:중복아님) : "+result);
		return result; 
	}
	//닉네임 수정
	@RequestMapping(value = "/profile/update/nickname", method = RequestMethod.POST)
	public String modifyNickname(HttpSession session, String nickname) {
		String id = (String) session.getAttribute("id");
		service.modifyNickname(id, nickname);
		return "redirect:/profile"; //프로필페이지
	}
	//프로필이미지 수정페이지
	@RequestMapping(value = "/profile/update/image", method = RequestMethod.GET)
	public String modifyProfileImagePage() {
		return "profile/popup_profile_img";
	}
	//프로필이미지 수정
	@RequestMapping(value = "/profile/update/image", method = RequestMethod.POST)
	public String modifyProfileImage(HttpSession session, MultipartFile file, HttpServletRequest request) {
		String id = (String) session.getAttribute("id");
		//서비스 메서드로 파일 업로드
		String url = uploadService.oneFileUpload(file, request);
		//DB에 이미지데이터 등록
		service.modifyProfileImage(id, url);
		return "redirect:/profile/update"; //프로필수정페이지 맵핑으로
	}
	
}
