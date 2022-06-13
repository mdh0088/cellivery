package cellivery.admin.controller;

import java.io.IOException;
import java.net.MalformedURLException;
import java.text.ParseException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import cellivery.admin.model.MainDAO;
import cellivery.classes.FileUtils;
import cellivery.classes.Utils;


@Controller
@RequestMapping("/admin")
public class MainController {
	
	@Value("${spring.config.activate.on-profile}")
	private String env;
	
	@Autowired
	private MainDAO main_dao;
	

	@RequestMapping("")
	public ModelAndView main(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/index");
		
		return mav;
	}
	
	@RequestMapping("/main/popup/list")
	public ModelAndView popup_list(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/main/popup/list");
		
		return mav;
	}
	
	@RequestMapping("/main/popup/write")
	public ModelAndView popup_write(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/main/popup/write");
		
		String idx = Utils.checkNullString(request.getParameter("idx"));
		if (!idx.equals("")) {
			HashMap<String, Object> PrData = main_dao.getPopupInfo(idx);
			if (PrData==null) 
			{
				mav.addObject("isSuc", "fail");
				mav.addObject("msg", "부적절한 접근입니다.");
				return mav;
			}
			
			for (String key : PrData.keySet()) {
				System.out.println(key+":"+PrData.get(key));				
				mav.addObject(key, PrData.get(key));
			}
			
			mav.addObject("idx", idx);
		}
		
		return mav;
	}
	
	@RequestMapping("/main/pr/list")
	public ModelAndView pr_list(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/main/pr/list");
		
		return mav;
	}
	
	@RequestMapping("/main/pr/write")
	public ModelAndView pr_write(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/main/popup/write");
		
		return mav;
	}
	
