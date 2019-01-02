package com.project.erp.mail;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

@Component("countService")
public class countServiceImpl implements countService {
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	private countDao dao;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public Count get(String email) {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(countDao.class);
		return dao.select(email);
	}
}
