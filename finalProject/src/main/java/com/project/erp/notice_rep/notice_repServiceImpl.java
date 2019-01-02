package com.project.erp.notice_rep;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

@Component("notice_repService")
public class notice_repServiceImpl implements notice_repService {
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	private notice_repDao dao;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void add(Notice_rep nr) {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(notice_repDao.class);
		dao.insert(nr);
	}

	@Override
	public void del(int num) {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(notice_repDao.class);
		dao.delete(num);
	}

	@Override
	public ArrayList<Notice_rep> selectByN_num(int n_num) {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(notice_repDao.class);
		return dao.selectByN_num(n_num);
	}

	@Override
	public ArrayList<Notice_rep> selectAll() {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(notice_repDao.class);
		return dao.selectAll();
	}

	@Override
	public void del2(int n_num) {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(notice_repDao.class);
		dao.delete2(n_num);
	}

}
