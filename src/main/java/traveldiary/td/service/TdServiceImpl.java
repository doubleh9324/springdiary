package traveldiary.td.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import traveldiary.common.common.CommandMap;
import traveldiary.td.dao.tdDAO;
import traveldiary.td.dto.DayDTO;
import traveldiary.td.dto.DayListViewDTO;
import traveldiary.td.dto.DiaryDTO;
import traveldiary.td.dto.MemberDTO;
import traveldiary.td.dto.testDTO;

//tdService라는 서비스 객체 선언
@Service("tdService")
public class TdServiceImpl implements TdService {

    @Resource(name="tdDAO")
    private tdDAO tdDao;
	
	//전체 일기 항목 가져오기
	@Override
	public DayListViewDTO getDayList() throws Exception {
		return null;
	}


	@Override
	public testDTO testService() throws Exception {
		
		testDTO testDto = new testDTO();
		testDto.setService("나ㄴㅡㄴ 서비스");
		
		
		return testDto;
	}


	@Override
	public Map<String, Object> getmDiaryList(Map<String, Object> map) throws Exception {
		
		int mnum = (Integer) map.get("mnum");
		
		Map<String, Object> resultmap  = new HashMap<String, Object>();
		List<DiaryDTO> diarylist = tdDao.selectmDiaryList(map);

		List<Map<String, Object>> progress = tdDao.getProgress(mnum);
		
		
		resultmap.put("diaryList", diarylist);
		resultmap.put("total",tdDao.selectmDLTotal(mnum));
		resultmap.put("prog", progress);
		
		return resultmap;
	}
	
	@Override
	public List<DiaryDTO> getmDiaryList(int mnum) throws Exception {
		return tdDao.selectmDiaryList(mnum);
	}
	
	

	//로그인 service 
	@Override
	public Map<String, Object> doLogin(MemberDTO member) throws Exception {
		MemberDTO memberinfo = tdDao.doLogin(member);
		
		String re = "-1";
		String inputpw = member.getMember_pw();
		
		//멤버 정보가 존재할 때
		if(memberinfo != null){
			//해당하는 아이디와 입력한 아이디의 비밀번호가 같으면 true 반환
			if(memberinfo.getMember_pw().equals(inputpw)){
				re = "1001"; 
			} else {
				re = "-1";
			}
		}
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("result", re);
		result.put("member", memberinfo);
		return result;
	}


	@Override
	public Map<String, Object> getDiaryDays(Map<String, Object> map) throws Exception {
			List<DayDTO> daylist = tdDao.selectmDays(map);
			double prog = tdDao.getProgress(map);
			List<Map<String, Object>> reCount = tdDao.getdRecount(map);
			
			Map<String, Object> resultmap = new HashMap<String, Object>();
			resultmap.put("dayList", daylist);
			resultmap.put("prog", prog);
			resultmap.put("total",tdDao.selectddTotal(map));
			resultmap.put("reCount", reCount);
		return resultmap;
	}


	@Override
	public Map<String, Object> getDayDetail(int dnum, int unum) throws Exception {
		
		Map<String, Object> resultmap = new HashMap<String, Object>();
		
		
		DayDTO day = tdDao.getDay(dnum);
		
		if(day.getMember_num() != unum){
			tdDao.plusHits(dnum);
		}
		
		
		resultmap.put("day",day);
		
		
		return resultmap;
	}


	@Override
	public int writeDay(DayDTO day) throws Exception {
		boolean re = tdDao.insertDay(day);
		int dnum = 0;
		if(re){
			dnum = tdDao.selectindnum(day);
		}
			
		
		return dnum;
	}


	@Override
	public Map<String, Object> getDiaryList(Map<String, Object> map) throws Exception {
		
		Map<String, Object> resultmap  = new HashMap<String, Object>();
		List<DiaryDTO> diarylist = tdDao.selectDiaryList(map);

		List<Map<String, Object>> progress = tdDao.getProgress();
		
		resultmap.put("total", tdDao.getDiaryTotalCount());
		resultmap.put("diaryList", diarylist);
		resultmap.put("prog", progress);
		
		return resultmap;
	}






//	public boolean doLogout() throws Exception{
		
//	}

	/*
	@Override
	public List selectMemberList() throws Exception {
		//return null;
		return tdDAO.selectMemberList();
	}
*/
	
}
