package com.project.erp.departmentCode;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;
@Component("departmentCodeService")
public class departmentCodeServiceImpl implements departmentCodeService {
	@Resource(name="sqlSession")
	private SqlSession sqlSession;
	private departmentCodeDao dao;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void add(DepartmentCode d) {
		// TODO Auto-generated method stub
		dao=sqlSession.getMapper(departmentCodeDao.class);
		dao.insert(d);
	}
	@Override
	public void edit(DepartmentCode d) {
		// TODO Auto-generated method stub
		dao=sqlSession.getMapper(departmentCodeDao.class);
		dao.update(d);
	}
	
	@Override
	public DepartmentCode getInfoByNum(int num) {
		// TODO Auto-generated method stub
		dao=sqlSession.getMapper(departmentCodeDao.class);
		return dao.selectByNum(num);
	}
	
	@Override
	public DepartmentCode getInfoByName(String name) {
		// TODO Auto-generated method stub
		dao=sqlSession.getMapper(departmentCodeDao.class);
		return dao.selectByName(name);
	}

	@Override
	public ArrayList<DepartmentCode> getInfoAll() {
		// TODO Auto-generated method stub
		dao=sqlSession.getMapper(departmentCodeDao.class);
		return dao.selectAll();
	}

}
