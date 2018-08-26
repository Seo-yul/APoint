package cf.yul.apoint.vo;

public class KanjiRank {
	
	private String kanji;
	private String kor;
	private String counter;
	
	public String getKanji() {
		return kanji;
	}
	
	public KanjiRank(String kanji, String kor, String counter) {
		super();
		this.kanji = kanji;
		this.kor = kor;
		this.counter = counter;
	}


	public KanjiRank() {
		super();
	}

	public void setKanji(String kanji) {
		this.kanji = kanji;
	}
	public String getKor() {
		return kor;
	}
	public void setKor(String kor) {
		this.kor = kor;
	}
	public String getCounter() {
		return counter;
	}
	public void setCounter(String counter) {
		this.counter = counter;
	}

	@Override
	public String toString() {
		return "KanjiRank [kanji=" + kanji + ", kor=" + kor + ", counter=" + counter + "]";
	}
	
}
