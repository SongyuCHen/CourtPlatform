package nju.software.courtplatform.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import nju.software.courtplatform.model.DBInfo;
import nju.software.courtplatform.model.History;
import nju.software.courtplatform.model.ServerInfo;
import nju.software.courtplatform.service.DBService;
import nju.software.courtplatform.service.ServerService;

@Controller
public class BdbController  extends BaseController{
	
	@Autowired
	DBService ss;
	
	@RequestMapping(value = "/backend/dbs")
	public ModelAndView getPage(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("backend/dbs");
		mv.addObject("servers", ss.getDBInfos());
		return mv;
	}
	
	@RequestMapping(value = "/backend/savedb")
	@ResponseBody
	public ModelAndView saveDB(@RequestParam("title") String title,@RequestParam("ip") String ip,@RequestParam("port") String port){
		ModelAndView mv = new ModelAndView();
		DBInfo si = new DBInfo();
		si.setTitle(title);
		si.setIP(ip);;
		si.setPort(port);
		mv.addObject("status",ss.saveDBInfo(si));
		//mv.addObject("data", "{'success':true,'data':[{'key':'AU','title':'Australia','code':'AU','name':'Australia','parent':'root','path':null,'childCount':7,'level':1,'isFolder':true,'isLazy':true},{'key':'US','title':'United States','code':'US','name':'United States','parent':'root','path':null,'childCount':30,'level':1,'isFolder':true,'isLazy':true}]}");
		return mv;
	}
	
	@RequestMapping(value = "/backend/reviseDB")
	@ResponseBody
	public ModelAndView reviseDB(@RequestParam("bh") int bh,@RequestParam("title") String title,@RequestParam("ip") String ip,@RequestParam("port") String port){
		ModelAndView mv = new ModelAndView();
		mv.addObject("status",ss.reviseDBInfo(bh, title, ip, port));
		return mv;
	}
	
	@RequestMapping(value = "/backend/deleteDB")
	@ResponseBody
	public ModelAndView deleteDB(@RequestParam("bh") int bh){
		ModelAndView mv = new ModelAndView();
		mv.addObject("status",ss.deleteDBInfo(bh));
		return mv;
	}
	
}
