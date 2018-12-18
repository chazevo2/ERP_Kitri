package com.project.erp.community;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

@Component("communityService")
public class CommServiceImpl implements CommService {
	@Resource(name="sqlSession")
	private SqlSession sqlSession;
	private CommDao dao;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void add(Community c) {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(CommDao.class);
		dao.insert(c);
	}

	@Override
	public void edit(Community c) {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(CommDao.class);
		dao.update(c);
	}

	@Override
	public void del(int num) {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(CommDao.class);
		dao.delete(num);
	}

	@Override
	public ArrayList<Community> getComm(String title) {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(CommDao.class);
		return dao.selectByTitle(title);
	}

	@Override
	public ArrayList<Community> getAll() {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(CommDao.class);
		return dao.selectAll();
	}

	@Override
	public Community getByNum(int num) {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(CommDao.class);
		return dao.selectByNum(num);
	}

	@Override
	public void editNOP(int num) {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(CommDao.class);
		dao.updateNOP(num);
	}

	@Override
	public void editNOP2(int num) {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(CommDao.class);
		dao.updateNOP2(num);
	}

	@Override
	public void editCNT(int num) {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(CommDao.class);
		dao.updateCNT(num);
	}

	@Override
	public void addAttandant(Community c) {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(CommDao.class);
		dao.insertAttandant(c);
	}
	
	
}
