package cellivery.front.controller;

import java.io.IOException;
import java.net.MalformedURLException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cellivery.admin.model.MainDAO;
import cellivery.admin.model.PrDAO;
import cellivery.classes.Utils;
import cellivery.front.model.FrontDAO;


@Controller
@RequestMapping("/*")
public class FrontController {
	
	@Autowired
	private FrontDAO front_dao;
	
	@Autowired
	private MainDAO main_dao;
	
	@Autowired
	private PrDAO pr_dao;
	
	@RequestMapping("/login")
	public ModelAndView admin_login(HttpServletRequest request) throws MalformedURLException, IOException {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/user/login");
		return mav;
	}

	@RequestMapping("/")
	public ModelAndView front_index(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/front/index");
		
		//front_dao.test();
		List<HashMap<String, Object>> popList = front_dao.getPopupList();
		List<HashMap<String, Object>> mainPrlist = main_dao.getMainPrList(); 
		mav.addObject("popList", popList);
		mav.addObject("mainPrlist", mainPrlist);
		
		
		return mav;
	}
	
	
	@RequestMapping("/about")
	public ModelAndView sub_about(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/front/about/about");
		
		
		return mav;
	}
	
	@RequestMapping("/history")
	public ModelAndView sub_about_history(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/front/about/history");
		
		
		return mav;
	}
	
	@RequestMapping("/value")
	public ModelAndView sub_about_value(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/front/about/value");
		
		
		return mav;
	}
	
	@RequestMapping("/ci")
	public ModelAndView sub_about_ci(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/front/about/ci");
		
		
		return mav;
	}
	
	@RequestMapping("/brand")
	public ModelAndView sub_brand(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/front/brand/brand");
		
		
		return mav;
	}
	
	@RequestMapping("/brand_bioneul")
	public ModelAndView sub_brand_bioneul(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/front/brand/brand_bioneul");
		
		
		return mav;
	}
	@RequestMapping("/brand_therapuez")
	public ModelAndView sub_brand_therapuez(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/front/brand/brand_therapuez");
		
		
		return mav;
	}
	
	@RequestMapping("/business")
	public ModelAndView sub_business(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/front/business/business");
		
		
		return mav;
	}
	
	@RequestMapping("/livingHealth")
	public ModelAndView sub_living(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/front/business/living");
		
		
		return mav;
	}
	
	@RequestMapping("/biocareTissue")
	public ModelAndView sub_bio(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/front/business/bio");
		
		
		return mav;
	}
	
	@RequestMapping("/odm")
	public ModelAndView sub_odm(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/front/business/odm");
		
		
		return mav;
	}
	
	@RequestMapping("/rnd")
	public ModelAndView sub_rnd(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/front/rnd/rnd");
		
		
		return mav;
	}
	
	@RequestMapping("/rnd_research")
	public ModelAndView sub_research(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/front/rnd/research");
		
		
		return mav;
	}
	
	@RequestMapping("/rnd_technology")
	public ModelAndView sub_technology(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/front/rnd/technology");
		
		
		return mav;
	}

	@RequestMapping("/board_view")
	public ModelAndView sub_board_view(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/front/pr/board_view");
		
		
		return mav;
	}
	
	@RequestMapping("/news")
	public ModelAndView sub_pr(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/front/pr/news/news");
		
		List<HashMap<String, Object>> cate_list = pr_dao.getCateList(); 
		mav.addObject("cate_list", cate_list);
		
		return mav;
	}
	
	@RequestMapping("/news_board")
	public ModelAndView sub_pr_detail(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/front/pr/news/detail");
		
		String idx = Utils.checkNullString(request.getParameter("idx"));
		if (!idx.equals("")) {
			HashMap<String, Object> data = front_dao.getPrDetailInfo(idx,"news");
			if (data==null) 
			{
				mav.addObject("isSuc", "fail");
				mav.addObject("msg", "부적절한 접근입니다.");
				return mav;
			}
			
			for (String key : data.keySet()) {
				System.out.println(key+":"+data.get(key));				
				mav.addObject(key, data.get(key));
			}
			mav.addObject("idx", idx);
		}
		
		return mav;
	}
	
	@RequestMapping("/notice")
	public ModelAndView sub_notice(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/front/pr/notice/notice");
		
		List<HashMap<String, Object>> cate_list = pr_dao.getCateList(); 
		mav.addObject("cate_list", cate_list);
		
		return mav;
	}
	
	@RequestMapping("/notice_board")
	public ModelAndView sub_notice_detail(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/front/pr/notice/detail");
		
		String idx = Utils.checkNullString(request.getParameter("idx"));
		if (!idx.equals("")) {
			HashMap<String, Object> data = front_dao.getPrDetailInfo(idx,"notice");
			if (data==null) 
			{
				mav.addObject("isSuc", "fail");
				mav.addObject("msg", "부적절한 접근입니다.");
				return mav;
			}
			
			for (String key : data.keySet()) {
				System.out.println(key+":"+data.get(key));				
				mav.addObject(key, data.get(key));
			}
			mav.addObject("idx", idx);
		}
		
		return mav;
	}
	
