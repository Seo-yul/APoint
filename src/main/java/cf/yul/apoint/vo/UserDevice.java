package cf.yul.apoint.vo;

public class UserDevice {
	 private String userid;
	 private String remoteAddress;
	 private String inetAddress;
	 private String computerName;
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getRemoteAddress() {
		return remoteAddress;
	}
	public void setRemoteAddress(String remoteAddress) {
		this.remoteAddress = remoteAddress;
	}
	public String getInetAddress() {
		return inetAddress;
	}
	public void setInetAddress(String inetAddress) {
		this.inetAddress = inetAddress;
	}
	public String getComputerName() {
		return computerName;
	}
	public void setComputerName(String computerName) {
		this.computerName = computerName;
	}
	@Override
	public String toString() {
		return "UserDevice [userid=" + userid + ", remoteAddress=" + remoteAddress + ", inetAddress=" + inetAddress
				+ ", computerName=" + computerName + "]";
	}
	public UserDevice(String userid, String remoteAddress, String inetAddress, String computerName) {
		super();
		this.userid = userid;
		this.remoteAddress = remoteAddress;
		this.inetAddress = inetAddress;
		this.computerName = computerName;
	}
	public UserDevice() {
		super();
	}
	 
	 
}
