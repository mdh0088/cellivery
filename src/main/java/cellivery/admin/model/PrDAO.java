package cellivery.admin.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import cellivery.classes.Utils;


@Component
public class PrDAO {
	
	private final SqlSession sqlSession;
	
	public PrDAO(SqlSession sqlSession) 
	{
		this.sqlSession = sqlSession;
	}
	private String NS = "prMapper";

	public List<HashMap<String, Object>> getCateList() {
		HashMap<String, Object> map = new HashMap<>();
		List<HashMap<String, Object>> list = sqlSession.selectList(NS + ".getCateList", map);
		return list;
	}
	
	public void save_pr_cate(String cate_title) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("cate_title", cate_title);
		sqlSession.insert(NS + ".save_pr_cate", map);
	}

	public int del_pr_cate(String idx) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("idx", idx);
		return sqlSession.delete(NS + ".del_pr_cate", map);
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
		
	public HashMap<String, Object> getPrTargetInfo(String idx, String tbl) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("idx", idx);
		map.put("tbl", tbl);
		HashMap<String, Object> data = sqlSession.selectOne(NS + ".getPrTargetInfo",map);
		return data;
	}
		
		
	public int delTarget(String idx, String tbl) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("idx", idx);
		map.put("tbl", tbl);
		return sqlSession.delete(NS + ".delTarget", map);
	}
	
	
	public int duplTarget(String idx, String tbl, String myidx) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("idx", idx);
		map.put("tbl", tbl);
		map.put("myidx", myidx);
		return sqlSession.insert(NS + ".duplTarget", map);
	}
	
	public void insPrTarget(String create_date, String use_yn, String cate_list,String title,
			String board_cont,String up_show_yn,String file_nm,String file_ori_nm,String thumb_nm,
			String thumb_ori_nm, String tbl, String url,String myidx) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("create_date", create_date);
		map.put("use_yn", use_yn);
		map.put("cate_list", cate_list);
		map.put("title", title);
		map.put("board_cont", board_cont);
		map.put("up_show_yn", up_show_yn);
		map.put("file_nm", file_nm);
		map.put("file_ori_nm", file_ori_nm);
		map.put("thumb_nm", thumb_nm);
		map.put("thumb_ori_nm", thumb_ori_nm);
		map.put("tbl", tbl);
		map.put("url", url);
		map.put("myidx", myidx);
		sqlSession.insert(NS + ".insPrTarget", map);
	}
	
	public void uptPrTarget(String idx,String create_date, String use_yn, 
			String cate_list,String title,String board_cont,String up_show_yn,
			String file_nm,String file_ori_nm,String thumb_nm,String thumb_ori_nm,
			String tbl, String url, String myidx) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("idx", idx);
		map.put("create_date", create_date);
		map.put("use_yn", use_yn);
		map.put("cate_list", cate_list);
		map.put("title", title);
		map.put("board_cont", board_cont);
		map.put("up_show_yn", up_show_yn);
		map.put("file_nm", file_nm);
		map.put("file_ori_nm", file_ori_nm);
		map.put("thumb_nm", thumb_nm);
		map.put("thumb_ori_nm", thumb_ori_nm);
		map.put("tbl", tbl);
		map.put("url", url);
		map.put("myidx", myidx);
		sqlSession.update(NS + ".uptPrTarget", map);
	}
	
	public void upt_main_cate(String idx, String order_no) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("idx", idx);
		map.put("order_no", order_no);

		sqlSession.update(NS + ".upt_main_cate", map);
	}
}
