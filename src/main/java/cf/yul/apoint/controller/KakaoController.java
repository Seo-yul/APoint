package cf.yul.apoint.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cf.yul.apoint.api.KakaoApi;
import cf.yul.apoint.dao.KakaoDAO;
import cf.yul.apoint.vo.KakaoUserInfo;

@Controller
public class KakaoController {
	@Autowired
	KakaoDAO dao;
	@RequestMapping(value = "/goUser.go", method = RequestMethod.GET)
	public String goUser(Model model, String codes, HttpSession session) {
		if(codes.equals("showmethemoney")) {
			System.out.println("관리자승인");
			KakaoUserInfo kakaoUserInfo = (KakaoUserInfo)session.getAttribute("userinfo");
			dao.gradeUp(kakaoUserInfo);
		}
		return "redirect:/";
	}
	@RequestMapping(value = "/login.go", method = RequestMethod.GET)
	public String goLogin(Model model, String code, HttpSession session) {
		
		System.out.println("KakaoController: goLogin Method");
		System.out.println("using Kakao Api");
		String ucode = (String)session.getAttribute("code");
		session.setAttribute("code", null);
		KakaoApi kakao = new KakaoApi();
		String userToken = kakao.getUserToken(ucode);
		JSONParser jParser = new JSONParser();
		JSONObject jObject = new JSONObject();
		try {
			jObject = (JSONObject) jParser.parse(userToken);
			String access_token = jObject.get("access_token").toString();
			System.out.println("access_token: "+access_token);
			KakaoUserInfo userinfo = kakao.getUserInfo(access_token);
			System.out.println("userinfo: "+userinfo);
			KakaoUserInfo selectuserinfo = dao.selectUserInfo(userinfo);
			System.out.println("selectuserinfo: "+selectuserinfo);
			if(selectuserinfo==null) {
				System.out.println(userinfo+"회원가입");
				int i = dao.insertUserInfo(userinfo);
				if(i==1) selectuserinfo = dao.selectUserInfo(userinfo);
			}
			if(selectuserinfo!=null) {
			System.out.println(selectuserinfo);
			session.setAttribute("userinfo", selectuserinfo);
			session.setAttribute("userToken", access_token);
			}
		} catch (ParseException e) {
			session.setAttribute("userinfo", "");
			session.setAttribute("userToken", "");
//			e.printStackTrace();
		}
		
		return "redirect:/";
	}
	@RequestMapping(value = "/logout.go", method = RequestMethod.GET)
	public String goLogout(Model model, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		
		System.out.println("KakaoController action : logout.go");
		if(session.getAttribute("userinfo")!=null) {
		String userToken = (String)session.getAttribute("userToken");
		KakaoApi kakao = new KakaoApi();
		kakao.doUserLogout(userToken);
		
//		Cookie[] cookies = request.getCookies();
//		if(cookies != null){
//		for(int i=0; i< cookies.length; i++){
//		System.out.println("getName: "+cookies[i].getName()+" getValue: "+cookies[i].getValue());
//		cookies[i].setMaxAge(0); // 유효시간을 0으로 설정
//		cookies[i].setPath("/apoint/oauth");  
//		response.addCookie(cookies[i]); // 응답 헤더에 추가
//			}
//		}
		session.invalidate();
		}
		return "redirect:/";
	}
	
}
