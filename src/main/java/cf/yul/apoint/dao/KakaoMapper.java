package cf.yul.apoint.dao;

import java.util.ArrayList;

import cf.yul.apoint.vo.KakaoUserInfo;


public interface KakaoMapper {
	public KakaoUserInfo selectUserInfo(KakaoUserInfo kakaoUserInfo);
	public int insertUserInfo(KakaoUserInfo kakaoUserInfo);
	public int gradeUp(KakaoUserInfo kakaoUserInfo);
	public ArrayList<KakaoUserInfo> selectAllKakaoUserInfo();
}
