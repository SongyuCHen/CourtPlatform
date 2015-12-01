package nju.software.courtplatform.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/app")
public class AppController extends BaseController{
	@RequestMapping(value = "/business")
	public ModelAndView getPage(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("app/business");
		return mv;
	}

}
