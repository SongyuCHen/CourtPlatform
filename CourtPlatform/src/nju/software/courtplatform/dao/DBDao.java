package nju.software.courtplatform.dao;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import nju.software.courtplatform.model.Award;
import nju.software.courtplatform.model.DBInfo;
import nju.software.courtplatform.model.History;
import nju.software.courtplatform.model.ServerInfo;

@Repository
public class DBDao extends BaseDao{
	public DBInfo getByBH(int bh){
		return (DBInfo)sf.getCurrentSession().get(DBInfo.class, bh);
	}
	
	@SuppressWarnings("unchecked")
	public List<DBInfo> getDBInfo(){
		List<DBInfo> lHistories = new ArrayList<DBInfo>();
		Session session = sf.getCurrentSession();
		Query qu = session.createQuery("from DBInfo h");
		List list = qu.list();
		Iterator itr = list.iterator(); 
		while(itr.hasNext()){
			lHistories.add((DBInfo)itr.next());
		}		
		return lHistories;
	}
	
	public int saveDBInfo(DBInfo serverInfo){
		Session session = sf.getCurrentSession();
		Query query = session.createQuery("select max(t.bh) from DBInfo t"); 
		Integer bh = (Integer) query.uniqueResult();
		if(bh == null){
			bh = 0;
		}
		serverInfo.setBh(bh+1);
		int id = (Integer)session.save(serverInfo);
		return id;
	}

	
	public boolean deleteDBInfo(int bh){
		Session session = sf.getCurrentSession();
		DBInfo tm = getByBH(bh);
		try {
			session.delete(tm);
			return true;
		} catch (HibernateException e) {
			// TODO: handle exception
			return false;
		}
	}
	public boolean reviseDBInfo(int bh,String title,String IP,String port){
		Session session = sf.getCurrentSession();
		Query query = session.createQuery("update DBInfo t set t.title = ?,t.IP = ?,t.port = ? where bh = ?"); 
		query.setParameter(0, title);
		query.setParameter(1, IP);
		query.setParameter(2, port);
		query.setParameter(3, bh);
		return query.executeUpdate()==1;
	}
}
