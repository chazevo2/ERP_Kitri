package com.project.erp.mail;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

@Component("mailService")
public class mailServiceImpl implements mailService {
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	private mailDao dao;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void add(Mail c) {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(mailDao.class);
		dao.insert(c);
	}

	@Override
	public void edit(Mail c) {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(mailDao.class);
		dao.update(c);
	}

	@Override
	public void del(int num) {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(mailDao.class);
		dao.delete(num);
	}

	@Override
	public Mail get(int num) {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(mailDao.class);
		return dao.select(num);
	}

	@Override
	public ArrayList<Mail> gettAll(String getEmail) {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(mailDao.class);
		return dao.selectAll(getEmail);
	}
}
