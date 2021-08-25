package com.nshdev.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class NshDevBooksController {
	
	//메인 페이지
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void GETmainPage() {
		
		log.warn("메인 페이지로 이동합니다.");
		
	}
	
}
