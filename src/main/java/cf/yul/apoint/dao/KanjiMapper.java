package cf.yul.apoint.dao;

import java.util.ArrayList;

import cf.yul.apoint.vo.KanjiRank;


public interface KanjiMapper {
	public int insertKanjiRank(KanjiRank kanjirank);
	public int updateKanjiRank(String kanji);
	public KanjiRank selectKanjiRank(String kanji);
	public ArrayList<KanjiRank> selectAllKanjiRank();
}
