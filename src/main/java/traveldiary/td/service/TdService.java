package traveldiary.td.service;


import java.util.List;

import traveldiary.common.common.CommandMap;
import traveldiary.td.dto.DayListViewDTO;
import traveldiary.td.dto.DiaryDTO;
import traveldiary.td.dto.MemberDTO;
import traveldiary.td.dto.testDTO;

public interface TdService {
	
	DayListViewDTO selectDayList() throws Exception;
//	List<MemberDTO> selectMemberList() throws Exception;
	
	testDTO testService() throws Exception;

	List<DiaryDTO> getmDiaryList(int mnum) throws Exception;

	String doLogin(MemberDTO member) throws Exception;
}
