package cellivery.admin.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.MalformedURLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sound.midi.Synthesizer;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import cellivery.admin.model.PrDAO;
import cellivery.classes.FileUtils;
import cellivery.classes.Utils;
import cellivery.front.model.FrontDAO;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

@Controller
@RequestMapping("/admin/pr/*")
public class PrController {
	
	@Value("${spring.config.activate.on-profile}")
	private String env;
	
	@Autowired
	private PrDAO pr_dao;
	

	@RequestMapping("/category/list")
	public ModelAndView category_list(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/pr/category/list");
		
		return mav;
	}
	
	@RequestMapping("/insta/list")
	public ModelAndView insta_list(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/pr/insta/list");
		
		return mav;
	}
	
	@RequestMapping("/insta/write")
	public ModelAndView insta_write(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/pr/insta/write");
		
		String idx = Utils.checkNullString(request.getParameter("idx"));
		if (!idx.equals("")) {
			HashMap<String, Object> PrData = pr_dao.getPrTargetInfo(idx,"insta");
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
	
	@RequestMapping("/media/list")
	public ModelAndView media_list(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/pr/media/list");
		
		return mav;
	}
	
	@RequestMapping("/media/write")
	public ModelAndView media_write(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/pr/media/write");
		
		String idx = Utils.checkNullString(request.getParameter("idx"));
		if (!idx.equals("")) {
			HashMap<String, Object> PrData = pr_dao.getPrTargetInfo(idx,"media");
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
	
	@RequestMapping("/notice/list")
	public ModelAndView notice_list(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/pr/notice/list");
		
		return mav;
	}
	
	@RequestMapping("/notice/write")
	public ModelAndView notice_write(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/pr/notice/write");
		
		String idx = Utils.checkNullString(request.getParameter("idx"));
		if (!idx.equals("")) {
			HashMap<String, Object> PrData = pr_dao.getPrTargetInfo(idx,"notice");
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
	
	@RequestMapping("/news/list")
	public ModelAndView news_list(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/pr/news/list");
		
		return mav;
	}
	
	@RequestMapping("/news/write")
	public ModelAndView news_write(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/pr/news/write");
		
		String idx = Utils.checkNullString(request.getParameter("idx"));
		if (!idx.equals("")) {
			HashMap<String, Object> PrData = pr_dao.getPrTargetInfo(idx,"news");
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
	
	@RequestMapping("/youtube/list")
	public ModelAndView youtube_list(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/pr/youtube/list");
		
		return mav;
	}
	
	@RequestMapping("/youtube/write")
	public ModelAndView youtube_write(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/pr/youtube/write");
		
		String idx = Utils.checkNullString(request.getParameter("idx"));
		if (!idx.equals("")) {
			HashMap<String, Object> PrData = pr_dao.getPrTargetInfo(idx,"youtube");
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
	
	
	@RequestMapping("/category/getCateList")
	@ResponseBody
	public HashMap<String, Object> getCateList(HttpServletRequest request) {
		
		HttpSession session = request.getSession();   
		
		
		List<HashMap<String, Object>> list = pr_dao.getCateList(); 
		HashMap<String, Object> map = new HashMap<>();
		map.put("list", list);		
		return map;
	}
	
	@RequestMapping("/category/save_pr_cate")
	@ResponseBody
	public HashMap<String, Object> save_pr_cate(HttpServletRequest request) {
		HashMap<String, Object> map = new HashMap<>();
		
		String idx_arr[] = Utils.checkNullString(request.getParameter("idx_arr")).split("\\|");
		String order_no[] = Utils.checkNullString(request.getParameter("order_no")).split("\\|");

		for (int i = 0; i < order_no.length; i++) {
			pr_dao.upt_main_cate(idx_arr[i],order_no[i]);
		}
		
		String arr[] = Utils.checkNullString(request.getParameter("arr")).split("\\|");
		String cate_title ="";
		
		for (int i = 0; i < arr.length; i++) 
		{
			cate_title = arr[i];
			if (!cate_title.equals("")) 
			{
				pr_dao.save_pr_cate(cate_title);
			}
		}
		
		List<HashMap<String, Object>> list = pr_dao.getCateList(); 
		map.put("list", list);		
		map.put("msg", "저장 되었습니다.");
		map.put("isSuc", "success");
		return map;
	}
	
	
	@RequestMapping("/category/del_pr_cate")
	@ResponseBody
	public HashMap<String, Object> del_pr_cate(HttpServletRequest request) {
		HashMap<String, Object> map = new HashMap<>();
		
		String idx = Utils.checkNullString(request.getParameter("idx"));
		
		pr_dao.del_pr_cate(idx);
		
		map.put("msg", "삭제 되었습니다.");
		map.put("isSuc", "success");
		return map;
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
		
		List<HashMap<String, Object>> TotallistCnt = pr_dao.getPrTargetListCount("","","","","",tbl);
		List<HashMap<String, Object>> listCnt = pr_dao.getPrTargetListCount(search_name,start_ymd,end_ymd,cate,use_yn,tbl);
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
		
		List<HashMap<String, Object>> list = pr_dao.getPrTargetList(s_point, listSize, order_by, sort_type,search_name,start_ymd,end_ymd,cate,use_yn,tbl); 
		
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
		String tbl = Utils.checkNullString(request.getParameter("tbl"));
		
		int result =0;
		for (int i = 0; i < idx.length; i++) {
			result += pr_dao.delTarget(idx[i],tbl);	
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
		String tbl = Utils.checkNullString(request.getParameter("tbl"));
		if (session.getAttribute("login_idx")==null) {
			map.put("isSuc", "fail");
			map.put("msg", "로그인 세션이 만료되었습니다.");
			return map;
		}
		String myidx = session.getAttribute("login_idx").toString();
		int result =0;
		for (int i = 0; i < idx.length; i++) {
			result += pr_dao.duplTarget(idx[i],tbl,myidx);	
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
	
	@RequestMapping("/ckeditor_upload")
	@ResponseBody
	public void ckeditor_upload(HttpServletRequest request, HttpServletResponse resp, @RequestParam("upload") List<MultipartFile> upload) throws Exception {
		
		
		try
		{
			HashMap<String, String> attachList = FileUtils.fileUpload(upload, "ckeditor", env); //파일리스트, 업로드폴더명
	
			System.out.println("attachList:" + attachList);
			
			HashMap<String, Object> map = new HashMap<>();
			
			String file_ori = Utils.checkNullString(attachList.get("oriFilename"));
			boolean file_chk = Utils.isPermissionFileExt(Utils.checkNullString(attachList.get("oriFilename")));

			System.out.println("file ori : " + file_ori);
			System.out.println("file chk : " + file_chk);
			
			if (!file_chk && !file_ori.equals(""))
			{
				throw new Exception();
			}
			
			map.put("thumb", Utils.checkNullString(attachList.get("filename")));
			map.put("thumb_ori", Utils.checkNullString(attachList.get("oriFilename")));
			
			JSONObject json = new JSONObject();
			
			System.out.println("Utils.checkNullString(attachList.get(\"filename\") : "+Utils.checkNullString(attachList.get("filename")));
	        String fileUrl = Utils.checkNullString(attachList.get("filename"));
	        fileUrl = fileUrl.replace("/src/main/resources/static", "");
	        json.put("uploaded", 1);
	        json.put("fileName", Utils.checkNullString(attachList.get("filename")));
	        json.put("url", fileUrl);
	        System.out.println("fileurl : "+fileUrl);
	        
	        
	        PrintWriter printWriter = resp.getWriter();
	        printWriter.println(json);
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}
	

	@RequestMapping("/write_pr_target")
	public ModelAndView write_pr_target(HttpServletRequest request, 
			@RequestParam(value = "detail_receipt", required = false) List<MultipartFile> detail_receipt,
			@RequestParam(value = "thumb_img", required = false) List<MultipartFile> thumb_img) throws IOException {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/pr/write_proc");
		try
		{
			String idx = Utils.checkNullString(request.getParameter("idx"));
			String tbl = Utils.checkNullString(request.getParameter("tbl"));
			String create_date = Utils.checkNullString(request.getParameter("create_date"));
			String use_yn = Utils.checkNullString(request.getParameter("hidden_use_yn"));
			String cate_list = Utils.checkNullString(request.getParameter("cate_list"));
			String title = Utils.repWord(Utils.checkNullString(request.getParameter("title")));
			String board_cont = Utils.repWord(Utils.checkNullString(request.getParameter("board_cont")));
			String url = Utils.checkNullString(request.getParameter("url"));
			//String board_cont = Utils.checkNullString(request.getParameter("board_cont"));
			String up_show_yn = Utils.checkNullString(request.getParameter("hidden_up_show_yn"));
			String file_nm ="";
			String file_ori_nm="";
			String thumb_nm ="";
			String thumb_ori_nm="";
			
			HttpSession session = request.getSession();   
			if (session.getAttribute("login_idx")==null) {
				mav.addObject("isSuc", "fail");
				mav.addObject("msg", "로그인 세션이 만료되었습니다.");
				return mav;
			}
			
			String myidx = session.getAttribute("login_idx").toString();
			
			if(thumb_img != null)
			{
				HashMap<String, String> attachList = FileUtils.fileUpload(thumb_img, tbl, env); //파일리스트, 업로드폴더명
				System.out.println("attachList:" + attachList);
				
				String file_ori = Utils.checkNullString(attachList.get("oriFilename"));
				boolean file_chk = Utils.isPermissionFileExt(Utils.checkNullString(attachList.get("oriFilename")));
				System.out.println("thumb ori : " + file_ori);
				System.out.println("thumb chk : " + file_chk);
				
				if (!file_chk && !file_ori.equals(""))
				{
					mav.addObject("isSuc", "fail");
					mav.addObject("msg", "업로드 불가능한 파일입니다.");
					return mav;
				}
				thumb_nm = Utils.checkNullString(attachList.get("filename"));
				thumb_ori_nm = Utils.checkNullString(attachList.get("oriFilename"));
			}

			if(detail_receipt != null)
			{
				HashMap<String, String> attachList = FileUtils.fileUpload(detail_receipt, "notice", env); //파일리스트, 업로드폴더명
				System.out.println("attachList:" + attachList);
				
				String file_ori = Utils.checkNullString(attachList.get("oriFilename"));
				boolean file_chk = Utils.isPermissionFileExt(Utils.checkNullString(attachList.get("oriFilename")));
				System.out.println("file ori : " + file_ori);
				System.out.println("file chk : " + file_chk);
				
				if (!file_chk && !file_ori.equals(""))
				{
					mav.addObject("isSuc", "fail");
					mav.addObject("msg", "업로드 불가능한 파일입니다.");
					return mav;
				}
				
				file_nm = Utils.checkNullString(attachList.get("filename"))+"|";
				file_ori_nm = Utils.checkNullString(attachList.get("oriFilename"))+"|";
				System.out.println("first ori_nm : "+file_ori_nm);
				
			}
			
			if(!"".equals(idx))
			{
				HashMap<String, Object> data = pr_dao.getPrTargetInfo(idx,tbl);
				if(data != null)
				{
					if(tbl.equals("notice"))
					{
						String[] hidden_file_nm_arr = Utils.checkNullString(request.getParameter("hidden_file_nm_arr")).split("\\|");
						String[] db_file_nm =Utils.checkNullString(data.get("file")).split("\\|");
						String[] db_file_ori_nm = Utils.checkNullString(data.get("file_ori")).split("\\|");
						String[] uploadname =file_nm.split("\\|");
						String[] uploadname_ori =file_ori_nm.split("\\|");
						
						file_nm="";
						file_ori_nm="";
						
						System.out.println("here is notice zone");
						System.out.println("hidden_file_nm_arr len : "+hidden_file_nm_arr.length);
						int upload_cnt=0;
						for (int i = 0; i < hidden_file_nm_arr.length; i++) {
							System.out.println("hidden_file_nm_arr len : "+hidden_file_nm_arr[i]);
							boolean db = Arrays.asList(db_file_ori_nm).contains(hidden_file_nm_arr[i]);
							if (!db)
							{
								System.out.println("new**************************************");
								file_nm +=uploadname[upload_cnt]+"|";
								file_ori_nm +=uploadname_ori[upload_cnt]+"|";
								
								System.out.println("file_ori_nm : "+file_ori_nm);
								System.out.println("uploadname : "+uploadname_ori[upload_cnt]);
								

								upload_cnt++;
							}
							else if(db)
							{
								System.out.println("기존**************************************");
								for (int j = 0; j < db_file_ori_nm.length; j++) {
									if (hidden_file_nm_arr[i].equals(db_file_ori_nm[j])) {							
										file_nm +=db_file_nm[j]+"|";
										file_ori_nm +=db_file_ori_nm[j]+"|";
									}
								}
							}
						}
					}
					
					String hidden_thumb_nm = Utils.checkNullString(request.getParameter("hidden_thumb_nm"));
					String db_thumb_nm =Utils.checkNullString(data.get("thumb"));
					String db_thumb_ori_nm=Utils.checkNullString(data.get("thumb_ori"));
					if (hidden_thumb_nm.equals(db_thumb_ori_nm)) 
					{
						thumb_nm = db_thumb_nm;
						thumb_ori_nm = db_thumb_ori_nm;
					}
					pr_dao.uptPrTarget(idx,create_date,use_yn,cate_list,title,board_cont,up_show_yn,file_nm,file_ori_nm,thumb_nm,thumb_ori_nm,tbl,url,myidx);
				}
			}
			else
			{
				pr_dao.insPrTarget(create_date,use_yn,cate_list,title,board_cont,up_show_yn,file_nm,file_ori_nm,thumb_nm,thumb_ori_nm,tbl,url,myidx);
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
	
	
	
	
}
