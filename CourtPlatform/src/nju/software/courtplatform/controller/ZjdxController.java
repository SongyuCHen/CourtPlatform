package nju.software.courtplatform.controller;

import nju.software.courtplatform.service.MenuService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ZjdxController extends BaseController{
	
	@Autowired
	private MenuService ms; 
	
	@RequestMapping(value = "/zjdx/index")
	public ModelAndView getPage(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/zjdx/index");
		mv.addObject("menuContext", ms.getMenuContext("/zjdx/index"));
		return mv;
	}
	
	@RequestMapping(value="/zjdx/business",method=RequestMethod.POST)
	public ModelAndView getSubPage(String url){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("zjdx/fyjs");
		mv.addObject("menuContext", ms.getMenuContext(url));
		return mv;
	}

}
