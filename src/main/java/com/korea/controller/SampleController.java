package com.korea.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.korea.sample.SampleDTO;
import com.korea.sample.SampleDTOList;

@RequestMapping("/sample/*")
@Controller
public class SampleController {

	private static final Logger logger = LoggerFactory.getLogger(SampleController.class);

	
	
	
	// @GetMapping("/sample1")
	@RequestMapping(value = "/sample1", method = { RequestMethod.GET, RequestMethod.POST })
	public String sample1(SampleDTO dto) {

		logger.info("name : " + dto.getName());
		logger.info("age : " + dto.getAge());

		return "sample";

	}

	@RequestMapping(value = "/sample2", method = { RequestMethod.GET, RequestMethod.POST })
	public String sample2(@RequestParam("name") String name) {

		logger.info("name : " + name);

		return "sample";
	}

	@RequestMapping(value = "/sample3", method = { RequestMethod.GET, RequestMethod.POST })
	public String sample3(@RequestParam("arrays") ArrayList<String> arr) {

		for (int i = 0; i < arr.size(); i++) {

			logger.info("arr  [" + i + "] : " + arr.get(i));
		}

		return "sample";
	}

	@RequestMapping(value = "/sample4", method = { RequestMethod.GET, RequestMethod.POST })
	public String sample4(@RequestParam("arrays") String [] arr) {

		for (int i = 0; i < arr.length; i++) {

			logger.info("arr  [" + i + "] : " + arr[i]);
		}

		return "sample";
	}
	
	@RequestMapping(value = "/sample5", method = { RequestMethod.GET, RequestMethod.POST })
	public String sample5(SampleDTOList list) {
		
		for (int i = 0; i < list.size(); i++) {
			
			SampleDTO dto = list.get(i);
			
			logger.info("name : " + dto.getName());
			
		}
		
		
		return "sample";
	}
	
	@RequestMapping(value = "/sample6", method = { RequestMethod.GET, RequestMethod.POST })
	public String sample6(Locale locale, Model model, @RequestParam("page") int page) {
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate ); // 화면에 고대로 넘겨주는 역할
		model.addAttribute("page" , page);  
		
		logger.info("page : " + page);
		
		
		return "sample";
	}
	
	@RequestMapping(value = "/sample7", method = { RequestMethod.GET, RequestMethod.POST })
	public String sample7(Locale locale, Model model, @ModelAttribute("page") int page) {
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate );
		
		return "sample";
	}
	
	@RequestMapping(value = "/sample8", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody SampleDTO sample8() {
		
		SampleDTO dto = new SampleDTO();
		dto.setName("홍길동");
		dto.setAge(20);
		
		return dto;
	}
	
	@RequestMapping(value = "/exec", method = { RequestMethod.GET, RequestMethod.POST })
	public void exec() {
		
	}
	
} // end
