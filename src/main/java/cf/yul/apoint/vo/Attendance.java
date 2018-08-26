package cf.yul.apoint.vo;

public class Attendance {
	private String userId;
	private String computerName;
	private String checkDate;
	private String status;
	public Attendance() {
		super();
	}
	public Attendance(String userId, String computerName, String checkDate, String status) {
		super();
		this.userId = userId;
		this.computerName = computerName;
		this.checkDate = checkDate;
		this.status = status;
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
	@Override
	public String toString() {
		return "Attendance [userId=" + userId + ", computerName=" + computerName + ", checkDate=" + checkDate
				+ ", status=" + status + "]";
	}
	
	
}
