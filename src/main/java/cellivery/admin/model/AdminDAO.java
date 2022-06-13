package cellivery.admin.model;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

@Component
public class AdminDAO {
	
	private final SqlSession sqlSession;
	
	public AdminDAO(SqlSession sqlSession) 
	{
		this.sqlSession = sqlSession;
	}
	private String NS = "adminMapper";

	
	public int test() {
		return sqlSession.selectOne(NS + ".test");
	}

}
