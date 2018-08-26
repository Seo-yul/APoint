package cf.yul.apoint.dao;

import cf.yul.apoint.vo.UserDevice;


public interface DeviceMapper {
	public UserDevice selectUserInfo(UserDevice UserDevice);
	public int insertUserDevice(UserDevice UserDevice);
}
