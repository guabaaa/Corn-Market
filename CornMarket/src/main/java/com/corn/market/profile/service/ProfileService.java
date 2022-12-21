package com.corn.market.profile.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.corn.market.profile.dao.ProfileDao;
import com.corn.market.profile.domain.ProfileReview;
import com.corn.market.profile.domain.ProfileSale;
import com.corn.market.profile.domain.ProfileUpdate;

@Service
public class ProfileService {

	@Autowired
	private ProfileDao dao;
	
	//프로필+판매내역 조회
	public ProfileSale getProfileSales(String id, String post_status) {
		ProfileSale profileSale = dao.selectProfileSale(id, post_status);
		return profileSale;
	}
	
	//프로필+거래후기 조회
	public ProfileReview getProfileReviews(String id) {
		ProfileReview profileReview = dao.selectProfileReview(id);
		return profileReview;
	}
	
	//프로필 수정 조회
	public ProfileUpdate getProfileInfo(String id) {
		ProfileUpdate profileUpdate = dao.selectProfileInfo(id);
		return profileUpdate;
	}
	
	//프로필 닉네임 수정 등록
	public void modifyNickname(String id, String nickname) {
		dao.updateProfileNickname(id, nickname);
	}
	
	//프로필 사진 수정 등록
	public void modifyProfileImage(String id, String profile_img) {
		dao.updateProfileImage(id, profile_img);
	}
	
	//프로필 닉네임 중복 확인
	public boolean checkNickname(String nickname) {
		return dao.checkNickname(nickname);
	}
	
}
