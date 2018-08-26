package cf.yul.apoint.dao;

import java.util.ArrayList;

import cf.yul.apoint.vo.MonthPlan;
import cf.yul.apoint.vo.WeekPlan;

public interface PlanMapper {
	public ArrayList<WeekPlan> selectWeekPlan();
	public int insertWeekPlan(WeekPlan wp);
	public ArrayList<MonthPlan> selectMonthPlan();
	public int insertMonthPlan(MonthPlan mp);
}
