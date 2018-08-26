package cf.yul.apoint.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import cf.yul.apoint.vo.AllAttendance;
import cf.yul.apoint.vo.Attendance;
import cf.yul.apoint.vo.UserDevice;

public interface AttendanceMapper {
	public ArrayList<Attendance> selectAttendance (String userId);
	public int insertAttendance (UserDevice userdevice);
	public ArrayList<AllAttendance> selectAllAttendance ();
	public int insertAbsence (UserDevice userdevice);
	public int updateAttend (Map<String, String> m);
	public int updateAbsence (Map<String, String> m);
}
