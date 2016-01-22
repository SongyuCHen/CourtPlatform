package nju.software.courtplatform.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BSjrbController  extends BaseController{
	
	@RequestMapping(value = "/backend/sjrb")
	public ModelAndView getPage(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("backend/sjrb");
		return mv;
	}
	
}
