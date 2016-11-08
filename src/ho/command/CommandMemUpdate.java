package ho.command;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

import ho.model.HoMember;
import ho.service.HoMemberService;

public class CommandMemUpdate implements Command{
	
	private String next;
	
	public CommandMemUpdate( String _next ){
		next = _next;
	}
	
	public String execute(HttpServletRequest request) throws CommandException {
		try{
			request.setCharacterEncoding("utf-8");

			String mid =request.getParameter("mId");
			String id = request.getParameter("id");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String addr = request.getParameter("addr");
			String tel = request.getParameter("tel");
			String coin = request.getParameter("coin");
			String height = request.getParameter("height");
			String bust = request.getParameter("chest");
			String shoulder = request.getParameter("shoulder");
			
			
			HoMember Member = null;
			HashMap hm = new HashMap();
			System.out.println("MemUpdate로 가는 id : " + id);
			hm.put("mId", mid);
			hm.put("memId", id);
			hm.put("memName", name);
			hm.put("memEmail", email);
			hm.put("memAddrNo",addr);
			hm.put("memTel",tel );
			hm.put("memCoin", coin);
			hm.put("memHeight", height);
			hm.put("memBust", bust);
			hm.put("memShoulder",shoulder );
			
			HoMemberService.getInstance().MemUpdate(hm);
			
//			m_id=#{memId} , 
//			m_name=#{memName}, 
//			m_Email=#{memEmail},
//			m_addr=#{memAddrNo}, 
//			m_tel=#{memTel}, 
//			m_coin=#{memCoin},
//			m_cm=#{memHeight} , 
//			m_bust=#{memBust},
//			m_shoulder=#{memShoulder} 
		}catch( Exception ex ){
			throw new CommandException("CommandMemUpdate.java < 수정시 > " + ex.toString() ); 
		}
		
		return next;
	}
	private String getFileName(Part part) throws UnsupportedEncodingException {
		System.out.println("getFileName");
		for (String cd : part.getHeader("Content-Disposition").split(";")) {
			if (cd.trim().startsWith("filename")) {
				return cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
			}
		}
		return null;
	}
}
