package cf.yul.apoint.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cf.yul.apoint.vo.MonthPlan;
import cf.yul.apoint.vo.WeekPlan;

@Repository
public class PlanDAO implements PlanMapper {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public ArrayList<WeekPlan> selectWeekPlan() {
		ArrayList<WeekPlan> arryWeekPlan;
		try {
			PlanMapper mapper = sqlSession.getMapper(PlanMapper.class);
			arryWeekPlan = mapper.selectWeekPlan();
			
		}catch(Exception e) {
			System.out.println("주간계획 불러오기 실패");
			e.printStackTrace();
			return null;
		}
		return arryWeekPlan;
		
	}

	@Override
	public int insertWeekPlan(WeekPlan wp) {
		int cnt = 0;
		try {
			PlanMapper mapper = sqlSession.getMapper(PlanMapper.class);
			cnt = mapper.insertWeekPlan(wp);
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("주간계획 추가 실패");
			return cnt;
		}
		return cnt;
	}

	@Override
	public ArrayList<MonthPlan> selectMonthPlan() {
		ArrayList<MonthPlan> arryMonthPlan;
		try {
			PlanMapper mapper = sqlSession.getMapper(PlanMapper.class);
			arryMonthPlan = mapper.selectMonthPlan();
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("월간계획 불러오기 실패");
			return null;
		}
		return arryMonthPlan;
	}

	@Override
	public int insertMonthPlan(MonthPlan mp) {
		int cnt = 0;
		try {
			PlanMapper mapper = sqlSession.getMapper(PlanMapper.class);
			cnt = mapper.insertMonthPlan(mp);
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("월간계획 추가 실패");
			return cnt;
		}
		return cnt;
	}

}
