package com.project.erp.notice;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;
@Component("noticeService")
public class noticeServiceImpl implements noticeService {
	@Resource(name="sqlSession")
	private SqlSession sqlSession;
	private noticeDao dao;

	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void add(Notice n) {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(noticeDao.class);
		dao.insert(n);
	}

	@Override
	public void edit(Notice n) {
		// TODO Auto-generated method stub
		dao=sqlSession.getMapper(noticeDao.class);
		dao.update(n);
	}

	@Override
	public void del(int num) {
		// TODO Auto-generated method stub
		dao=sqlSession.getMapper(noticeDao.class);
		dao.delete(num);
	}

	@Override
	public Notice getByNum(int num) {
		// TODO Auto-generated method stub
		dao=sqlSession.getMapper(noticeDao.class);
		return dao.selectByNum(num);
	}

	@Override
	public ArrayList<Notice> selectAll() {
		// TODO Auto-generated method stub
		dao=sqlSession.getMapper(noticeDao.class);
		return dao.selectAll();
	}

	@Override
	public ArrayList<Notice> selectByTitle(String title) {
		// TODO Auto-generated method stub
		dao=sqlSession.getMapper(noticeDao.class);
		return dao.selectByTitle(title);
	}

	@Override
	public ArrayList<Notice> selectByWriter(String writer) {
		// TODO Auto-generated method stub
		dao=sqlSession.getMapper(noticeDao.class);
		return dao.selectByWriter(writer);
	} 
		
	@Override
	public ArrayList<Notice> selectByContent(String content) {
		// TODO Auto-generated method stub
		dao=sqlSession.getMapper(noticeDao.class);
		return dao.selectByWriter(content);
	}

	@Override
	public int count(int view_count) {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(noticeDao.class);
		return dao.count(view_count);
	}

}
