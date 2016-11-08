package ho.command;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

import ho.model.HoMember;
import ho.service.HoMemberService;

public class CommandMemDelete implements Command{

	private String next;

	public CommandMemDelete( String _next ){
		next = _next;
	}

	public String execute(HttpServletRequest request) throws CommandException {
		try{
			request.setCharacterEncoding("utf-8");

			String id =request.getParameter("mId");
			HoMember Member = null;
			HashMap hm = new HashMap();
			System.out.println("MemDelete로 가는 id : " + id);
			hm.put("mId", id);
			HoMemberService.getInstance().MemberDelete(hm);

			request.setAttribute("MemDelete", Member);
		}catch( Exception ex ){
			throw new CommandException("CommandMemDelete.java < 삭제시 > " + ex.toString() ); 
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

