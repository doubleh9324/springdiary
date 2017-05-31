package traveldiary.td.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import traveldiary.td.dto.MemberDTO;

@Service
public class SessionInterceptor extends HandlerInterceptorAdapter {

	Logger log = Logger.getLogger(this.getClass());
	
	/**preHandle : 클라이언트의 요청을 컨트롤러에 전달하기 전에 호출
	 *  return false인 경우 intercepter ot controller 실행없이 요청종료
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler){
		
		try{
			HttpSession session = request.getSession(false);
			
			if(session == null){
				System.out.println("세션없음");
			} else {
				System.out.println("세션 존재");
				MemberDTO member = (MemberDTO)session.getAttribute("member");
				session.setAttribute("userNum", 0);
				
				if(member == null){
					System.out.println("member 세션없음");
				}
			}
			
		} catch (Exception e){
			e.printStackTrace();
		}
		return true;
	}
}
