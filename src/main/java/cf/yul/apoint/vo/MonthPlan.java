package cf.yul.apoint.vo;

public class MonthPlan {
	private String seq;
	private String toDo;
	private String pdate;
	
	public MonthPlan() {
		super();
	}
	public MonthPlan(String seq, String toDo, String pdate) {
		super();
		this.seq = seq;
		this.toDo = toDo;
		this.pdate = pdate;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getToDo() {
		return toDo;
	}
	public void setToDo(String toDo) {
		this.toDo = toDo;
	}
	public String getPdate() {
		return pdate;
	}
	public void setPdate(String pdate) {
		this.pdate = pdate;
	}
	@Override
	public String toString() {
		return "MonthPlan [seq=" + seq + ", toDo=" + toDo + ", pdate=" + pdate + "]";
	}
	
	
	
}
