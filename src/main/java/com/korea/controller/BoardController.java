package com.korea.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.korea.service.BoardService;
import com.korea.vo.BoardVO;

import lombok.Setter;

@RequestMapping("/board/*")
@Controller
public class BoardController {

	@Setter(onMethod_ = @Autowired)
	private BoardService service;
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@RequestMapping(value = "/list", method = {RequestMethod.GET, RequestMethod.POST})
	public String list(Model model, @RequestParam Map<String, String> param) {
		logger.info("list");
		
		String pageView = param.get("pageView");
		
		if(pageView == null || "".equals(pageView)) {
			pageView = "list";
		}
		
		String keyword = param.get("keyword");
		String gubun = param.get("gubun");
		logger.info("keyword : " + keyword);
		logger.info("gubun : " + gubun);
		
		model.addAttribute("list", service.getList(param));
		
		return "/board/" + pageView;
	}
	
	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("bno") Long bno, Model model) {
		
		model.addAttribute("board", service.get(bno));
		model.addAttribute("chat", service.getReplyList(bno));
		
	}
	
	@PostMapping("/modify")
	public String modify(BoardVO board, RedirectAttributes rt) {
		logger.info("modify");
		
		if(service.modify(board)) {
			rt.addFlashAttribute("result", "success");
			
		}
		
		return "redirect:/board/list";
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("bno") Long bno, RedirectAttributes rt) {
		logger.info("remove");
		
		if(service.remove(bno)) {
			rt.addFlashAttribute("result", "success");
		}
		
		return "redirect:/board/list";
	}
	
	@GetMapping("/register")
	public void register() {
		
	}
	
	@PostMapping("/register")
	public String register(BoardVO board, RedirectAttributes rt) {
		logger.info("register");
		
		if(service.register(board)) {
			rt.addFlashAttribute("result", "success");
		}
		
		return "redirect:/board/list";
	}
	
	@PostMapping("/remove2")
	public ModelAndView remove2(@RequestParam("bno") Long bno, ModelAndView mav) {
		
		if(service.remove(bno)) {
			mav.addObject("result", "success");
			mav.setViewName("/board/ajaxResult");
		}
		
		return mav;
	}
	
	@PostMapping("/modify2")
	public ModelAndView modify2(BoardVO board, ModelAndView mav) {
		
		if(service.modify(board)) {
			mav.addObject("result", "success");
			mav.setViewName("/board/ajaxResult");
		}
		
		return mav;
	}
	
	@PostMapping("/register2")
	public ModelAndView register2(BoardVO board, ModelAndView mav) {
		
		if(service.register(board)) {
			mav.addObject("result", "success");
			mav.setViewName("/board/ajaxResult");
		}
		
		return mav;
	}
	
	
}
