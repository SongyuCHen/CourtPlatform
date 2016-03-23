package nju.software.courtplatform.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BfwqController  extends BaseController{
	
	@RequestMapping(value = "/backend/servers")
	public ModelAndView getPage(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("backend/servers");
		return mv;
	}
	
}
