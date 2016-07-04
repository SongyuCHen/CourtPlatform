package nju.software.courtplatform.controller;

import nju.software.courtplatform.service.DBService;
import nju.software.courtplatform.service.MachineService;
import nju.software.courtplatform.service.MenuService;
import nju.software.courtplatform.service.ServerService;

import java.sql.SQLException;

import org.apache.shiro.web.tags.PrincipalTag;
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
	@Autowired
	private ServerService ss;
	@Autowired
	private DBService ds;
	
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
		return mv;
	}
	@RequestMapping(value=" /sjzx/sjbf/sjccjk",method=RequestMethod.GET)
	public ModelAndView getSJCCJK(String url) throws SigarException{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("sjzx/sjccjk");
		mv.addObject("dbs",ds.getDBInfos());
		mv.addObject("menuContext", ms.getMenuContext("/sjzx/index"));
		return mv;
	}
	
	@RequestMapping(value=" /sjzx/sjbf/fwqyxjk",method=RequestMethod.GET)
	public ModelAndView getFWQYXJK(String url) throws SigarException{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("sjzx/fwqyxjk");
		mv.addObject("menuContext", ms.getMenuContext("/sjzx/index"));
		mv.addObject("servers",ss.getServerInfos());
		//mv.addObject("machine",mas.getMechineState("localhost"));
		return mv;
	}
	
	@RequestMapping(value=" /sjzx/fwqdata",method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView getFWQYXJKData(int bh) throws SigarException{
		ModelAndView mv = new ModelAndView();
		mv.addObject("machine",mas.getMechineState(bh));
		return mv;
	}
	
	@RequestMapping(value=" /sjzx/dbdata",method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView getDBData(String ip,String port) throws SigarException, InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException{
		ModelAndView mv = new ModelAndView();
		String re = ds.getDBState(ip, port);
		String[] reStrings = re.split(",");
		mv.addObject("mem_used",reStrings[0]);
		mv.addObject("mem_free",reStrings[1]);
		mv.addObject("mem_rate",reStrings[2]);
		mv.addObject("log_used",reStrings[3]);
		mv.addObject("log_free",reStrings[4]);
		mv.addObject("log_rate",reStrings[5]);
		return mv;
	}
	 
	@RequestMapping(value=" /sjzx/sjbf/sjrbjk",method=RequestMethod.GET)
	public ModelAndView getSJRBJK(String url) throws SigarException{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("sjzx/sjrbjk");
		mv.addObject("menuContext", ms.getMenuContext("/sjzx/index"));
		return mv;
	}
	
	@RequestMapping(value=" /sjzx/sjtsfx",method=RequestMethod.GET)
	public String getSJTSFX() throws SigarException{
		String url = "http://155.36.0.112:8080/Dingxi/";
		return "redirect:"+url;
	}
	@RequestMapping(value=" /sjzx/sjbs",method=RequestMethod.GET)
	public String getSJBS() throws SigarException{
		String url = "http://192.2.0.98/sjgl/sjjzglptsy/jrdt/jrdt.html";
		return "redirect:"+url;
	}
}
