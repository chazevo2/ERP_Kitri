package com.project.erp.member;

import java.util.ArrayList;
import javax.annotation.Resource;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

@Component("memberService")
public class memberServiceImpl implements memberService {
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	private memberDao dao;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void add(Member m) {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(memberDao.class);
		dao.insert(m);
	}

	@Override
	public void edit(Member m) {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(memberDao.class);
		dao.update(m);
	}

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(memberDao.class);
		dao.delete(id);
	}

	@Override
	public Member getById(String id) {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(memberDao.class);
		return dao.selectById(id);
	}

	@Override
	public ArrayList<Member> getByName(String name) {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(memberDao.class);
		return dao.selectByName(name);
	}

	@Override
	public ArrayList<Member> getByName1(String name) {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(memberDao.class);
		return dao.selectByName1(name);
	}

	@Override
	public ArrayList<Member> getAll() {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(memberDao.class);
		return dao.selectAll();
	}

	@Override
	public ArrayList<Member> getByConfirm(String confirm) {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(memberDao.class);
		return dao.selectByConfirm(confirm);
	}

	@Override
	public boolean login(Member m) {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(memberDao.class);
		Member m2 = dao.selectById(m.getId());
		if (m2 != null && m2.getPwd().equals(m.getPwd())) {
			return true;
		}
		return false;
	}

	@Override
	public ArrayList<Member> getByDepartmentCode(int num) {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(memberDao.class);
		return dao.selectByDepartmentCode(num);
	}

}
