package cf.yul.apoint.vo;

public class KakaoUserInfo {
	private String userID;
	private String nickname;
	private String thumbnail_image;
	private String grade;

	public KakaoUserInfo() {
		super();
	}

	public KakaoUserInfo(String userID, String nickname, String thumbnail_image, String grade) {
		super();
		this.userID = userID;
		this.nickname = nickname;
		this.thumbnail_image = thumbnail_image;
		this.grade = grade;
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getThumbnail_image() {
		return thumbnail_image;
	}

	public void setThumbnail_image(String thumbnail_image) {
		this.thumbnail_image = thumbnail_image;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	@Override
	public String toString() {
		return "KakaoUserInfo [userID=" + userID + ", nickname=" + nickname + ", thumbnail_image=" + thumbnail_image
				+ ", grade=" + grade + "]";
	}


}
