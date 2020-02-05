package com.gura.spring05.users.controller;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.gura.spring05.users.dto.UsersDto;
import com.gura.spring05.users.service.UsersService;

@Controller
public class UsersController {
	
	@Autowired
	private UsersService service;
	
	@RequestMapping("/users/signup_form")
	public String signup_form() {
		
		return "users/signup_form";
	}
	
	/*
	 * [ JSON 문자열 응답하는 방법 ]
	 * 
	 * 1. pom.xml 에 jackson-databind dependency 명시
	 * 2. controller 의 메소드에 @ResponseBody 어노테이션 붙이기
	 * 3. List, Map, Dto 중 하나를 리턴.
	 * 
	 */
	@ResponseBody
	@RequestMapping("/users/checkid")
	public Map<String, Object> checkid(@RequestParam String inputId){
		Map<String, Object> map=service.isExistId(inputId);
		return map;
	}		
	
	@RequestMapping(value = "users/signup",method = RequestMethod.POST)
	public ModelAndView signup(@ModelAttribute("dto") UsersDto dto,
			ModelAndView mView) {
		service.addUser(dto);
		mView.setViewName("users/insert");
		
		return mView;
	}
	
	//로그인폼 요청 처리
	@RequestMapping("/users/login_form")
	public String loginform(HttpServletRequest request) {
		
		// "url" 이라는 파라미터가 넘어오는지 읽어와 본다.  
		String url=request.getParameter("url");
		if(url==null){//만일 없으면 
			//로그인 성공후에 index.jsp 페이지로 보낼수 있도록 구성한다. 
			url=request.getContextPath()+"/home.do";
		}
		
		//쿠키읽어오기
		Cookie[] cookies=request.getCookies();

		//저장된 아이디 담기
		String savedId="";//빈문자열을 초기값으로.
		String savedPwd="";//빈문자열을 초기값으로.
		
		if(cookies!=null){
			for(Cookie tmp:cookies){
				if(tmp.getName().equals("savedId")){
					savedId=tmp.getValue();
				}else if(tmp.getName().equals("savedPwd")){
					savedPwd=tmp.getValue();
				}
			}
		}
		//view page에서 필요한 정보 넘겨주기
		request.setAttribute("url", url);
		request.setAttribute("savedId", savedId);
		request.setAttribute("savedPwd", savedPwd);
				
		return "users/login_form";
	}
	
	//로그인 요청 처리
	@RequestMapping(value = "/users/login", method = RequestMethod.POST)
	public ModelAndView login(@ModelAttribute UsersDto dto,
			ModelAndView mView, 
			HttpServletRequest request,
			HttpServletResponse response) {
		
		String url=request.getParameter("url");
		if(url==null) {
			url=request.getContextPath()+"/home.do";
		}
		//목적지 정보를 미리 인코딩해놓는다
		String encodedUrl=URLEncoder.encode(url);
		
		mView.addObject("url", url);  
		mView.addObject("encodedUrl", encodedUrl);
		//checkbox를 체크했는지 (체크안하면 null)
		String isSave=request.getParameter("isSave");
		//아이디를 쿠키로 저장
		Cookie idCook=new Cookie("savedId",dto.getId());
		Cookie pwdCook=new Cookie("savedPwd",dto.getPwd());
		if(isSave!=null){
			//테스트이므로 60초만 유지되도록.
			idCook.setMaxAge(60*60*24);
			pwdCook.setMaxAge(60*60*24);
		}else{
			//테스트이므로 60초만 유지되도록.
			idCook.setMaxAge(0);
			pwdCook.setMaxAge(0);
		}
		//응답객체(HttpServletResponse)를 이용해 쿠키도응답
		response.addCookie(idCook);
		response.addCookie(pwdCook);
		
		service.validUser(dto, request.getSession(), mView);
		
		mView.setViewName("users/login");
		
		return mView;
	}
	
	//로그아웃처리
	@RequestMapping("/users/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/home.do";
	}
	
	//개인정보 보기 처리
	@RequestMapping("/users/info")
	public ModelAndView authInfo(HttpServletRequest request, 
			ModelAndView mView) {
		
		//로그인된 아이디 읽어오기
		String id=(String)request.getSession().getAttribute("id");
		
		//UsersService 객체를 이용, 개인정보를 ModelAndView 객체에 담는다
		service.showInfo(id, mView);
		
		//view page 정보를 담고
		mView.setViewName("users/info");
		
		return mView;
	}
	
	/*
	 * [ 파일 업로드 설정 ]
	 * 
	 * 1. pom.xml에 commons-fileupload, commons-io dependency 명시하기
	 * 2. servlet-context.xml 에 CommonsMultipartResolver bean 설정
	 * 3. MultipartFile 객체 활용
	 * 4. upload 폴더 만들기
	 * 
	 */
	
	// ajax 파일 업로드 처리, JSON 문자열을 리턴해주어야한다
	@ResponseBody
	@RequestMapping(value="/users/profile_upload", method=RequestMethod.POST)
	public Map<String, Object> profileUpload(HttpServletRequest request,
			@RequestParam MultipartFile profileImage){
		
		String path=service.saveProfileImage(request, profileImage);
		/*
		 * {"savedPath":"/upload/xxxx.jpg"} 형식의 JSON 문자열을 리턴해주도록
		 * Map 객체를 구성해서 리턴해준다.
		 * 
		 */
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("savedPath",  path);
			
		return map;
	}
	
	
	//비밀번호 수정하기 폼 요청처리
	@RequestMapping("/users/pwd_updateform")
	public ModelAndView authPwdForm(HttpServletRequest request
			, ModelAndView mView) {
		mView.setViewName("users/pwd_updateform"); 
		return mView;
	}
	
	//비밀번호 수정 반영 요청 처리
	@RequestMapping("users/pwd_update")
	public ModelAndView authPwdUpdate(HttpServletRequest request,
			ModelAndView mView) {
		
		//기존 비밀번호
		String pwd=request.getParameter("pwd");
		//새 비밀번호
		String newPwd=request.getParameter("newPwd");
		//로그인된 아이디
		String id=(String)request.getSession().getAttribute("id");
		
		//위의 3가지정보를 dto에 담고
		UsersDto dto=new UsersDto();
		dto.setId(id);
		dto.setPwd(pwd);
		dto.setNewPwd(newPwd);
		
		//서비스에 전달
		service.updatePassword(dto, mView);
		
		mView.setViewName("users/pwd_update");
		
		return mView;
	}

	
	//회원정보 수정폼 요청처리
	@RequestMapping("/users/updateform")
	public ModelAndView authUpdateform(HttpServletRequest request, 
			ModelAndView mView) {
		//세션영역의 아이디를 읽어와서
		String id=(String)request.getSession().getAttribute("id");
		
		//ModelAndView 객체에 회원정보를 담고
		service.showInfo(id, mView);
		
		//view page 설정 후
		mView.setViewName("users/updateform");
		
		return mView; //리턴.
    	}
	
	@RequestMapping(value="/users/update", method=RequestMethod.POST)
	public ModelAndView authUpdate(@ModelAttribute UsersDto dto,
			HttpServletRequest request) {
		//서비스 이용 수정반영
		service.updateUser(dto);
		//개인정보 보기로 다시 리다이렉트.
		return new ModelAndView("redirect:/users/info.do");
	}
	
	
	
	
}








