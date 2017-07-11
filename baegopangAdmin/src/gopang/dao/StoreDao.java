package gopang.dao;

import java.io.Closeable;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import gopang.bean.MenuBean;
import gopang.bean.StoreBean;
import gopang.util.SqlSessionFactoryManager;

public class StoreDao {
	private SqlSessionFactory sqlSessionFactory;

	public StoreDao() {
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

	public List<StoreBean> selectAllStore() {
		SqlSession sqlSession = null;
		try {
			sqlSession = sqlSessionFactory.openSession();
			return sqlSession.selectList("selectAllStore");
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			closeSqlSession(sqlSession);
		}
	}

}