package cellivery.admin.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import cellivery.classes.Utils;

@Component
public class HisDAO {
	
	private final SqlSession sqlSession;
	
	public HisDAO(SqlSession sqlSession) 
	{
		this.sqlSession = sqlSession;
	}
	private String NS = "hisMapper";

	public List<HashMap<String, Object>> getHistoryListCount(String search_name, String start_ymd,String end_ymd, String use_yn) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("search_name", search_name);
		map.put("start_ymd", start_ymd);
		map.put("end_ymd", end_ymd);
		map.put("use_yn", use_yn);
		List<HashMap<String, Object>> list = sqlSession.selectList(NS + ".getHistoryListCount", map);
		return list;
	}
		
	public List<HashMap<String, Object>> getHistoryList(int s_rownum, int e_rownum, String order_by, String sort_type,String search_name, 
			String start_ymd,String end_ymd,String use_yn) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("s_rownum", s_rownum);
		map.put("e_rownum", e_rownum);
		map.put("order_by", order_by);
		map.put("sort_type", sort_type);
		map.put("search_name", search_name);
		map.put("start_ymd", start_ymd);
		map.put("end_ymd", end_ymd);
		map.put("use_yn", use_yn);
		List<HashMap<String, Object>> list = sqlSession.selectList(NS + ".getHistoryList", map);
		return list;
	}
	
	public int delTarget(String idx) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("idx", idx);
		return sqlSession.delete(NS + ".delTarget", map);
	}
	
	
	public int duplTarget(String idx, String myidx) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("idx", idx);
		map.put("myidx", myidx);
		return sqlSession.insert(NS + ".duplTarget", map);
	}
	
	
	public int insHistory(String idx,String create_date,String title_year,String use_yn) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("idx", idx);
		map.put("create_date", create_date);
		map.put("title_year", title_year);
		map.put("use_yn", use_yn);
		
		sqlSession.insert(NS + ".insHistory", map);
	
		return Utils.checkNullInt(map.get("idx"));		
	}
	
	public int insHistoryTarget(String max_idx, String history_ymd, String history_cont, String effect_yn, String logo_yn) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("max_idx", max_idx);
		map.put("history_ymd", history_ymd);
		map.put("history_cont", history_cont);
		map.put("effect_yn", effect_yn);
		map.put("logo_yn", logo_yn);
		return sqlSession.insert(NS + ".insHistoryTarget", map);
	}
	
	public HashMap<String, Object> getHistoryMax_idx() {
		HashMap<String, Object> map = new HashMap<>();
		return  sqlSession.selectOne(NS + ".getHistoryMax_idx", map);
	}
	
	
	public HashMap<String, Object> getHistTargetInfo(String idx) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("idx", idx);
		return  sqlSession.selectOne(NS + ".getHistTargetInfo", map);
	}
	
	public List<HashMap<String, Object>> getHistTargetInfoBy_year(String title_year) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("title_year", title_year);
		List<HashMap<String, Object>> list = sqlSession.selectList(NS + ".getHistTargetInfoBy_year", map);
		return list;
	}
	
	public List<HashMap<String, Object>> getHistoryTargetList(String idx) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("idx", idx);
		List<HashMap<String, Object>> list = sqlSession.selectList(NS + ".getHistoryTargetList", map);
		return list;
	}
	
	public int delHistoryTarget(String idx) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("idx", idx);
		return sqlSession.delete(NS + ".delHistoryTarget", map);
	}
	
	public void uptHistory(String idx, String create_date,String title_year, String use_yn) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("idx", idx);
		map.put("create_date", create_date);
		map.put("title_year", title_year);
		map.put("use_yn", use_yn);

		sqlSession.update(NS + ".uptHistory", map);
	}
}
