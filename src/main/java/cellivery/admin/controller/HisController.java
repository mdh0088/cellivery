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

import cellivery.admin.model.HisDAO;
import cellivery.admin.model.MainDAO;
import cellivery.classes.FileUtils;
import cellivery.classes.Utils;


@Controller
@RequestMapping("/admin/history/*")
public class HisController {
	
	@Value("${spring.config.activate.on-profile}")
	private String env;
	
	@Autowired
	private HisDAO his_dao;
	


	
	@RequestMapping("/list")
	public ModelAndView popup_list(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/history/list");
		
		return mav;
	}
	

	@RequestMapping("/write")
	public ModelAndView pr_write(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/history/write");
		
		String idx = Utils.checkNullString(request.getParameter("idx"));
		if (!idx.equals("")) {
			HashMap<String, Object> PrData = his_dao.getHistTargetInfo(idx);
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
	
	@RequestMapping("/getHistoryList")
	@ResponseBody
	public HashMap<String, Object> getPopUpList(HttpServletRequest request) {
		
		
		String order_by = Utils.checkNullString(request.getParameter("order_by"));
		String sort_type = Utils.checkNullString(request.getParameter("sort_type"));
	
		String search_name = Utils.checkNullString(request.getParameter("search_name"));
		String start_ymd = Utils.checkNullString(request.getParameter("start_ymd"));
		String end_ymd = Utils.checkNullString(request.getParameter("end_ymd"));
		String use_yn = Utils.checkNullString(request.getParameter("use_yn"));
		
		List<HashMap<String, Object>> TotallistCnt = his_dao.getHistoryListCount("","","","");
		List<HashMap<String, Object>> listCnt = his_dao.getHistoryListCount(search_name,start_ymd,end_ymd,use_yn);
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
		
		List<HashMap<String, Object>> list = his_dao.getHistoryList(s_point, listSize, order_by, sort_type,search_name,start_ymd,end_ymd,use_yn); 
		
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
	
	
	@RequestMapping("/delTarget")
	@ResponseBody
	public HashMap<String, Object> delTarget(HttpServletRequest request) throws ParseException {
		HashMap<String, Object> map = new HashMap<>();
		HttpSession session = request.getSession();       

		String[] idx = Utils.checkNullString(request.getParameter("idx")).split("\\|");
		
		int result =0;
		for (int i = 0; i < idx.length; i++) {
			result += his_dao.delTarget(idx[i]);	
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
	
	@RequestMapping("/duplTarget")
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
			result += his_dao.duplTarget(idx[i],myidx);	
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
	
	@RequestMapping("/write_his_target")
	public ModelAndView write_pr_target(HttpServletRequest request) throws IOException {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/history/write_proc");
		try
		{
			String idx = Utils.checkNullString(request.getParameter("idx"));
			String create_date = Utils.checkNullString(request.getParameter("create_date"));
			String use_yn = Utils.checkNullString(request.getParameter("hidden_use_yn"));
			String title_year = Utils.checkNullString(request.getParameter("title_year"));
			String hidden_title_year = Utils.checkNullString(request.getParameter("hidden_title_year"));
			String[] history_ymd_arr = Utils.checkNullString(request.getParameter("history_ymd")).split("\\|");
			//String[] history_cont_arr = Utils.repWord(Utils.checkNullString(request.getParameter("history_cont"))) ;
			String[] history_cont_arr = Utils.checkNullString(request.getParameter("history_cont")).split("\\|");
			String[] effect_yn_arr = Utils.checkNullString(request.getParameter("effect_yn")).split("\\|");
			String[] logo_yn_arr = Utils.checkNullString(request.getParameter("logo_yn")).split("\\|");

			
			List<HashMap<String, Object>> yearChk = his_dao.getHistTargetInfoBy_year(title_year);
			if (yearChk.size() > 0 && idx.equals("")) 
			{
			
				mav.addObject("isSuc", "fail");
				mav.addObject("msg", "이미 등록된 연도가 있습니다.");
				return mav;
			}
			
			if (yearChk.size() > 0 && !idx.equals("") && !title_year.equals(hidden_title_year))
			{
				System.out.println("title : "+title_year);
				System.out.println("hidden_title_year : "+hidden_title_year);
				mav.addObject("isSuc", "fail");
				mav.addObject("msg", "이미 등록된 연도가 있습니다.");
				return mav;
			}

			
			if(!"".equals(idx))
			{
				his_dao.delHistoryTarget(idx);
				his_dao.uptHistory(idx,create_date,title_year,use_yn);
			}
			else
			{

				idx = his_dao.getHistoryMax_idx().get("idx").toString();
				his_dao.insHistory(idx,create_date,title_year,use_yn);
			}
			
			if (logo_yn_arr.length > 0) 
			{
				for (int i = 0; i < logo_yn_arr.length; i++) {
					if (!Utils.checkNullString(logo_yn_arr[i]).equals("")) 
					{
						history_cont_arr[i] = Utils.repWord(history_cont_arr[i]);
						his_dao.insHistoryTarget(idx,history_ymd_arr[i],history_cont_arr[i],effect_yn_arr[i],logo_yn_arr[i]);						
					}
				}
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
	
	
	@RequestMapping("/getHistoryTargetList")
	@ResponseBody
	public HashMap<String, Object> getHistoryTargetList(HttpServletRequest request) {
		
		String idx = Utils.checkNullString(request.getParameter("idx"));
		
		List<HashMap<String, Object>> list = his_dao.getHistoryTargetList(idx);
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("list", list);

		
		return map;
	}
}
