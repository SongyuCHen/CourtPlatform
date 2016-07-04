package nju.software.courtplatform.controller;

import nju.software.courtplatform.model.TModule;
import nju.software.courtplatform.service.MenuService;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AppController extends BaseController{
	
	@Autowired
	private MenuService ms; 
	
	@RequestMapping(value = "/app/business")
	public ModelAndView getPage(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("app/business");
		mv.addObject("menuContext", ms.getMenuContext("app/business"));
		return mv;
	}
	
	@RequestMapping(value="/app/{c}",method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView getSubPage(@PathVariable String c,String url){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("app/business");
		mv.addObject("menuContext", ms.getMenuContext(url));
		return mv;
	}
	
//	@RequestMapping(value="/app/showsub",method=RequestMethod.GET)
//	@ResponseBody
//	public String getSubsys(String bh) throws FileNotFoundException, IOException{
//		TModule tModule = ms.geTModuleByBh(Integer.parseInt(bh));
//		String name = tModule.getName();
//		Properties properties = new Properties();
//		String path = Thread.currentThread().getContextClassLoader().getResource("subsys.properties").getPath();
//		System.err.println(path);
//		properties.load(new FileInputStream(path));
//		System.out.println(properties.toString());
//		String url = properties.getProperty(name);
//		System.out.println(url+"ssss"+name);
//		return url;
//	}

}
