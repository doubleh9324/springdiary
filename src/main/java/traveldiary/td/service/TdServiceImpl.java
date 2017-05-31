package traveldiary.td.service;

import java.util.List;

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
	@Override
	public String doLogin(MemberDTO member) throws Exception {
		MemberDTO memberinfo = tdDao.doLogin(member);
		
		if(memberinfo == null){
			
		}
		
		return null;
	}

	/*
	@Override
	public List selectMemberList() throws Exception {
		//return null;
		return tdDAO.selectMemberList();
	}
*/
	
}
