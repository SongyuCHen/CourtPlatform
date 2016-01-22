package nju.software.courtplatform.controller;


import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import nju.software.courtplatform.model.TModule;
import nju.software.courtplatform.service.MenuService;

@Controller
public class BIndexController extends BaseController{
	
	
	@Autowired
	private MenuService ms;
	
	@RequestMapping(value = "/backend/index")
	public ModelAndView getPage(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("backend/index");
		return mv;
	}
	
	@RequestMapping(value = "/backend/gettree")
	@ResponseBody
	public ModelAndView getTree(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("backend/index");
		mv.addObject("data",ms.getMenuContext());
		//mv.addObject("data", "{'success':true,'data':[{'key':'AU','title':'Australia','code':'AU','name':'Australia','parent':'root','path':null,'childCount':7,'level':1,'isFolder':true,'isLazy':true},{'key':'US','title':'United States','code':'US','name':'United States','parent':'root','path':null,'childCount':30,'level':1,'isFolder':true,'isLazy':true}]}");
		return mv;
	}
	
	@RequestMapping(value = "/backend/reviseinfo")
	@ResponseBody
	public ModelAndView reviseInfo(@RequestParam("bh") int bh,@RequestParam("name") String name,@RequestParam("url") String url){
		ModelAndView mv = new ModelAndView();
		System.err.println("bh:"+bh+";name:"+name+";url:"+url);
		mv.addObject("status",ms.reviseInfo(bh,name,url));
		//mv.addObject("data", "{'success':true,'data':[{'key':'AU','title':'Australia','code':'AU','name':'Australia','parent':'root','path':null,'childCount':7,'level':1,'isFolder':true,'isLazy':true},{'key':'US','title':'United States','code':'US','name':'United States','parent':'root','path':null,'childCount':30,'level':1,'isFolder':true,'isLazy':true}]}");
		return mv;
	}
	
	
	@RequestMapping(value = "/uploadApk")
	@ResponseBody
	public Object uploadApk(
			@RequestParam(value = "upload1") MultipartFile upload1,@RequestParam("bh") int bh,
			HttpServletRequest request, HttpServletResponse response) {
		Map<String,Object> resMap = new HashMap<String,Object>();
		System.err.println("bh:"+bh);
		String name = upload1.getOriginalFilename();
		if (upload1 != null) {
			//获取保存的路径，
			String realPath = request.getSession().getServletContext()
					.getRealPath("/images/icon");
			if (upload1.isEmpty()) {
				// 未选择文件
				resMap.put("status", "empty");
			} else{
				// 文件原名称
				String originFileName = upload1.getOriginalFilename();
				try {
					//这里使用Apache的FileUtils方法来进行保存
					FileUtils.copyInputStreamToFile(upload1.getInputStream(),
							new File(realPath, originFileName));
					if(ms.reviseURL(name,bh)){
						resMap.put("status","ok");
					}else{
						resMap.put("status","save_error");
					}
				} catch (IOException e) {
					System.out.println("文件上传失败");
					resMap.put("status", "exception");
					e.printStackTrace();
				}
			}

		}
		return resMap;
	}
	
	
	
	@RequestMapping(value = "/uploadApkNew")
	@ResponseBody
	public Object uploadApkNew(
			@RequestParam(value = "uploadNew") MultipartFile upload1,
			HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		Map<String,Object> resMap = new HashMap<String,Object>();
		String filename = upload1.getOriginalFilename();
		String name = new String(request.getParameter("n").getBytes("iso8859-1"),"utf-8");
		String url = request.getParameter("u");
		int parent = Integer.parseInt(request.getParameter("p"));
		if (upload1 != null) {
			//获取保存的路径，
			String realPath = request.getSession().getServletContext()
					.getRealPath("/images/icon");
			if (upload1.isEmpty()) {
				// 未选择文件
				resMap.put("status", "empty");
			} else{
				// 文件原名称
				String originFileName = upload1.getOriginalFilename();
				try {
					//这里使用Apache的FileUtils方法来进行保存
					FileUtils.copyInputStreamToFile(upload1.getInputStream(),
							new File(realPath, originFileName));
					TModule tm = new TModule();
					tm.setC_img(filename);
					tm.setC_url(url);
					tm.setLevels(3);
					tm.setName(name);
					tm.setParent(parent);
					int xssx = ms.getMaxXssx(parent)+1;
					tm.setXssx(xssx);
					if(ms.saveTModule(tm)){
						resMap.put("status", "ok");
					}else{
						resMap.put("status", "fail");
					}
				} catch (IOException e) {
					System.out.println("文件上传失败");
					resMap.put("status", "exception");
					e.printStackTrace();
				}
			}
		}
		return resMap;
	}
	
	
	@RequestMapping(value = "/backend/savewithoutimg")
	@ResponseBody
	public ModelAndView saveWithoutImg(@RequestParam("parent") int parent,@RequestParam("name") String name,@RequestParam("url") String url){
		ModelAndView mv = new ModelAndView();
		System.err.println("parent:"+parent+";name:"+name+";url:"+url);
		TModule tm = new TModule();
		tm.setC_url(url);
		tm.setLevels(2);
		tm.setName(name);
		tm.setParent(parent);
		int xssx = ms.getMaxXssx(parent)+1;
		tm.setXssx(xssx);
		mv.addObject("status",ms.saveTModule(tm));
		//mv.addObject("data", "{'success':true,'data':[{'key':'AU','title':'Australia','code':'AU','name':'Australia','parent':'root','path':null,'childCount':7,'level':1,'isFolder':true,'isLazy':true},{'key':'US','title':'United States','code':'US','name':'United States','parent':'root','path':null,'childCount':30,'level':1,'isFolder':true,'isLazy':true}]}");
		return mv;
	}
	
	
	@RequestMapping(value = "/backend/removeSub")
	@ResponseBody
	public ModelAndView removeSub(@RequestParam("bh") int bh){
		ModelAndView mv = new ModelAndView();
		System.err.println("bh:"+bh);
		mv.addObject("status",ms.removeSub(bh));
		//mv.addObject("data", "{'success':true,'data':[{'key':'AU','title':'Australia','code':'AU','name':'Australia','parent':'root','path':null,'childCount':7,'level':1,'isFolder':true,'isLazy':true},{'key':'US','title':'United States','code':'US','name':'United States','parent':'root','path':null,'childCount':30,'level':1,'isFolder':true,'isLazy':true}]}");
		return mv;
	}
	
}
