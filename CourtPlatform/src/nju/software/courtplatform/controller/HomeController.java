package nju.software.courtplatform.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/index")
public class HomeController {
	
	@RequestMapping(value = "")
	public ModelAndView getPage(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index");
		return mv;
	}
}
