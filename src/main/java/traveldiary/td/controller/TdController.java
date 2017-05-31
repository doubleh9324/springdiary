package traveldiary.td.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import traveldiary.common.common.CommandMap;
import traveldiary.td.dto.DiaryDTO;
import traveldiary.td.dto.MemberDTO;
import traveldiary.td.dto.testDTO;
import traveldiary.td.service.TdService;


@Controller
public class TdController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="tdService")
	private TdService tdService;
	
	
	/*
	@RequestMapping(value="/td/memberList.do")
	public ModelAndView openMemberList() throws Exception{
		ModelAndView mv = new ModelAndView("/td/memberList");
		
		List<MemberDTO> mlist = tdService.selectMemberList();
		
		mv.addObject("memberList", mlist);
	}
	*/
	
	/*
	 *@RequestMapping Annotation 적용 메소드틑 커맨드 클래스와 웹 앱 관련 파라미터 사용가능 
	 * 
	 * 
	 */
	
	//@RequestParam Annotation : HTTP 요청 파라미터를 메소드의 파라미터로 전달받음
	//value=파라미터이름(String) , required=해당 파라미터 필수여부(boolean, true)
	
	//에러가..나야하는데...???
	@RequestMapping(value="/td/testConn.do")
	public ModelAndView openTestPage(@RequestParam(value="textJsp", required=true)String jspText) throws Exception{
		ModelAndView mv = new ModelAndView("/td/testConn");
		
		testDTO testDto = new testDTO();
		
		testDto = tdService.testService();
		testDto.setJsp(jspText);
		testDto.setController("cont");
		
		mv.addObject("test", testDto);
		
		return mv;
	}
	
	@RequestMapping(value="/td/main.do")
	public ModelAndView openMainPage(HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("/td/main");
	
		List<DiaryDTO> mdiary = null;
		
		//어떻게 가져오지? 인터셉터에서 컨트롤러로 값을 전달해 줄 수 있나? 일단은 세션에서 바로
		HttpSession session = request.getSession(false);
		String userNum = session.getAttribute("userNum").toString();
		int unum = Integer.parseInt(userNum);
		
		//로그인 된 경우와 그렇지 않은 경우 고려하기 나중에...
		if(unum == 0){
			//손님 계정이니 다이어리 목록은 없닷
			mv.addObject("diaryflag", "guest");
		} else {
			mdiary = tdService.getmDiaryList(unum);
			mv.addObject("diaryflag", "member");
		}
		
		mv.addObject("diaryList", mdiary);
		
		return mv;
	}
	
	
	//common으로 옮겨야 할 것 같은뎅
	@RequestMapping(value="/td/login.do")
	public ModelAndView openLoginPage() throws Exception{
		ModelAndView mv = new ModelAndView("/td/login");
		return mv;
	}
	
	@RequestMapping(value="/td/logincheck.do")
	public ModelAndView doLogin(MemberDTO member) throws Exception{
		String resultURL = tdService.doLogin(member);
		
		
		
		
		
		ModelAndView mv = new ModelAndView("redirect : /td/main");
		tdService.doLogin(member);
		
		return mv;
	}
	
	
	
	
	
}
