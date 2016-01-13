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
public class SpjkController extends BaseController{
	
	@Autowired
	private MenuService ms; 
	
	@RequestMapping(value = "/spjk/index")
	public ModelAndView getPage(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/spjk/index");
		mv.addObject("menuContext", ms.getMenuContext("/spjk/index"));
		return mv;
	}
	
	@RequestMapping(value="/spjk/{c}",method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView getSubPage(@PathVariable String c,String url){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("spjk/business");
		mv.addObject("menuContext", ms.getMenuContext(url));
		return mv;
	}

}
