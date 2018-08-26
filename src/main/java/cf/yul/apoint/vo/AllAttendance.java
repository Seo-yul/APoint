package cf.yul.apoint.vo;

public class AllAttendance {
	private String userId;
	private String computerName;
	private String checkDate;
	private String status;
	private String nickname;
	public AllAttendance() {
		super();
	}
	public AllAttendance(String userId, String computerName, String checkDate, String status, String nickname) {
		super();
		this.userId = userId;
		this.computerName = computerName;
		this.checkDate = checkDate;
		this.status = status;
		this.nickname = nickname;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getComputerName() {
		return computerName;
	}
	public void setComputerName(String computerName) {
		this.computerName = computerName;
	}
	public String getCheckDate() {
		return checkDate;
	}
	public void setCheckDate(String checkDate) {
		this.checkDate = checkDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	@Override
	public String toString() {
		return "AllAttendance [userId=" + userId + ", computerName=" + computerName + ", checkDate=" + checkDate
				+ ", status=" + status + ", nickname=" + nickname + ", getUserId()=" + getUserId()
				+ ", getComputerName()=" + getComputerName() + ", getCheckDate()=" + getCheckDate() + ", getStatus()="
				+ getStatus() + ", getNickname()=" + getNickname() + ", getClass()=" + getClass() + ", hashCode()="
				+ hashCode() + ", toString()=" + super.toString() + "]";
	}
	
	
	
}
