package nju.software.courtplatform.controller;

import nju.software.courtplatform.service.MenuService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/app")
public class AppController extends BaseController{
	
	@Autowired
	private MenuService ms; 
	
	@RequestMapping(value = "/business")
	public ModelAndView getPage(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("app/business");
		mv.addObject("menuContext", ms.getMenuContext("app/business"));
		return mv;
	}

}
