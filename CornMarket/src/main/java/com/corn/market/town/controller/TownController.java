package com.corn.market.town.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.corn.market.town.domain.TownCertification;
import com.corn.market.town.domain.TownInfo;
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
	public String townCertificationPOST(@RequestBody TownInfo townInfo, HttpSession session) {
		System.out.println(townInfo);
		session.setAttribute("id", "aa11"); //세션 테스트
		//인터셉터가 true (아이디가 세션이 있음)
		String id = (String) session.getAttribute("id");
		String town_code = townService.getTownCode(townInfo);
		TownCertification town = new TownCertification(id, town_code, townInfo.getLatitude(), townInfo.getLongitude());
		townService.deleteAndInputAddress(town);
		return "redirect:/town";
	}
	
}
