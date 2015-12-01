package nju.software.courtplatform.dao;

import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

public class BaseDao {
	protected Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	protected SessionFactory sf;
}
