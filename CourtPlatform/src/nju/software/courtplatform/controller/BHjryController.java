package nju.software.courtplatform.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import nju.software.courtplatform.model.Award;
import nju.software.courtplatform.service.AwardService;

@Controller
public class BHjryController extends BaseController{
	
	@Autowired
	AwardService as;
		
	@RequestMapping(value = "/backend/hjry")
	public ModelAndView getPage(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("backend/awards");
		mv.addObject("awards",as.getAwards());
		return mv;
	}
	
	
	@RequestMapping(value = "/backend/saveaward")
	@ResponseBody
	public ModelAndView saveAward(@RequestParam("title") String title,@RequestParam("time") String time){
		ModelAndView mv = new ModelAndView();
		Award award = new Award();
		award.setTitle(title);
		award.setTime(time);
		mv.addObject("status",as.saveAward(award));
		//mv.addObject("data", "{'success':true,'data':[{'key':'AU','title':'Australia','code':'AU','name':'Australia','parent':'root','path':null,'childCount':7,'level':1,'isFolder':true,'isLazy':true},{'key':'US','title':'United States','code':'US','name':'United States','parent':'root','path':null,'childCount':30,'level':1,'isFolder':true,'isLazy':true}]}");
		return mv;
	}
	
	
	@RequestMapping(value = "/backend/uploadaward")
	@ResponseBody
	public Object uploadAward(
			@RequestParam(value = "uploadNew") MultipartFile upload1,@RequestParam("bh") int bh,
			HttpServletRequest request, HttpServletResponse response) {
		Map<String,Object> resMap = new HashMap<String,Object>();
		System.err.println("bh:"+bh);
		String name = upload1.getOriginalFilename();
		if (upload1 != null) {
			//获取保存的路径，
			String realPath = request.getSession().getServletContext()
					.getRealPath("/images/award");
			if (upload1.isEmpty()) {
				// 未选择文件
				resMap.put("status", "empty");
			} else{
				// 文件原名称
				//String originFileName = upload1.getOriginalFilename();
				String originFileName = UUID.randomUUID().toString()+ ".jpg";
				try {
					//这里使用Apache的FileUtils方法来进行保存
					FileUtils.copyInputStreamToFile(upload1.getInputStream(),
							new File(realPath, originFileName));
					if(as.reviseURL(originFileName,bh)){
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
	
	
	@RequestMapping(value = "/backend/deleteaward")
	@ResponseBody
	public ModelAndView deleteAward(@RequestParam("bh") int bh){
		ModelAndView mv = new ModelAndView();
		mv.addObject("status",as.deleteAward(bh));
		return mv;
	}
	
	@RequestMapping(value = "/backend/reviseaward")
	@ResponseBody
	public ModelAndView reviseHistory(@RequestParam("bh") int bh,@RequestParam("title") String title,@RequestParam("time") String time){
		ModelAndView mv = new ModelAndView();
		mv.addObject("status",as.reviseAward(bh,title,time));
		return mv;
	}
	
	@RequestMapping(value = "/backend/uploadaward2")
	@ResponseBody
	public Object uploadAward2(
			@RequestParam(value = "uploadRevise") MultipartFile upload1,@RequestParam("bh") int bh,
			HttpServletRequest request, HttpServletResponse response) {
		Map<String,Object> resMap = new HashMap<String,Object>();
		System.err.println("bh:"+bh);
		String name = upload1.getOriginalFilename();
		if (upload1 != null) {
			//获取保存的路径，
			String realPath = request.getSession().getServletContext()
					.getRealPath("/images/award");
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
					if(as.reviseURL(name,bh)){
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
	
}
