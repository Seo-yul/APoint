package cf.yul.apoint.dao;


import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cf.yul.apoint.vo.KanjiRank;

@Repository
public class KanjiDAO implements KanjiMapper{
	@Autowired
	SqlSession sqlSession;

	@Override
	public int insertKanjiRank(KanjiRank kanjirank) {
		int cnt =0;
		try {
			KanjiMapper mapper = sqlSession.getMapper(KanjiMapper.class);
			cnt = mapper.insertKanjiRank(kanjirank);
		} catch (Exception e) {
//			e.printStackTrace();   //한자 신규 저장 실패 업데이트로 진행
			return 0;
			}
		return cnt;
	}

	@Override
	public int updateKanjiRank(String kanji) {
		int cnt =0;
		try {
			KanjiMapper mapper = sqlSession.getMapper(KanjiMapper.class);
			cnt = mapper.updateKanjiRank(kanji);
		} catch (Exception e) {
//			e.printStackTrace();
			System.out.println("한자 업데이트 실패");
			return 0;
			}
		return cnt;
	}

	@Override
	public KanjiRank selectKanjiRank(String kanji) {
		KanjiRank kanjiRank = null;
		try {
			KanjiMapper mapper = sqlSession.getMapper(KanjiMapper.class);
			kanjiRank = mapper.selectKanjiRank(kanji);
		} catch (Exception e) {
//			e.printStackTrace();
			System.out.println("한자랭킹 셀렉 실패");
			return null;
			}
		return kanjiRank;
	}

	@Override
	public ArrayList<KanjiRank> selectAllKanjiRank() {
		// TODO Auto-generated method stub
		ArrayList<KanjiRank> arrayKanjiRank = null;
		try {
			KanjiMapper mapper = sqlSession.getMapper(KanjiMapper.class);
			arrayKanjiRank = mapper.selectAllKanjiRank();
		} catch (Exception e) {
//			e.printStackTrace();
			System.out.println("한자올랭킹 셀렉 실패");
			return arrayKanjiRank;
			}
		
		return arrayKanjiRank;
	}
	

}
