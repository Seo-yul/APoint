package interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import cf.yul.apoint.vo.KakaoUserInfo;

public class MVCInterceptor extends HandlerInterceptorAdapter{

	/**
	 * return true 필터에 걸리지않고 컨트롤러대로 그대로 보낸다.
	 * return false 필터에 만족하지않아 컨트롤러의 명령대로 보내지 않는다.
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		KakaoUserInfo user = (KakaoUserInfo)session.getAttribute("userinfo");
		String loginurl="https://kauth.kakao.com/oauth/authorize?client_id=22ea902191dce54f33acf4ab9685d75a&redirect_uri=http://apoint.cf/apoint/oauth&response_type=code";
		if(user==null) {
//			response.sendRedirect(request.getContextPath()+"/");
			response.sendRedirect(loginurl);
			return false;
		}else {
			
			
			if(user.getGrade()=="admin") {
				//관리자
			}else {
				//일반유저
			}
			
			return true;
		}
		
	}

	
	
}
