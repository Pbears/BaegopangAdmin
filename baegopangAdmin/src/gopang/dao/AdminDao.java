package gopang.dao;

import java.io.Closeable;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import gopang.util.SqlSessionFactoryManager;

public class AdminDao {
	private SqlSessionFactory sqlSessionFactory;

	public AdminDao() {
		sqlSessionFactory = SqlSessionFactoryManager.getSqlSessionFactory();
	}

	private void closeSqlSession(Closeable c) {
		try {
			if (c != null)
				c.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public boolean pwCheck(String id, String pw) {
		SqlSession sqlSession = null;
		try {
			sqlSession = sqlSessionFactory.openSession();
			String dbPw = sqlSession.selectOne("pwCheck", id);
			return pw.equals(dbPw)?true:false;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			closeSqlSession(sqlSession);
		}
	}

}