	@RequestMapping("/media")
	public ModelAndView sub_media(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/front/pr/media/media");
		
		List<HashMap<String, Object>> cate_list = pr_dao.getCateList(); 
		mav.addObject("cate_list", cate_list);
		
		
		return mav;
	}
	
	@RequestMapping("/media_board")
	public ModelAndView media_detail(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/front/pr/media/detail");
		
		String idx = Utils.checkNullString(request.getParameter("idx"));
		if (!idx.equals("")) {
			HashMap<String, Object> data = front_dao.getPrDetailInfo(idx,"media");
			if (data==null) 
			{
				mav.addObject("isSuc", "fail");
				mav.addObject("msg", "부적절한 접근입니다.");
				return mav;
			}
			
			for (String key : data.keySet()) {
				System.out.println(key+":"+data.get(key));				
				mav.addObject(key, data.get(key));
			}
			mav.addObject("idx", idx);
		}
		
		return mav;
	}
	
	@RequestMapping("/sns")
	public ModelAndView sub_sns(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/front/pr/sns/sns");
		
		List<HashMap<String, Object>> cate_list = pr_dao.getCateList(); 
		mav.addObject("cate_list", cate_list);
		
		return mav;
	}
	
	
	@RequestMapping("/sns_board")
	public ModelAndView sub_sns_detail(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/front/pr/sns/detail");
		
		return mav;
	}
	
	
	@RequestMapping("/career")
	public ModelAndView sub_career(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/front/career/career");
		
		
		return mav;
	}
	
	@RequestMapping("/career1")
	public ModelAndView sub_career1(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/front/career/career1");
		
		
		return mav;
	}
	
	
	@RequestMapping("/contact")
	public ModelAndView contact(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/front/contact/contact");
		
		return mav;
	}
	
	@RequestMapping("/getPrTargetList")
	@ResponseBody
	public HashMap<String, Object> getPrTargetList(HttpServletRequest request) {
		
		
		String order_by = Utils.checkNullString(request.getParameter("order_by"));
		String sort_type = Utils.checkNullString(request.getParameter("sort_type"));
	
		String search_name = Utils.checkNullString(request.getParameter("search_name"));
		String start_ymd = Utils.checkNullString(request.getParameter("start_ymd"));
		String end_ymd = Utils.checkNullString(request.getParameter("end_ymd"));
		String cate = Utils.checkNullString(request.getParameter("cate"));
		String use_yn = Utils.checkNullString(request.getParameter("use_yn"));
		String tbl = Utils.checkNullString(request.getParameter("tbl"));
		
		List<HashMap<String, Object>> TotallistCnt = front_dao.getPrTargetListCount("","","","","",tbl);
		List<HashMap<String, Object>> listCnt = front_dao.getPrTargetListCount(search_name,start_ymd,end_ymd,cate,use_yn,tbl);
		int TotalCnt = Integer.parseInt(TotallistCnt.get(0).get("cnt").toString());
		int listCount = Integer.parseInt(listCnt.get(0).get("cnt").toString());
		int page = 1;
		if(!"".equals(Utils.checkNullString(request.getParameter("page"))))
		{
			page = Integer.parseInt(Utils.checkNullString(request.getParameter("page")));
		}
		int listSize = 10;
		if(!"".equals(Utils.checkNullString(request.getParameter("listSize"))))
		{
			listSize = Integer.parseInt(Utils.checkNullString(request.getParameter("listSize")));
		}
		
		int block=5;
		int pageNum = (int)Math.ceil((double)listCount/listSize);
		int nowBlock = (int)Math.ceil((double)page/block);
		int s_page = (nowBlock * block) - (block-1);
		if (s_page <= 1) 
		{
		    s_page = 1;
		}
		int e_page = nowBlock*block;
		if (pageNum <= e_page) {
		    e_page = pageNum;
		}
		
		int s_point = (page-1) * listSize;
		
		List<HashMap<String, Object>> list = front_dao.getPrTargetList(s_point, listSize, order_by, sort_type,search_name,start_ymd,end_ymd,cate,use_yn,tbl); 
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("TotalCnt", TotalCnt);
		map.put("listCount", listCount);
		map.put("list", list);
		map.put("page", page);
		map.put("s_page", s_page);
		map.put("e_page", e_page);
		map.put("pageNum", pageNum);
		map.put("order_by", order_by);
		map.put("sort_type", sort_type);
		
		return map;
	}
	