	@RequestMapping("/main/getPopUpList")
	@ResponseBody
	public HashMap<String, Object> getPopUpList(HttpServletRequest request) {
		
		
		String order_by = Utils.checkNullString(request.getParameter("order_by"));
		String sort_type = Utils.checkNullString(request.getParameter("sort_type"));
	
		String search_name = Utils.checkNullString(request.getParameter("search_name"));
		String start_ymd = Utils.checkNullString(request.getParameter("start_ymd"));
		String end_ymd = Utils.checkNullString(request.getParameter("end_ymd"));
		String use_yn = Utils.checkNullString(request.getParameter("use_yn"));
		
		List<HashMap<String, Object>> TotallistCnt = main_dao.getPopUpListCount("","","","");
		List<HashMap<String, Object>> listCnt = main_dao.getPopUpListCount(search_name,start_ymd,end_ymd,use_yn);
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
		
		List<HashMap<String, Object>> list = main_dao.getPopUpList(s_point, listSize, order_by, sort_type,search_name,start_ymd,end_ymd,use_yn); 
		
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
	
	
	@RequestMapping("/main/write_proc")
	public ModelAndView write_pr_target(HttpServletRequest request, 
			@RequestParam(value = "detail_receipt", required = false) List<MultipartFile> detail_receipt,
			@RequestParam(value = "thumb_img", required = false) List<MultipartFile> thumb_img) throws IOException {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/main/popup/write_proc");
		try
		{
			String idx = Utils.checkNullString(request.getParameter("idx"));
			String create_date = Utils.checkNullString(request.getParameter("create_date"));
			String use_yn = Utils.checkNullString(request.getParameter("hidden_use_yn"));
			String title = Utils.checkNullString(request.getParameter("title"));
			String start_ymd = Utils.checkNullString(request.getParameter("start_ymd"));
			String end_ymd = Utils.checkNullString(request.getParameter("end_ymd"));
			String board_cont = Utils.repWord(Utils.checkNullString(request.getParameter("board_cont")));

			if(!"".equals(idx))
			{
				main_dao.uptPopupTarget(idx,create_date,use_yn,title,start_ymd,end_ymd,board_cont);
			}
			else
			{
				main_dao.insPopupTarget(create_date,use_yn,title,start_ymd,end_ymd,board_cont);
			}
			
			mav.addObject("isSuc", "success");
			mav.addObject("msg", "저장되었습니다.");
		}
		catch(Exception e)
		{
			mav.addObject("isSuc", "fail");
			mav.addObject("msg", "알 수 없는 오류 발생");
			e.printStackTrace();
		}
		
		return mav;
	}
	
	@RequestMapping("/main/getMainPrList")
	@ResponseBody
	public HashMap<String, Object> getCateList(HttpServletRequest request) {
		
		HttpSession session = request.getSession();   
		
		
		List<HashMap<String, Object>> list = main_dao.getMainPrList(); 
		HashMap<String, Object> map = new HashMap<>();
		map.put("list", list);		
		return map;
	}
	
	
	@RequestMapping("/main/del_pr_cate")
	@ResponseBody
	public HashMap<String, Object> del_pr_cate(HttpServletRequest request) {
		HashMap<String, Object> map = new HashMap<>();
		
		String idx = Utils.checkNullString(request.getParameter("idx"));
		
		main_dao.del_pr_cate(idx);
		
		map.put("msg", "삭제 되었습니다.");
		map.put("isSuc", "success");
		return map;
	}
	
	@RequestMapping("/main/add_pr_cate")
	@ResponseBody
	public HashMap<String, Object> add_pr_cate(HttpServletRequest request) {
		HashMap<String, Object> map = new HashMap<>();
		
		String idx = Utils.checkNullString(request.getParameter("idx"));
		String pr_type = Utils.checkNullString(request.getParameter("pr_type"));
		
		main_dao.add_pr_cate(idx,pr_type);
		
		map.put("msg", "저장 되었습니다.");
		map.put("isSuc", "success");
		return map;
	}
	
	@RequestMapping("/main/getMainPopPrList")
	@ResponseBody
	public HashMap<String, Object> getMainPopPrList(HttpServletRequest request) {
		
		
		String order_by = Utils.checkNullString(request.getParameter("order_by"));
		String sort_type = Utils.checkNullString(request.getParameter("sort_type"));
	
		String pr = Utils.checkNullString(request.getParameter("pr"));
		
		
		List<HashMap<String, Object>> TotallistCnt = main_dao.getMainPopPrListCount(pr);
		List<HashMap<String, Object>> listCnt = main_dao.getMainPopPrListCount(pr);
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
		
		List<HashMap<String, Object>> list = main_dao.getMainPopPrList(s_point, listSize, order_by, sort_type,pr); 
		
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
	
	@RequestMapping("/main/delTarget")
	@ResponseBody
	public HashMap<String, Object> delTarget(HttpServletRequest request) throws ParseException {
		HashMap<String, Object> map = new HashMap<>();
		HttpSession session = request.getSession();       

		String[] idx = Utils.checkNullString(request.getParameter("idx")).split("\\|");
		
		int result =0;
		for (int i = 0; i < idx.length; i++) {
			result += main_dao.delTarget(idx[i]);	
		}
		
		if (result > 0) 
		{
			map.put("isSuc", "success");
			map.put("msg", "저장 되었습니다.");
		}
		else
		{
			map.put("isSuc", "fail");
			map.put("msg", "알 수 없는 ERROR발생.");
			
		}
		
		return map;
	}
	
	@RequestMapping("/main/duplTarget")
	@ResponseBody
	public HashMap<String, Object> duplTarget(HttpServletRequest request) throws ParseException {
		HashMap<String, Object> map = new HashMap<>();
		HttpSession session = request.getSession();       
		
		String[] idx = Utils.checkNullString(request.getParameter("idx")).split("\\|");
		if (session.getAttribute("login_idx")==null) {
			map.put("isSuc", "fail");
			map.put("msg", "로그인 세션이 만료되었습니다.");
			return map;
		}
		String myidx = session.getAttribute("login_idx").toString();
		int result =0;
		for (int i = 0; i < idx.length; i++) {
			result += main_dao.duplTarget(idx[i],myidx);	
		}
		
		if (result > 0) 
		{
			map.put("isSuc", "success");
			map.put("msg", "저장 되었습니다.");
		}
		else
		{
			map.put("isSuc", "fail");
			map.put("msg", "알 수 없는 ERROR발생.");
			
		}
		
		return map;
	}
	
	
	@RequestMapping("/main/change_use_yn")
	@ResponseBody
	public HashMap<String, Object> change_use_yn(HttpServletRequest request) throws ParseException {
		HashMap<String, Object> map = new HashMap<>();
		HttpSession session = request.getSession();       
		
		String idx = Utils.checkNullString(request.getParameter("idx"));
		String use_yn = Utils.checkNullString(request.getParameter("use_yn"));
		String tbl = Utils.checkNullString(request.getParameter("tbl"));

		int result = main_dao.change_use_yn(idx,use_yn,tbl);	
		
		if (result > 0) 
		{
			map.put("isSuc", "success");
			map.put("msg", "저장 되었습니다.");
		}
		else
		{
			map.put("isSuc", "fail");
			map.put("msg", "알 수 없는 ERROR발생.");
			
		}
		
		return map;
	}
	
	@RequestMapping("/main/save_pr_cate")
	@ResponseBody
	public HashMap<String, Object> save_pr_cate(HttpServletRequest request) {
		HashMap<String, Object> map = new HashMap<>();
		
		String idx_arr[] = Utils.checkNullString(request.getParameter("idx_arr")).split("\\|");
		String order_no[] = Utils.checkNullString(request.getParameter("order_no")).split("\\|");

		for (int i = 0; i < order_no.length; i++) {
			main_dao.upt_main_cate(idx_arr[i],order_no[i]);
		}
		
		String arr[] = Utils.checkNullString(request.getParameter("arr")).split("\\|");
		String cate_title ="";
		
		map.put("msg", "저장 되었습니다.");
		map.put("isSuc", "success");
		return map;
	}
}
