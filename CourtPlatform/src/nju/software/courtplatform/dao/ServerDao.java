package nju.software.courtplatform.dao;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import nju.software.courtplatform.model.Award;
import nju.software.courtplatform.model.History;
import nju.software.courtplatform.model.ServerInfo;

@Repository
public class ServerDao extends BaseDao{
	public ServerInfo getByBH(int bh){
		return (ServerInfo)sf.getCurrentSession().get(ServerInfo.class, bh);
	}
	
	@SuppressWarnings("unchecked")
	public List<ServerInfo> getServerInfo(){
		List<ServerInfo> lHistories = new ArrayList<ServerInfo>();
		Session session = sf.getCurrentSession();
		Query qu = session.createQuery("from ServerInfo h");
		List list = qu.list();
		Iterator itr = list.iterator(); 
		while(itr.hasNext()){
			lHistories.add((ServerInfo)itr.next());
		}		
		return lHistories;
	}
	
	public int saveServerInfo(ServerInfo serverInfo){
		Session session = sf.getCurrentSession();
		Query query = session.createQuery("select max(t.bh) from ServerInfo t"); 
		Integer bh = (Integer) query.uniqueResult();
		if(bh == null){
			bh = 0;
		}
		serverInfo.setBh(bh+1);
		int id = (Integer)session.save(serverInfo);
		return id;
	}

	
	public boolean deleteServerInfo(int bh){
		Session session = sf.getCurrentSession();
		ServerInfo tm = getByBH(bh);
		try {
			session.delete(tm);
			return true;
		} catch (HibernateException e) {
			// TODO: handle exception
			return false;
		}
	}
	public boolean reviseServerInfo(int bh,String title,String IP,String port){
		Session session = sf.getCurrentSession();
		Query query = session.createQuery("update ServerInfo t set t.title = ?,t.IP = ?,t.port = ? where bh = ?"); 
		query.setParameter(0, title);
		query.setParameter(1, IP);
		query.setParameter(2, port);
		query.setParameter(3, bh);
		return query.executeUpdate()==1;
	}
}
