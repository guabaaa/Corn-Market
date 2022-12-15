package com.corn.market.account.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MailApiController {
	
	@Autowired
	private MailSendService mailSendService;
	
	@ResponseBody
	@RequestMapping(value = "/account/mail-check", method = RequestMethod.GET)
	public String mailCheck(String email) {
		System.out.println(email);
		String code = mailSendService.sendMail(email);
		return code;
	}

}