	@RequestMapping("/getPrMediaList")
	@ResponseBody
	public HashMap<String, Object> getPrMediaList(HttpServletRequest request) {
		
		
		String order_by = Utils.checkNullString(request.getParameter("order_by"));
		String sort_type = Utils.checkNullString(request.getParameter("sort_type"));
	
		String search_name = Utils.checkNullString(request.getParameter("search_name"));
		String start_ymd = Utils.checkNullString(request.getParameter("start_ymd"));
		String end_ymd = Utils.checkNullString(request.getParameter("end_ymd"));
		String cate = Utils.checkNullString(request.getParameter("cate"));
		String use_yn = Utils.checkNullString(request.getParameter("use_yn"));
		String tbl = Utils.checkNullString(request.getParameter("tbl"));
		
		List<HashMap<String, Object>> TotallistCnt = front_dao.getPrMediaListCount("","","","","");
		List<HashMap<String, Object>> listCnt = front_dao.getPrMediaListCount(search_name,start_ymd,end_ymd,cate,use_yn);
		int TotalCnt = Integer.parseInt(TotallistCnt.get(0).get("cnt").toString());
		int listCount = Integer.parseInt(listCnt.get(0).get("cnt").toString());
		int page = 1;
		if(!"".equals(Utils.checkNullString(request.getParameter("page"))))
		{
			page = Integer.parseInt(Utils.checkNullString(request.getParameter("page")));
		}
		int listSize = 10;
		if(!"".equals(Utils.checkNullString(request.getParameter("listSize"))))
		{
			listSize = Integer.parseInt(Utils.checkNullString(request.getParameter("listSize")));
		}
		
		int block=5;
		int pageNum = (int)Math.ceil((double)listCount/listSize);
		int nowBlock = (int)Math.ceil((double)page/block);
		int s_page = (nowBlock * block) - (block-1);
		if (s_page <= 1) 
		{
		    s_page = 1;
		}
		int e_page = nowBlock*block;
		if (pageNum <= e_page) {
		    e_page = pageNum;
		}
		
		int s_point = (page-1) * listSize;
		
		List<HashMap<String, Object>> list = front_dao.getPrMediaList(s_point, listSize, order_by, sort_type,search_name,start_ymd,end_ymd,cate,use_yn); 
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("TotalCnt", TotalCnt);
		map.put("listCount", listCount);
		map.put("list", list);
		map.put("page", page);
		map.put("s_page", s_page);
		map.put("e_page", e_page);
		map.put("pageNum", pageNum);
		map.put("order_by", order_by);
		map.put("sort_type", sort_type);
		
		return map;
	}
	
	@RequestMapping("/getPrSNSList")
	@ResponseBody
	public HashMap<String, Object> getPrSNSList(HttpServletRequest request) {
		
		
		String order_by = Utils.checkNullString(request.getParameter("order_by"));
		String sort_type = Utils.checkNullString(request.getParameter("sort_type"));
	
		String search_name = Utils.checkNullString(request.getParameter("search_name"));
		String start_ymd = Utils.checkNullString(request.getParameter("start_ymd"));
		String end_ymd = Utils.checkNullString(request.getParameter("end_ymd"));
		String cate = Utils.checkNullString(request.getParameter("cate"));
		String use_yn = Utils.checkNullString(request.getParameter("use_yn"));
		String tbl = Utils.checkNullString(request.getParameter("tbl"));
		
		List<HashMap<String, Object>> TotallistCnt = front_dao.getPrSNSListCount("","","","","",tbl);
		List<HashMap<String, Object>> listCnt = front_dao.getPrSNSListCount(search_name,start_ymd,end_ymd,cate,use_yn,tbl);
		int TotalCnt = Integer.parseInt(TotallistCnt.get(0).get("cnt").toString());
		int listCount = Integer.parseInt(listCnt.get(0).get("cnt").toString());
		int page = 1;
		if(!"".equals(Utils.checkNullString(request.getParameter("page"))))
		{
			page = Integer.parseInt(Utils.checkNullString(request.getParameter("page")));
		}
		int listSize = 10;
		if(!"".equals(Utils.checkNullString(request.getParameter("listSize"))))
		{
			listSize = Integer.parseInt(Utils.checkNullString(request.getParameter("listSize")));
		}
		
		int block=5;
		int pageNum = (int)Math.ceil((double)listCount/listSize);
		int nowBlock = (int)Math.ceil((double)page/block);
		int s_page = (nowBlock * block) - (block-1);
		if (s_page <= 1) 
		{
		    s_page = 1;
		}
		int e_page = nowBlock*block;
		if (pageNum <= e_page) {
		    e_page = pageNum;
		}
		
		int s_point = (page-1) * listSize;
		
		List<HashMap<String, Object>> list = front_dao.getPrSNSList(s_point, listSize, order_by, sort_type,search_name,start_ymd,end_ymd,cate,use_yn,tbl); 
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("TotalCnt", TotalCnt);
		map.put("listCount", listCount);
		map.put("list", list);
		map.put("page", page);
		map.put("s_page", s_page);
		map.put("e_page", e_page);
		map.put("pageNum", pageNum);
		map.put("order_by", order_by);
		map.put("sort_type", sort_type);
		
		return map;
	}
	
	@RequestMapping("/getHistoryList")
	@ResponseBody
	public HashMap<String, Object> getHistoryList(HttpServletRequest request) {
		List<HashMap<String, Object>> list = front_dao.getHistoryList(); 
		List<HashMap<String, Object>> sub_list = front_dao.getHistorySubList(); 
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("sub_list", sub_list);
		return map;
	}
}
