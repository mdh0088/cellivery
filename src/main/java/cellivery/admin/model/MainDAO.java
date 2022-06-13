package cellivery.admin.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

@Component
public class MainDAO {
	
	private final SqlSession sqlSession;
	
	public MainDAO(SqlSession sqlSession) 
	{
		this.sqlSession = sqlSession;
	}
	private String NS = "mainMapper";

	public List<HashMap<String, Object>> getPopUpListCount(String search_name, String start_ymd,String end_ymd, String use_yn) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("search_name", search_name);
		map.put("start_ymd", start_ymd);
		map.put("end_ymd", end_ymd);
		map.put("use_yn", use_yn);
		List<HashMap<String, Object>> list = sqlSession.selectList(NS + ".getPopUpListCount", map);
		return list;
	}
		
	public List<HashMap<String, Object>> getPopUpList(int s_rownum, int e_rownum, String order_by, String sort_type,String search_name, 
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
		List<HashMap<String, Object>> list = sqlSession.selectList(NS + ".getPopUpList", map);
		return list;
	}
	
	public HashMap<String, Object> getPopupInfo(String idx) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("idx", idx);
		HashMap<String, Object> data = sqlSession.selectOne(NS + ".getPopupInfo",map);
		return data;
	}
	
	public void insPopupTarget(String create_date, String use_yn, String title,String start_ymd,String end_ymd,String board_cont) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("create_date", create_date);
		map.put("use_yn", use_yn);
		map.put("title", title);
		map.put("start_ymd", start_ymd);
		map.put("end_ymd", end_ymd);
		map.put("board_cont", board_cont);
		sqlSession.insert(NS + ".insPopupTarget", map);
	}
	
	public void uptPopupTarget(String idx,String create_date, String use_yn, String title,String start_ymd,String end_ymd,String board_cont) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("idx", idx);
		map.put("create_date", create_date);
		map.put("use_yn", use_yn);
		map.put("title", title);
		map.put("start_ymd", start_ymd);
		map.put("end_ymd", end_ymd);
		map.put("board_cont", board_cont);
		sqlSession.update(NS + ".uptPopupTarget", map);
	}
	
	public List<HashMap<String, Object>> getMainPrList() {
		HashMap<String, Object> map = new HashMap<>();
		List<HashMap<String, Object>> list = sqlSession.selectList(NS + ".getMainPrList", map);
		return list;
	}
	
	public int del_pr_cate(String idx) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("idx", idx);
		return sqlSession.delete(NS + ".del_pr_cate", map);
	}
	
	public List<HashMap<String, Object>> getMainPopPrListCount(String pr) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("pr", pr);
		List<HashMap<String, Object>> list = sqlSession.selectList(NS + ".getMainPopPrListCount", map);
		return list;
	}
		
	public List<HashMap<String, Object>> getMainPopPrList(int s_rownum, int e_rownum, String order_by, String sort_type,String pr) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("s_rownum", s_rownum);
		map.put("e_rownum", e_rownum);
		map.put("order_by", order_by);
		map.put("sort_type", sort_type);
		map.put("pr", pr);
		List<HashMap<String, Object>> list = sqlSession.selectList(NS + ".getMainPopPrList", map);
		return list;
	}
	
	public int add_pr_cate(String idx, String pr_type) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("idx", idx);
		map.put("pr_type", pr_type);
		return sqlSession.insert(NS + ".add_pr_cate", map);
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
	
	public int change_use_yn(String idx,String use_yn, String tbl) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("idx", idx);
		map.put("use_yn", use_yn);
		map.put("tbl", tbl);

		return sqlSession.update(NS + ".change_use_yn", map);
	}
	
	public void upt_main_cate(String idx, String order_no) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("idx", idx);
		map.put("order_no", order_no);

		sqlSession.update(NS + ".upt_main_cate", map);
	}
	
}
