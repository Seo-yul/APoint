package cf.yul.apoint.api;

import java.util.Collections;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import cf.yul.apoint.vo.KakaoUserInfo;

public class KakaoApi {
	private String grant_type = "authorization_code";
	private String client_id = "22ea902191dce54f33acf4ab9685d75a";
	private String redirect_uri= "http://apoint.cf/apoint/oauth";
	private String client_secret = "aWLqJ6HfUC7reOGi93xncgYxF7iSBxbr";
	
	public KakaoUserInfo getUserInfo(String access_token) {
		System.out.println("유저 정보요청");
		String url = "https://kapi.kakao.com/v2/user/me";
		RestTemplate client = new RestTemplate(); // RestTemplate으로 파싱하기 위함
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "Bearer "+access_token);
		HttpEntity<String> entity = new HttpEntity<String>("parameters", headers);
		try {
			ResponseEntity<String> infoResponse = client.exchange(url, HttpMethod.GET, entity, String.class);
			String userInfoResponse = infoResponse.getBody();
			JSONParser jParser = new JSONParser();
			JSONObject jObject = new JSONObject();
			jObject = (JSONObject) jParser.parse(userInfoResponse);
			String userID = jObject.get("id").toString();
			JSONObject JSONproperties = (JSONObject)jObject.get("properties");
			String nickname = JSONproperties.get("nickname").toString();
			String thumbnail_image = "";
			try {
				thumbnail_image = JSONproperties.get("thumbnail_image").toString();
			} catch (Exception e) {
				thumbnail_image = "http://www.apoint.cf/apoint/resources/images/favicon.ico";
			}
			
			KakaoUserInfo kakaoUserInfo = new KakaoUserInfo(userID, nickname, thumbnail_image,null);
			
			return kakaoUserInfo;
	} catch (Exception e) {
			System.out.println("에러");
			return null;
		}
	}
	/**
	 * @param access_token 로그아웃 할 유저의 토큰
	 * @return 퇴근
	 */
	public void doUserLogout(String access_token) {
		System.out.println("유저 로그아웃");
		String url = "https://kapi.kakao.com/v1/user/logout";
		RestTemplate client = new RestTemplate(); // RestTemplate으로 파싱하기 위함
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "Bearer "+access_token);
		HttpEntity<String> entity = new HttpEntity<String>("parameters", headers);
		try {
			ResponseEntity<String> logoutResponse = client.exchange(url, HttpMethod.POST, entity, String.class);
			System.out.println(logoutResponse.getBody());
	} catch (Exception e) {
			System.out.println("에러");
		}
	}
	
	
	/**
	 * @param code 페이지 클라이언트 코드
	 * @return 카카오계정 로그인의 토큰
	 */
	public String getUserToken(String code) {
		System.out.println("토큰가져오기");
		String url = "https://kauth.kakao.com/oauth/token";
		RestTemplate client = new RestTemplate(); // RestTemplate으로 파싱하기 위함
		MultiValueMap<String, String> parameters = new LinkedMultiValueMap<String, String>();

		parameters.add("grant_type", grant_type);
		parameters.add("client_id", client_id);
		parameters.add("redirect_uri", redirect_uri);
		parameters.add("code", code);

		try {
			String responseUserToken = client.postForObject(url, parameters, String.class);
			return responseUserToken;
		} catch (Exception e) {
			System.out.println("에러");
			return null;
		}
	}
}
