package cf.yul.apoint.controller;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cf.yul.apoint.dao.PlanDAO;
import cf.yul.apoint.vo.MonthPlan;
import cf.yul.apoint.vo.WeekPlan;

@RequestMapping("plan")
@Controller
public class PlanController {

	@Autowired
	PlanDAO dao;
	
	@RequestMapping(value = "/addWeekPlan", method = RequestMethod.POST)
	public String addWeekPlan(WeekPlan wp) {
		
		System.out.println(wp);
		dao.insertWeekPlan(wp);
		return "redirect:/plan.go";
		
	}
	
	@RequestMapping(value = "/addMonthPlan", method = RequestMethod.POST)
	public String addMonthPlan(MonthPlan mp) {
		System.out.println(mp);
		dao.insertMonthPlan(mp);
		return "redirect:/plan.go";
	}
}
