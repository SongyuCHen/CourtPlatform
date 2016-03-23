package nju.software.courtplatform.service;

import nju.software.courtplatform.dao.HistoryDao;
import nju.software.courtplatform.model.History;
import nju.software.courtplatform.model.TModule;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HistoryService extends BaseService{

	
	@Autowired
	private HistoryDao md;	
	
	public int saveHistory(History history){
		return md.saveHistory(history);
	}
	
	public List<History> getHistory(){
		return md.getHistory();
	}
	public List<History> getHistory2(){
		List<History> histories = md.getHistory();
		for (int i = 0; i < histories.size(); i++) {
			History h = histories.get(i);
			String time = h.getTime();
			time = time.substring(0, 10);
			String[] tmp = time.split("-");
			h.setTime(tmp[2]+"/"+tmp[1]+"/"+tmp[0]);			
		}
		return histories;
	}
	
	public boolean reviseURL(String name,int bh){		
		return md.reviseURL(name,bh);
	}
	
	public boolean deleteHistory(int bh){
		return md.deleteHistory(bh);
	}
	
	public boolean reviseHistory(int bh,String title,String time,String content){
		return md.reviseHistory(bh,title,time,content);
	}
}
