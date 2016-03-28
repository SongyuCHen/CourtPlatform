package nju.software.courtplatform.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import nju.software.courtplatform.dao.ServerDao;
import nju.software.courtplatform.model.ServerInfo;

@Service
public class ServerService extends BaseService{
	@Autowired
	ServerDao ad;
	
	public ServerInfo getServerInfosByBh(int bh){
		return ad.getByBH(bh);
	}
	
	public List<ServerInfo> getServerInfos(){
		return ad.getServerInfo();
	}
	
	public int saveServerInfo(ServerInfo ServerInfo){
		return ad.saveServerInfo(ServerInfo);
	}
	
	
	public boolean deleteServerInfo(int bh){
		return ad.deleteServerInfo(bh);
	}
	
	public boolean reviseServerInfo(int bh,String title,String ip,String port){
		return ad.reviseServerInfo(bh,title,ip,port);
	}
}
