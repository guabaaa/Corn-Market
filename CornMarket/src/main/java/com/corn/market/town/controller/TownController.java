package com.corn.market.town.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.corn.market.town.service.TownService;

@Controller
public class TownController {
	
	@Autowired
	private TownService townService;

	//동네인증 페이지
	@RequestMapping(value = "/town", method = RequestMethod.GET)
	public String townCertificationGET() {
		
		return "town_test/popup_profile_mytown";
	}
	
	//동네인증 정보 받아서 테이블에 등록
	@RequestMapping(value = "/town", method = RequestMethod.POST)
	public String townCertificationPOST() {
		
		return "town_test/test_profile";
	}
	
}
