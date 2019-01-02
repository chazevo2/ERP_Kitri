package com.project.erp.gradeCode;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

@Component("gradeCodeService")
public class gradeCodeServiceImpl implements gradeCodeService {
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	private gradeCodeDao dao;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void add(GradeCode d) {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(gradeCodeDao.class);
		dao.insert(d);
	}

	@Override
	public GradeCode getInfoByNum(String num) {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(gradeCodeDao.class);
		return dao.selectByNum(num);
	}

	@Override
	public GradeCode getInfoByName(String name) {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(gradeCodeDao.class);
		return dao.selectByName(name);
	}

	@Override
	public ArrayList<GradeCode> getInfoAll() {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(gradeCodeDao.class);
		return dao.selectAll();
	}

	@Override
	public void edit(GradeCode d) {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(gradeCodeDao.class);
		dao.update(d);
	}
}
