package cellivery.admin.controller;

import java.io.IOException;
import java.net.MalformedURLException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cellivery.front.model.FrontDAO;
import cellivery.admin.model.UserDAO;
import cellivery.classes.Utils;


@Controller
@RequestMapping("/admin")
public class UserController {
	
	@Autowired
	private UserDAO user_dao;
	
	/*
	@RequestMapping("/")
	public ModelAndView front_index(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/index");
		
		front_dao.test();
		
		return mav;
	}
	*/
	
	@RequestMapping("/user/login")
	public ModelAndView login(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/user/login");
		
		return mav;
	}
	
	@RequestMapping("/user/login_proc")
	public ModelAndView login_proc(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/user/login_proc");
		
		String login_user_id = Utils.checkNullString(request.getParameter("login_user_id"));
		String login_pw = Utils.encrypt(Utils.checkNullString(request.getParameter("login_pw")));
		String ip = Utils.getClientIP(request);	
		//login_pw = Utils.getHashString(login_pw);
		
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		data = user_dao.loginCheck(login_user_id, login_pw);
		if(data != null)
		{ 
				String ip_addr = Utils.getClientIP(request);
				System.out.println("로그인 아이피 : "+ip_addr);
				//int ipCnt = ip_dao.login_ipCheck(ip_addr);
				//if(ipCnt == 0)
				//{
				//	mav.addObject("isSuc", "fail");
				//	mav.addObject("msg", "허용되지않은 IP입니다.");
				//}
				//else
				//{
					mav.addObject("isSuc", "success");
					HttpSession session = request.getSession();
					
					session.setAttribute("login_idx", data.get("idx"));
					session.setAttribute("login_user_id", data.get("id"));
					session.setAttribute("login_name", data.get("name"));
					session.setAttribute("is_manager", data.get("is_manager"));
					session.setAttribute("my_ip", ip);
					mav.addObject("isSuc", "success");
					mav.addObject("msg", "환영합니다.");
					
					user_dao.update_popup_to_n();
				//}
		}
		else
		{	
			mav.addObject("isSuc", "fail");
			mav.addObject("msg", "로그인에 실패하였습니다.");
		}
		return mav;
	}
	
	@RequestMapping("/user/join")
	public ModelAndView join(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/user/join");
		
		String idx = Utils.checkNullString(request.getParameter("idx"));
		if (!idx.equals("")) 
		{
			HashMap<String, Object> data = user_dao.getUserInfoForEdit(idx);
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
	
	
	// 게시판 목록 조회
	@RequestMapping("/user/join_proc")
	@ResponseBody
	public HashMap<String, Object> join_proc(HttpServletRequest request){
		HashMap<String, Object> map = new HashMap<>();

		String idx = Utils.checkNullString(request.getParameter("idx"));
		String user_nm = Utils.checkNullString(request.getParameter("user_nm"));
		String user_id = Utils.checkNullString(request.getParameter("user_id"));
		String user_pw = Utils.encrypt(Utils.checkNullString(request.getParameter("user_pw")));
		String user_email = Utils.checkNullString(request.getParameter("user_email"));
		String user_phone = Utils.checkNullString(request.getParameter("user_phone"));
		
		
		if (!idx.equals("")) 
		{
			user_dao.uptUserInfo(idx,user_nm,user_id,user_pw,user_email,user_phone);
		}
		else
		{
			HashMap<String, Object> data = user_dao.user_id_chk(user_id);
			if (data!=null) 
			{
				map.put("msg", "이미 가입된 아이디가 있습니다.");
				return map;
			}
			user_dao.insUser(user_nm,user_id,user_pw,user_email,user_phone);
		}
		
		map.put("msg", "저장 되었습니다.");
		return map;
	}
	
	@RequestMapping("/user/logout")
	public ModelAndView logout(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/user/logout");
		
		HttpSession session = request.getSession();
		session.invalidate();
		
		return mav;
	}
	
	
	@RequestMapping("/user/mypage")
	public ModelAndView mypage(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/user/mypage");
		HttpSession session = request.getSession();    
		if (session.getAttribute("login_idx")==null) {
			mav.addObject("isSuc", "fail");
			mav.addObject("msg", "로그인 세션이 만료되었습니다.");
			return mav;
		}
		
		String idx = session.getAttribute("login_idx").toString();
		if (!idx.equals("")) 
		{
			HashMap<String, Object> data = user_dao.getUserInfoForEdit(idx);
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
	
	@RequestMapping("/user/list")
	public ModelAndView user_list(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/user/list");
	
		return mav;
	}
	
	
	@RequestMapping("/user/getUserList")
	@ResponseBody
	public HashMap<String, Object> getPrTargetList(HttpServletRequest request) {
		
		
		String order_by = Utils.checkNullString(request.getParameter("order_by"));
		String sort_type = Utils.checkNullString(request.getParameter("sort_type"));
		
		List<HashMap<String, Object>> TotallistCnt = user_dao.getUserListCount();
		List<HashMap<String, Object>> listCnt = user_dao.getUserListCount();
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
		
		List<HashMap<String, Object>> list = user_dao.getUserList(s_point, listSize, order_by, sort_type); 
		
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
	
	
}
