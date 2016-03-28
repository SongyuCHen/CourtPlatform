package nju.software.courtplatform.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import nju.software.courtplatform.model.History;
import nju.software.courtplatform.model.ServerInfo;
import nju.software.courtplatform.service.ServerService;

@Controller
public class BfwqController  extends BaseController{
	
	@Autowired
	ServerService ss;
	
	@RequestMapping(value = "/backend/servers")
	public ModelAndView getPage(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("backend/servers");
		mv.addObject("servers", ss.getServerInfos());
		return mv;
	}
	
	@RequestMapping(value = "/backend/saveserver")
	@ResponseBody
	public ModelAndView saveHistory(@RequestParam("title") String title,@RequestParam("ip") String ip,@RequestParam("port") String port){
		ModelAndView mv = new ModelAndView();
		ServerInfo si = new ServerInfo();
		si.setTitle(title);
		si.setIP(ip);;
		si.setPort(port);
		mv.addObject("status",ss.saveServerInfo(si));
		//mv.addObject("data", "{'success':true,'data':[{'key':'AU','title':'Australia','code':'AU','name':'Australia','parent':'root','path':null,'childCount':7,'level':1,'isFolder':true,'isLazy':true},{'key':'US','title':'United States','code':'US','name':'United States','parent':'root','path':null,'childCount':30,'level':1,'isFolder':true,'isLazy':true}]}");
		return mv;
	}
	
	@RequestMapping(value = "/backend/reviseserver")
	@ResponseBody
	public ModelAndView reviseHistory(@RequestParam("bh") int bh,@RequestParam("title") String title,@RequestParam("ip") String ip,@RequestParam("port") String port){
		ModelAndView mv = new ModelAndView();
		mv.addObject("status",ss.reviseServerInfo(bh, title, ip, port));
		return mv;
	}
	
	@RequestMapping(value = "/backend/deleteserver")
	@ResponseBody
	public ModelAndView deleteHistory(@RequestParam("bh") int bh){
		ModelAndView mv = new ModelAndView();
		mv.addObject("status",ss.deleteServerInfo(bh));
		return mv;
	}
	
}
