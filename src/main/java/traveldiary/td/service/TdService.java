package traveldiary.td.service;


import java.util.List;
import java.util.Map;

import traveldiary.common.common.CommandMap;
import traveldiary.td.dto.DayListViewDTO;
import traveldiary.td.dto.DiaryDTO;
import traveldiary.td.dto.MemberDTO;
import traveldiary.td.dto.testDTO;

public interface TdService {
	
	DayListViewDTO selectDayList() throws Exception;
//	List<MemberDTO> selectMemberList() throws Exception;
	
	testDTO testService() throws Exception;

	Map<String, Object> getmDiaryList(Map<String, Object> map) throws Exception;

	Map<String, Object> doLogin(MemberDTO member) throws Exception;
}
