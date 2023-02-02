package com.gft.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("ranking")
public class RankingController {
	

	 @RequestMapping
	    public ModelAndView pontuacao() throws Exception{
	        ModelAndView mv = new ModelAndView("ranking/pontuacao.html");
	        return mv;
	    }
}
