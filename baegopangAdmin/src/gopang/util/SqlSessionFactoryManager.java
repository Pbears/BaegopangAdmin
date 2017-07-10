package gopang.util;

import java.io.Reader;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlSessionFactoryManager {
	private static SqlSessionFactory sqlSessionFactory;
	static{
		try {
			Reader reader=Resources.getResourceAsReader("gopang/util/Config.xml");
			sqlSessionFactory=new SqlSessionFactoryBuilder().build(reader);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	public static SqlSessionFactory getSqlSessionFactory(){
		return sqlSessionFactory;
	}
}
