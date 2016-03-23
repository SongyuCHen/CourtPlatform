package nju.software.courtplatform.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import nju.software.courtplatform.dao.AwardDao;
import nju.software.courtplatform.model.Award;

@Service
public class AwardService extends BaseService{
	@Autowired
	AwardDao ad;
	
	public Award getAwardsByBh(int bh){
		return ad.getByBH(bh);
	}
	
	public List<Award> getAwards(){
		return ad.getAward();
	}
	
	public int saveAward(Award award){
		return ad.saveAward(award);
	}
	
	public boolean reviseURL(String name,int bh){		
		return ad.reviseURL(name,bh);
	}
	
	public boolean deleteAward(int bh){
		return ad.deleteAward(bh);
	}
	
	public boolean reviseAward(int bh,String title,String time){
		return ad.reviseAward(bh,title,time);
	}
}
