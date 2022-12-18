package com.corn.market.profile.service;

import java.util.ArrayList;

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
	public ArrayList<ProfileSale> getProfileSales(String id, String post_status) {
		ArrayList<ProfileSale> list = dao.selectProfileSale(id, post_status);
		return list;
	}
	
	//프로필+거래후기 조회
	public ArrayList<ProfileReview> getProfileReviews(String id) {
		ArrayList<ProfileReview> list = dao.selectProfileReview(id);
		return list;
	}
	
}
