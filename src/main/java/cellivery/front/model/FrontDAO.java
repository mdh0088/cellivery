package cellivery.front.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

@Component
public class FrontDAO {
	
	private final SqlSession sqlSession;
	
	public FrontDAO(SqlSession sqlSession) 
	{
		this.sqlSession = sqlSession;
	}
	private String NS = "frontMapper";

	
	public int test() {
		return sqlSession.selectOne(NS + ".test");
	}

	
	public List<HashMap<String, Object>> getPopupList() {
		HashMap<String, Object> map = new HashMap<>();
		List<HashMap<String, Object>> list = sqlSession.selectList(NS + ".getPopupList", map);
		return list;
	}
	
	public List<HashMap<String, Object>> getPrTargetListCount(String search_name, String start_ymd,String end_ymd, String cate, String use_yn,String tbl) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("search_name", search_name);
		map.put("start_ymd", start_ymd);
		map.put("end_ymd", end_ymd);
		map.put("cate", cate);
		map.put("use_yn", use_yn);
		map.put("tbl", tbl);
		List<HashMap<String, Object>> list = sqlSession.selectList(NS + ".getPrTargetListCount", map);
		return list;
	}
		
	public List<HashMap<String, Object>> getPrTargetList(int s_rownum, int e_rownum, String order_by, String sort_type,String search_name, 
			String start_ymd,String end_ymd, String cate,String use_yn,String tbl) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("s_rownum", s_rownum);
		map.put("e_rownum", e_rownum);
		map.put("order_by", order_by);
		map.put("sort_type", sort_type);
		map.put("search_name", search_name);
		map.put("start_ymd", start_ymd);
		map.put("end_ymd", end_ymd);
		map.put("cate", cate);
		map.put("use_yn", use_yn);
		map.put("tbl", tbl);
		List<HashMap<String, Object>> list = sqlSession.selectList(NS + ".getPrTargetList", map);
		return list;
	}
	
	public List<HashMap<String, Object>> getPrMediaListCount(String search_name, String start_ymd,String end_ymd, String cate, String use_yn) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("search_name", search_name);
		map.put("start_ymd", start_ymd);
		map.put("end_ymd", end_ymd);
		map.put("cate", cate);
		map.put("use_yn", use_yn);
		List<HashMap<String, Object>> list = sqlSession.selectList(NS + ".getPrMediaListCount", map);
		return list;
	}
		
	public List<HashMap<String, Object>> getPrMediaList(int s_rownum, int e_rownum, String order_by, String sort_type,String search_name, 
			String start_ymd,String end_ymd, String cate,String use_yn) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("s_rownum", s_rownum);
		map.put("e_rownum", e_rownum);
		map.put("order_by", order_by);
		map.put("sort_type", sort_type);
		map.put("search_name", search_name);
		map.put("start_ymd", start_ymd);
		map.put("end_ymd", end_ymd);
		map.put("cate", cate);
		map.put("use_yn", use_yn);
		List<HashMap<String, Object>> list = sqlSession.selectList(NS + ".getPrMediaList", map);
		return list;
	}
	
	public List<HashMap<String, Object>> getPrSNSListCount(String search_name, String start_ymd,String end_ymd, String cate, String use_yn,String tbl) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("search_name", search_name);
		map.put("start_ymd", start_ymd);
		map.put("end_ymd", end_ymd);
		map.put("cate", cate);
		map.put("use_yn", use_yn);
		map.put("tbl", tbl);
		List<HashMap<String, Object>> list = sqlSession.selectList(NS + ".getPrSNSListCount", map);
		return list;
	}
		
	public List<HashMap<String, Object>> getPrSNSList(int s_rownum, int e_rownum, String order_by, String sort_type,String search_name, 
			String start_ymd,String end_ymd, String cate,String use_yn,String tbl) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("s_rownum", s_rownum);
		map.put("e_rownum", e_rownum);
		map.put("order_by", order_by);
		map.put("sort_type", sort_type);
		map.put("search_name", search_name);
		map.put("start_ymd", start_ymd);
		map.put("end_ymd", end_ymd);
		map.put("cate", cate);
		map.put("use_yn", use_yn);
		map.put("tbl", tbl);
		List<HashMap<String, Object>> list = sqlSession.selectList(NS + ".getPrSNSList", map);
		return list;
	}
	
	public List<HashMap<String, Object>> getHistoryList() {
		HashMap<String, Object> map = new HashMap<>();
		List<HashMap<String, Object>> list = sqlSession.selectList(NS + ".getHistoryList", map);
		return list;
	}
	
	public List<HashMap<String, Object>> getHistorySubList() {
		HashMap<String, Object> map = new HashMap<>();
		List<HashMap<String, Object>> list = sqlSession.selectList(NS + ".getHistorySubList", map);
		return list;
	}
	
	public HashMap<String, Object> getPrDetailInfo(String idx, String tbl) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("idx", idx);
		map.put("tbl", tbl);
		HashMap<String, Object> data = sqlSession.selectOne(NS + ".getPrDetailInfo",map);
		return data;
	}
}
