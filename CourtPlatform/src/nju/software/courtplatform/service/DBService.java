package nju.software.courtplatform.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import nju.software.courtplatform.dao.DBDao;
import nju.software.courtplatform.dao.ServerDao;
import nju.software.courtplatform.model.DBInfo;
import nju.software.courtplatform.model.ServerInfo;

@Service
public class DBService extends BaseService{
	@Autowired
	DBDao ad;
	
	public DBInfo getDBInfosByBh(int bh){
		return ad.getByBH(bh);
	}
	
	public List<DBInfo> getDBInfos(){
		return ad.getDBInfo();
	}
	
	public int saveDBInfo(DBInfo dbInfo){
		return ad.saveDBInfo(dbInfo);
	}
	
	
	public boolean deleteDBInfo(int bh){
		return ad.deleteDBInfo(bh);
	}
	
	public boolean reviseDBInfo(int bh,String title,String ip,String port){
		return ad.reviseDBInfo(bh,title,ip,port);
	}
	
	public String getDBState(String ip,String port) throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException{
	    Class.forName("net.sourceforge.jtds.jdbc.Driver").newInstance();//通过jtds方式连接  
	    String url ="jdbc:jtds:sybase://"+ip+":"+port+"/";//通过jtds方式连接，test为数据库名  
	    Connection conn= DriverManager.getConnection(url, "sa","");  
	    Statement stmt=conn.createStatement(); 
	    Statement stmt1=conn.createStatement(); 
	    String sql="sp_helpdb JUDGE";  
	    ResultSet rs;  
	    String result = "";
	    PreparedStatement cs = conn.prepareStatement(sql);
	    cs.getMoreResults();
	    rs = cs.executeQuery();
//	    while(rs.next())  
//	    {  
//	    	System.out.println(rs.getString(1)+"-"+rs.getString(2)+"-"+rs.getString(3));
//            System.out.println("->");   
//	    }  
	    if (cs.getMoreResults()) {
			rs = cs.getResultSet();
		}
	    double mem_total = 0;
	    double mem_used = 0;
	    double log_total = 0;
	    double log_used = 0;
	    while(rs.next())  
	    {  
	    	String dev = rs.getString(1);
	    	String total = rs.getString(2).trim().replace("MB", "");
	    	String used = rs.getString(5).trim();
	    	System.out.println(dev+":"+total+"/"+used);
	    	double total1 = Double.parseDouble(total);
	    	double used1 = Double.parseDouble(used)/1024;
	    	if(dev.contains("log")){
	    		log_total+=total1;
	    		log_used+=used1;
	    	}else{
	    		mem_total+=total1;
	    		mem_used+=used1;
	    	}
//	    	result += rs.getString(2)+rs.getString(5)+"/";
	    }
	    double mem_used_rate = 0;
	    double log_used_rate = 0;
	    if(mem_total != 0 && log_total != 0){
	    	mem_used_rate = 1-mem_used/mem_total;
	 	    log_used_rate = 1-log_used/log_total;
	    }	   
		return String.format("%.2f", (mem_total-mem_used))+","+String.format("%.2f", mem_used)+","+String.format("%.2f", mem_used_rate*100)+","+String.format("%.2f", (log_total-log_used))+","+String.format("%.2f", log_used)+","+String.format("%.2f", log_used_rate*100);
	}
	
}
