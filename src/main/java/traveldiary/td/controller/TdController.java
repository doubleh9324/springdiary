package traveldiary.td.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
		MemberDTO userInfo = null;
		List<DiaryDTO> mdiary = null;
		
		//어떻게 가져오지? 인터셉터에서 컨트롤러로 값을 전달해 줄 수 있나? 일단은 세션에서 바로
		HttpSession session = request.getSession(false);
		String status = session.getAttribute("status").toString();
		
		//로그인 된 경우와 그렇지 않은 경우 고려하기 나중에...
		//정보가 빈 상태라면
		if(status.equals("logout")){
			//손님 계정이니 다이어리 목록은 없닷
			mv.addObject("identify", "guest");
		} else {
			userInfo = (MemberDTO) session.getAttribute("userInfo");
			
			//로그인된 상태, 개인 일기장 목록 가져오기
		//	mdiary = tdService.getmDiaryList(Integer.parseInt(userNum));
			mv.addObject("identify", "member");
		}
		
		mv.addObject("userInfo", userInfo);
		mv.addObject("diaryList", mdiary);
		
		return mv;
	}
	
	
	//common으로 옮겨야 할 것 같은뎅
	@RequestMapping(value="/td/login.do")
	public ModelAndView openLoginPage(HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("/td/login");
		

		return mv;
	}
	
	//세션값에 로그인한 사용자 번호값만 등록해놓음. 나중에 필요하다면 변경할 것
	@RequestMapping(value="/td/logincheck.do")
	public ModelAndView doLogin(HttpServletRequest request , MemberDTO member) throws Exception{
		
		
		String resultURL = null;
		Map<String, Object> resultMap = tdService.doLogin(member);	
		MemberDTO m = (MemberDTO)resultMap.get("member");
		
		//로그인 성공시
		if(resultMap.get("result").equals("1001")){
			HttpSession session = request.getSession(true);
			session.setAttribute("status", "login");
			session.setAttribute("userInfo", m);
			resultURL = "redirect:/";
		} else {
			resultURL = "redirect:/td/login.do";
		}
		
		ModelAndView mv = new ModelAndView(resultURL);
		mv.addObject("loginRe",resultMap);
		
		return mv;
	}
	
	//세션해지코드의 위치...? 굳이 service단까지 들어가야할까?
	//세션을 아예 삭제하지말고 userNum값을 0으로 바꾸기 이렇게 써도 되는건가 나중에 찾아볼것
	@RequestMapping(value="/td/logout.do")
	public ModelAndView doLogout(HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("/td/main");
		
		HttpSession session = request.getSession(false);
		MemberDTO userInfo = null;
		
		session.setAttribute("userInfo", userInfo);
		session.setAttribute("status", "logout");
		//tdService.doLogout(userNum);
		
		mv.addObject("identify", "guest");
		
		return mv;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/td/mydiary.do")
	public ModelAndView openMydiaryPage(HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("/td/mydiary");
		
		HttpSession session = request.getSession(false);
		String status = (String) session.getAttribute("status");
		
		if(status.equals("logout")){
			mv.addObject("identify", "guest");
		} else {
			mv.addObject("identify", "member");
		}
		
		return mv;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/td/mydiaryList.do")
	public ModelAndView selectMydiary(HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		List<DiaryDTO> mdiary = null;
		Map<String, Object> resultmap = new HashMap<String, Object>();
		int total = 0;
		
		//어떻게 가져오지? 인터셉터에서 컨트롤러로 값을 전달해 줄 수 있나? 일단은 세션에서 바로
		HttpSession session = request.getSession(false);
		String status = (String) session.getAttribute("status");
		
		int pagenum = Integer.parseInt(request.getParameter("pagenum"));
		
		//로그인 된 경우와 그렇지 않은 경우 고려하기 나중에...
		if(status.equals("logout")){
			//손님 계정이니 다이어리 목록은 없닷
		} else {
			//로그인된 상태, 개인 일기장 목록 가져오기
			MemberDTO userInfo = (MemberDTO) session.getAttribute("userInfo");
			mv.addObject("userInfo", userInfo);
			
			//diary dto
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("mnum", userInfo.getMember_num());
			map.put("pnum", pagenum);
			resultmap = (Map<String, Object>) tdService.getmDiaryList(map);
			mdiary = (List<DiaryDTO>) resultmap.get("diaryList");

			//total count
			total = (Integer) resultmap.get("total");
		}
		
		mv.addObject("total", total);
		mv.addObject("progress", (List<Map<String, Object>>) resultmap.get("prog"));
		mv.addObject("diaryList", mdiary);
		
		
		return mv;
	}
}
	
	
	
	
	

