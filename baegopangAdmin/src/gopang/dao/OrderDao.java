package gopang.dao;

import java.io.Closeable;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import gopang.bean.MenuBean;
import gopang.bean.OrderBean;
import gopang.util.SqlSessionFactoryManager;

public class OrderDao {
	private SqlSessionFactory sqlSessionFactory;

	public OrderDao() {
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

	public List<OrderBean> selectAllOrder() {
		SqlSession sqlSession = null;
		try {
			sqlSession = sqlSessionFactory.openSession();
			return sqlSession.selectList("selectAllOrder");
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			closeSqlSession(sqlSession);
		}
	}

}