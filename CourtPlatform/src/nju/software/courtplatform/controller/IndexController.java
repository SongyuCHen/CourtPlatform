package nju.software.courtplatform.controller;


import javax.servlet.http.HttpSession;

import org.aspectj.weaver.ast.Var;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class IndexController extends BaseController{
	
	
	@RequestMapping(value="/index/savewidth",method=RequestMethod.POST)
	@ResponseBody
	public String getSubPage(int width,HttpSession httpSession){
		httpSession.setAttribute("width", width);
		int per_page = (int)((width*0.8-324)/200);
		httpSession.setAttribute("per_page", per_page);
		System.err.println("per_page:"+per_page);
		return "success";
	}

}
