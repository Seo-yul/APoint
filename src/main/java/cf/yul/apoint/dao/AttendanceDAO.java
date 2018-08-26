package cf.yul.apoint.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cf.yul.apoint.vo.AllAttendance;
import cf.yul.apoint.vo.Attendance;
import cf.yul.apoint.vo.UserDevice;		

@Repository
public class AttendanceDAO implements AttendanceMapper{

	@Autowired
	SqlSession sqlSession;
	
	
	public ArrayList<Attendance> selectAttendance(String userId) {
		ArrayList<Attendance> arryAttendance;
		try {
			AttendanceMapper mapper = sqlSession.getMapper(AttendanceMapper.class);
			arryAttendance = mapper.selectAttendance(userId);
		} catch (Exception e) {
//			e.printStackTrace();
			System.out.println("출석정보 불러오기 실패");
			return null;
		}
		return arryAttendance;
		
	}

	@Override
	public int insertAttendance(UserDevice userdevice) {
		int cnt =0;
		try {
			AttendanceMapper mapper = sqlSession.getMapper(AttendanceMapper.class);
			cnt = mapper.insertAttendance(userdevice);
		} catch (Exception e) {
//			e.printStackTrace();
			System.out.println("출석정보 저장 실패");
			return 0;
		}
		return cnt;
	}

	@Override
	public ArrayList<AllAttendance> selectAllAttendance() {
		ArrayList<AllAttendance> arryAllAttendance;
		try {
			AttendanceMapper mapper = sqlSession.getMapper(AttendanceMapper.class);
			arryAllAttendance = mapper.selectAllAttendance();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("모든출석정보 불러오기 실패");
			return null;
		}
		return arryAllAttendance;
	}

	@Override
	public int insertAbsence(UserDevice userdevice) {
		int cnt =0;
		try {
			AttendanceMapper mapper = sqlSession.getMapper(AttendanceMapper.class);
			cnt = mapper.insertAbsence(userdevice);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("결석 저장 실패");
			return 0;
		}
		return cnt;
	}

	@Override
	public int updateAttend(Map<String, String> m) {
		int cnt =0;
		try {
			AttendanceMapper mapper = sqlSession.getMapper(AttendanceMapper.class);
			cnt = mapper.updateAttend(m);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("출석변경 실패");
			return 0;
		}
		return cnt;
	}

	@Override
	public int updateAbsence(Map<String, String> m) {
		int cnt =0;
		try {
			AttendanceMapper mapper = sqlSession.getMapper(AttendanceMapper.class);
			cnt = mapper.updateAbsence(m);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("결석변경 실패");
			return 0;
		}
		return cnt;
	}

}
