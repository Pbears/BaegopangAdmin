package gopang.dao;

import java.io.Closeable;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import gopang.bean.BrandBean;
import gopang.util.SqlSessionFactoryManager;

public class BrandDao {
	private SqlSessionFactory sqlSessionFactory;

	public BrandDao() {
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

	public List<BrandBean> selectAllBrand() {
		SqlSession sqlSession = null;
		try {
			sqlSession = sqlSessionFactory.openSession();
			return sqlSession.selectList("selectAllBrand");
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			closeSqlSession(sqlSession);
		}
	}
	
	public int getTotalRow(){
		SqlSession sqlSession = null;
		try {
			sqlSession = sqlSessionFactory.openSession();
			return sqlSession.selectOne("getTotalRow");
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			closeSqlSession(sqlSession);
		}
	}

	public List<BrandBean> searchBrand(HashMap<String, Object> map){
		SqlSession sqlSession = null;
		try {
			sqlSession = sqlSessionFactory.openSession();
			return sqlSession.selectList("searchBrand", map);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			closeSqlSession(sqlSession);
		}
	}
	
}