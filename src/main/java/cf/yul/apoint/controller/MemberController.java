package cf.yul.apoint.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cf.yul.apoint.dao.AttendanceDAO;
import cf.yul.apoint.dao.DeviceDAO;
import cf.yul.apoint.dao.KakaoDAO;
import cf.yul.apoint.function.GetClientComputerInfo;
import cf.yul.apoint.vo.AllAttendance;
import cf.yul.apoint.vo.Attendance;
import cf.yul.apoint.vo.KakaoUserInfo;
import cf.yul.apoint.vo.UserDevice;

@RequestMapping("member")
@Controller
public class MemberController {

	@Autowired
	DeviceDAO dao;

	@Autowired
	AttendanceDAO Adao;
	
	@Autowired
	KakaoDAO Kdao;

	@RequestMapping(value = "switchattend", method = RequestMethod.POST)
	public String switchAttend(String userId,String checkDate) {
		Map<String, String> m = new HashMap<String, String>();
		m.put("userId", userId);
		m.put("checkDate", checkDate.substring(0, 10));
		int cnt = Adao.updateAttend(m);
		if (cnt > 0) {
			return "redirect:attendance";
		}
		return "redirect:attendance";
	}
	@RequestMapping(value = "switchabsence", method = RequestMethod.POST)
	public String switchAbsence(String userId,String checkDate) {
		Map<String, String> m = new HashMap<String, String>();
		m.put("userId", userId);
		m.put("checkDate", checkDate.substring(0, 10));
		int cnt = Adao.updateAbsence(m);
		if (cnt > 0) {
			return "redirect:attendance";
		}
		return "redirect:attendance";
	}
	
	@RequestMapping(value = "todayattend", method = RequestMethod.POST)
	public String todayAttend(String userId) {
		UserDevice tempDevice = new UserDevice(userId, "관리자", "관리자", "관리자");
		int cnt = Adao.insertAttendance(tempDevice);
		if (cnt > 0) {
			return "redirect:attendance";
		}
		return "redirect:attendance";
	}
	@RequestMapping(value = "todayabsence", method = RequestMethod.POST)
	public String todayAbsence(String userId) {
		UserDevice tempDevice = new UserDevice(userId, "관리자", "관리자", "관리자");
		int cnt = Adao.insertAbsence(tempDevice);
		if (cnt > 0) {
			return "redirect:attendance";
		}
		return "redirect:attendance";
	}
	
	@RequestMapping(value = "attendance.do", method = RequestMethod.GET)
	public String doAttendance(HttpSession session, HttpServletRequest hsr) {
		UserDevice userdevice = (UserDevice) session.getAttribute("userdevice");
		GetClientComputerInfo c = new GetClientComputerInfo();
		String[] device = c.findClientComputerName(hsr);
		String computerName = device[2];
		
		if(userdevice.getComputerName().equals(computerName)) {
			int cnt = Adao.insertAttendance(userdevice);
			if (cnt > 0) {
				return "redirect:attendance";
			}
		}
		return "redirect:attendance";
	}

	@RequestMapping(value = "attendance", method = RequestMethod.GET)
	public String attendance(HttpSession session, Model model) {
		KakaoUserInfo user = (KakaoUserInfo) session.getAttribute("userinfo");
		if(user.getGrade().equals("admin")) {
			System.out.println("관리자가 로그인하였음");
			ArrayList<AllAttendance> arryAllAttendance = Adao.selectAllAttendance();
			ArrayList<KakaoUserInfo> arryKakaoUserInfo = Kdao.selectAllKakaoUserInfo();
			model.addAttribute("arryAllAttendance", arryAllAttendance);
			model.addAttribute("arryKakaoUserInfo", arryKakaoUserInfo);
			
		}else {
			model.addAttribute("arryAllAttendance", null);
			
		}
		UserDevice userdevice = new UserDevice(user.getUserID(), "", "", "");
		ArrayList<Attendance> arryAttendance = new ArrayList<Attendance>();
		userdevice = dao.selectUserInfo(userdevice);
		if (userdevice == null) {
			userdevice = new UserDevice(user.getUserID(), null, null, null);
			Attendance attendance = new Attendance();
			arryAttendance.add(attendance);
		} else
			arryAttendance = Adao.selectAttendance(userdevice.getUserid());
		session.setAttribute("userdevice", userdevice);
		model.addAttribute("arryAttendance", arryAttendance);
		return "member/attendance";
	}

	@RequestMapping(value = "registdevice", method = RequestMethod.GET)
	public String registdevice(HttpServletRequest hsr, HttpSession session) {
		KakaoUserInfo user = (KakaoUserInfo) session.getAttribute("userinfo");
		UserDevice userdevice = new UserDevice(user.getUserID(), "", "", "");
		userdevice = dao.selectUserInfo(userdevice);
		if (userdevice == null) {
			GetClientComputerInfo c = new GetClientComputerInfo();
			String[] device = c.findClientComputerName(hsr);
			String remoteAddress = device[0];
			String inetAddress = device[1];
			String computerName = device[2];
			// System.out.println(remoteAddress);
			// System.out.println(inetAddress);
			// System.out.println(computerName);
			userdevice = new UserDevice(user.getUserID(), remoteAddress, inetAddress, computerName);
			dao.insertUserDevice(userdevice);
		}
		return "redirect:attendance";
	}
}
