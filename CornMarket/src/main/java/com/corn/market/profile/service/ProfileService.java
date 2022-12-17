package com.corn.market.profile.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.corn.market.profile.dao.ProfileDao;

@Service
public class ProfileService {

	@Autowired
	ProfileDao dao;
	
}
