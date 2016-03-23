package nju.software.courtplatform.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import nju.software.courtplatform.service.DescriptionService;
import nju.software.courtplatform.service.MenuService;

@Controller
public class BFyjsController extends BaseController {
	
	@Autowired
	private DescriptionService ds; 
	
	
	
	@RequestMapping(value = "/backend/fyjs")
	public ModelAndView getPage(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("backend/description");
		mv.addObject("description", ds.getDescription());
		return mv;
	}
	@RequestMapping(value = "/backend/bcjs")
	@ResponseBody
	public Boolean saveDesc(String js){
		
		return ds.saveDesc(js);
	}
}
