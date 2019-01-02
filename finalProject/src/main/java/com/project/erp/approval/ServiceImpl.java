package com.project.erp.approval;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

@Component("apvService")
public class ServiceImpl implements Service {
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	private Dao dao;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void addApv(Approval a) {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(Dao.class);
		dao.insert(a);
	}

	@Override
	public Approval getApv(int num) {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(Dao.class);
		return dao.select(num);
	}

	@Override
	public ArrayList<Approval> getById(String id) {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(Dao.class);
		return dao.selectById(id);
	}

	@Override
	public ArrayList<Approval> getAll() {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(Dao.class);
		return dao.selectAll();
	}

	@Override
	public void editApv(Approval a) {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(Dao.class);
		dao.update(a);
	}

	@Override
	public void delApv(int num) {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(Dao.class);
		dao.delete(num);
	}

}
