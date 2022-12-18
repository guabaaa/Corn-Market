package com.corn.market.profile.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.corn.market.profile.dao.ProfileDao;
import com.corn.market.profile.domain.ProfileReview;
import com.corn.market.profile.domain.ProfileSale;

@Service
public class ProfileService {

	@Autowired
	ProfileDao dao;
	
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
	
}
