package traveldiary.td.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import traveldiary.common.common.CommandMap;
import traveldiary.td.dao.tdDAO;
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
	public DayListViewDTO selectDayList() throws Exception {
		return null;
	}


	@Override
	public testDTO testService() throws Exception {
		
		testDTO testDto = new testDTO();
		testDto.setService("나ㄴㅡㄴ 서비스");
		
		
		return testDto;
	}


	@Override
	public List<DiaryDTO> getmDiaryList(int mnum) throws Exception {
		
		if(mnum==0){
			//회원 번호가 0일 경우 == 로그인이 되지 않은 경우 : mydiary 표시하지 않음
			//diarylist 표시
		} else {
			//회원 번호가 상수일 경우 && 사용자 번호와 같을 경우 : mydiary 표시
		}
		
		List<DiaryDTO> diaryList = null;
		
		diaryList = tdDao.selectmDiaryList(mnum);
		
		return diaryList;
		
	}

	//로그인 service 
	@SuppressWarnings("null")
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

	/*
	@Override
	public List selectMemberList() throws Exception {
		//return null;
		return tdDAO.selectMemberList();
	}
*/
	
}
