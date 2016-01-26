package nju.software.courtplatform.controller;

import nju.software.courtplatform.service.MachineService;
import nju.software.courtplatform.service.MenuService;

import org.hyperic.sigar.SigarException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SjzxController extends BaseController{
	
	@Autowired
	private MenuService ms;
	@Autowired
	private MachineService mas;
	
	@RequestMapping(value = "/sjzx/index")
	public ModelAndView getPage(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/sjzx/index");
		mv.addObject("menuContext", ms.getMenuContext("/sjzx/index"));
		return mv;
	}
	
	@RequestMapping(value="/sjzx/business",method=RequestMethod.GET)
	public ModelAndView getSubPage(String url) throws SigarException{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("sjzx/jcjgck");
		mv.addObject("menuContext", ms.getMenuContext("/sjzx/index"));
		//mv.addObject("machine",mas.getMechineState("localhost"));
		return mv;
	}
	@RequestMapping(value=" /sjzx/sjbf/sjccjk",method=RequestMethod.GET)
	public ModelAndView getSJCCJK(String url) throws SigarException{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("sjzx/sjccjk");
		mv.addObject("menuContext", ms.getMenuContext("/sjzx/index"));
		//mv.addObject("machine",mas.getMechineState("localhost"));
		return mv;
	}
	
	@RequestMapping(value=" /sjzx/sjbf/fwqyxjk",method=RequestMethod.GET)
	public ModelAndView getFWQYXJK(String url) throws SigarException{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("sjzx/fwqyxjk");
		mv.addObject("menuContext", ms.getMenuContext("/sjzx/index"));
		//mv.addObject("machine",mas.getMechineState("localhost"));
		return mv;
	}
	 
	@RequestMapping(value=" /sjzx/sjbf/sjrbjk",method=RequestMethod.GET)
	public ModelAndView getSJRBJK(String url) throws SigarException{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("sjzx/sjrbjk");
		mv.addObject("menuContext", ms.getMenuContext("/sjzx/index"));
		//mv.addObject("machine",mas.getMechineState("localhost"));
		return mv;
	}
}
