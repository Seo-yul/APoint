package cf.yul.apoint.dao;


import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cf.yul.apoint.vo.AllAttendance;
import cf.yul.apoint.vo.KakaoUserInfo;

@Repository
public class KakaoDAO implements KakaoMapper {
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public KakaoUserInfo selectUserInfo(KakaoUserInfo kakaoUserInfo) {
		System.out.println("KakaoDAO : selectUserInfo");
		KakaoUserInfo userInfo;
		try {
			KakaoMapper mapper = sqlSession.getMapper(KakaoMapper.class);
			userInfo = mapper.selectUserInfo(kakaoUserInfo);
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("유저정보 불러오기 실패");
			return null;
		}
		return userInfo;
	}

	@Override
	public int insertUserInfo(KakaoUserInfo kakaoUserInfo) {
		System.out.println("KakaoDAO : insertUserInfo");
		int cnt = 0;
		try {
			KakaoMapper mapper = sqlSession.getMapper(KakaoMapper.class);
			cnt = mapper.insertUserInfo(kakaoUserInfo);
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("유저정보 저장 실패");
			return 0;
		}
		return cnt;
	}

	@Override
	public int gradeUp(KakaoUserInfo kakaoUserInfo) {
		int cnt =0;
		try {
			KakaoMapper mapper = sqlSession.getMapper(KakaoMapper.class);
			cnt = mapper.gradeUp(kakaoUserInfo);
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("유저등급 업 실패");
			return 0;
		}
		return cnt;
	}

	@Override
	public ArrayList<KakaoUserInfo> selectAllKakaoUserInfo() {
		ArrayList<KakaoUserInfo> arryAllKakaoUserInfo;
		try {
			KakaoMapper mapper = sqlSession.getMapper(KakaoMapper.class);
			arryAllKakaoUserInfo = mapper.selectAllKakaoUserInfo();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("모든유저정보 불러오기 실패");
			return null;
		}
		return arryAllKakaoUserInfo;
	}

}
