package com.project.erp.apv_set;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

@Component("apvSetService")
public class ServiceImpl implements Service {
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	private Dao dao;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void addSet(Apv_set a) {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(Dao.class);
		dao.insert(a);
	}

	@Override
	public Apv_set getSet(int num) {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(Dao.class);
		return dao.select(num);
	}

	@Override
	public ArrayList<Apv_set> getAll() {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(Dao.class);
		return dao.selectAll();
	}

	@Override
	public void editSet(Apv_set a) {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(Dao.class);
		dao.update(a);
	}

	@Override
	public void delSet(int num) {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(Dao.class);
		dao.delete(num);
	}

}
