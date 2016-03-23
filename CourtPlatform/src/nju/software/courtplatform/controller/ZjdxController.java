package nju.software.courtplatform.controller;

import nju.software.courtplatform.service.AwardService;
import nju.software.courtplatform.service.DescriptionService;
import nju.software.courtplatform.service.HistoryService;
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
	private DescriptionService ds; 
	@Autowired
	private MenuService ms; 
	@Autowired
	private HistoryService hs; 
	@Autowired
	private AwardService as;
	
	@RequestMapping(value = "/zjdx/index")
	public ModelAndView getPage(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/zjdx/index");
		mv.addObject("menuContext", ms.getMenuContext("/zjdx/index"));
		return mv;
	}
	
	@RequestMapping(value="/zjdx/business",method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView getSubPage(String url){
		ModelAndView mv = new ModelAndView();
		mv.setViewName(url);
		mv.addObject("menuContext", ms.getMenuContext(url));
		return mv;
	}
	
	@RequestMapping(value="/zjdx/fyjs/fyjj",method=RequestMethod.GET)
	public ModelAndView getDescription(String url){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("zjdx/fyjs");
		mv.addObject("description", ds.getDescription());
		mv.addObject("menuContext", ms.getMenuContext("/zjdx/index"));
		return mv;
	}
	@RequestMapping(value="/zjdx/ryzt/yscl",method=RequestMethod.GET)
	public ModelAndView getYSCL(String url){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("zjdx/yscl");
		mv.addObject("menuContext", ms.getMenuContext("/zjdx/index"));
		mv.addObject("historys",hs.getHistory2());
		return mv;
	}
	@RequestMapping(value="/zjdx/ryzt/hjry",method=RequestMethod.GET)
	public ModelAndView getHJRY(String url){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("zjdx/hjry");
		mv.addObject("menuContext", ms.getMenuContext("/zjdx/index"));
		mv.addObject("awards", as.getAwards());
		return mv;
	}

}
