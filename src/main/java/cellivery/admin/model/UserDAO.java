package cellivery.admin.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

@Component
public class UserDAO {
	
	private final SqlSession sqlSession;
	
	public UserDAO(SqlSession sqlSession) 
	{
		this.sqlSession = sqlSession;
	}
	private String NS = "userMapper";

	
	public int test() {
		return sqlSession.selectOne(NS + ".test");
	}
	
	public HashMap<String, Object> loginCheck(String login_id, String login_pw) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("login_id", login_id);
		map.put("login_pw", login_pw);
		HashMap<String, Object> data = sqlSession.selectOne(NS + ".loginCheck", map);
		return data;
	}
	
	public HashMap<String, Object> user_id_chk(String user_id) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("user_id", user_id);
		HashMap<String, Object> data = sqlSession.selectOne(NS + ".user_id_chk", map);
		return data;
	}
	
	public void insUser(String user_nm, String user_id, String user_pw, String user_email, String user_phone) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("user_nm", user_nm);
		map.put("user_id", user_id);
		map.put("user_pw", user_pw);
		map.put("user_email", user_email);
		map.put("user_phone", user_phone);

		sqlSession.insert(NS + ".insUser", map);
	}
	
	public void uptUserInfo(String idx,String user_nm, String user_id, String user_pw, String user_email, String user_phone) {

		HashMap<String, Object> map = new HashMap<>();
		map.put("idx", idx);
		map.put("user_nm", user_nm);
		map.put("user_id", user_id);
		map.put("user_pw", user_pw);
		map.put("user_email", user_email);
		map.put("user_phone", user_phone);
		
		sqlSession.update(NS + ".uptUserInfo", map);
	}
	
	public HashMap<String, Object> getUserInfoForEdit(String idx) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("idx", idx);
		HashMap<String, Object> data = sqlSession.selectOne(NS + ".getUserInfoForEdit", map);
		return data;
	}
	
	public List<HashMap<String, Object>> getUserListCount() {
		HashMap<String, Object> map = new HashMap<>();
		List<HashMap<String, Object>> list = sqlSession.selectList(NS + ".getUserListCount", map);
		return list;
	}
		
	public List<HashMap<String, Object>> getUserList(int s_rownum, int e_rownum, String order_by, String sort_type) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("s_rownum", s_rownum);
		map.put("e_rownum", e_rownum);
		map.put("order_by", order_by);
		map.put("sort_type", sort_type);

		List<HashMap<String, Object>> list = sqlSession.selectList(NS + ".getUserList", map);
		return list;
	}
	
	public void update_popup_to_n() {
		HashMap<String, Object> map = new HashMap<>();
		sqlSession.update(NS + ".update_popup_to_n", map);
	}
}
