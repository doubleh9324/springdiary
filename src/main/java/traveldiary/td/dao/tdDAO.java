package traveldiary.td.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import traveldiary.common.dao.AbstractDAO;
import traveldiary.td.dto.DayListViewDTO;
import traveldiary.td.dto.DiaryDTO;
import traveldiary.td.dto.MemberDTO;

/**
 * Repository : DAO를 스프링에 인식시키기 위해서 주로 사용.
 * pom.xml의 <context:component-scan base-package="경로"></context:component-scan>
 * 이 경로 안에 달고있는 클래스가 있으면 인식해주고 객체로 만들어 준당
 * 이 DAO를 controller에서 Inject하고 사용이 가능
 *
 */
@Repository("tdDAO")
public class tdDAO extends AbstractDAO{
	
	@SuppressWarnings("unchecked")
	public DayListViewDTO selectDayList() throws Exception{
	//	return selectList(td.selectDayList);
		return null;
	}
	
	@SuppressWarnings("unchecked")
	public List selectMemberList()throws Exception {
		return selectList("td.selectMembetList");
	}

	
	@SuppressWarnings("unchecked")
	public List<DiaryDTO> selectmDiaryList(Map<String, Object> map) throws Exception{
		
		List<DiaryDTO> result = (List<DiaryDTO>)selectList("td.selectmDiaryList", map);
		return result;
	}
	
	public MemberDTO doLogin(MemberDTO member) throws Exception{
		String mid = member.getMember_id();
		
		return (MemberDTO) selectOne("td.selectMember", mid);
	}
	
	public int selectmDLTotal(int mnum) throws Exception{
		return (Integer) selectOne("td.selectmDiaryLCount", mnum);
	}
	
	//전체 값을 가져올땐 매개변수없이
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> getProgress() throws Exception{
		return selectList("td.selectProgress");
	}
	
	//개인 목록을 가져올 땐 매개변수로 mnum받기
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> getProgress(int mnum) throws Exception{
		return selectList("td.selectmProgress", mnum);
	}


}
