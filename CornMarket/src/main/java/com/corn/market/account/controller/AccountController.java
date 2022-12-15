package com.corn.market.account.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.corn.market.account.domain.AccountId;
import com.corn.market.account.domain.SearchIdMail;
import com.corn.market.account.domain.SearchIdPhone;
import com.corn.market.account.service.AccountService;

@Controller
public class AccountController {
	
	@Autowired
	AccountService service;
	
	//아이디 찾기 페이지로 이동
	@RequestMapping(value = "/account/id", method = RequestMethod.GET)
	public String searchIdGET() {
		return "account/searchid";
	}
	
	//비밀번호 찾기 페이지 이동
	@RequestMapping(value = "/account/pw", method = RequestMethod.GET)
	public String searchPwGET() {
		return "account/searchpw";
	}
	
	//아이디 찾기 - 휴대폰번호로
	@RequestMapping(value = "/account/id/phone", method = RequestMethod.POST)
	public String searchIdPhone(SearchIdPhone phone, Model model) {
		System.out.println(phone); //
		AccountId accountId = service.searchIdPhone(phone);
		model.addAttribute("accountId",accountId);
		return "account/id_popup";
	}
	
	//아이디 찾기 - 이메일로
	@RequestMapping(value = "/account/id/mail", method = RequestMethod.POST)
	public String searchIdMail(SearchIdMail mail, Model model) {
		System.out.println(mail);
		AccountId accountId = service.searchIdMail(mail);
		model.addAttribute("accountId",accountId);
		return "account/id_popup";
	}
	
	
	
}
