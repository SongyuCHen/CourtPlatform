package nju.software.courtplatform.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BFyjsController extends BaseController {
	@RequestMapping(value = "/backend/fyjs")
	public ModelAndView getPage(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("backend/description");
		return mv;
	}
}
