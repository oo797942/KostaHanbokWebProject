package ho.command;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

import ho.command.CommandException;
import ho.model.HoException;
import ho.model.HoMember;
import ho.service.HoMemberService;
public class CommandMemInsert implements Command {
	private String next;
	
	public CommandMemInsert( String _next ){
		next = _next;
	}
	
	public String execute(HttpServletRequest request) throws CommandException {
		try{	
			request.setCharacterEncoding("utf-8");
			HashMap<String, Object> memMap= new HashMap<String,Object>();

			System.out.println("CommandMemInsert에 들어왔음");
			
			System.out.println(request.getParameter("username"));
			System.out.println(request.getParameter("sex"));
			
			
			memMap.put("userId",request.getParameter("id"));
			memMap.put("userPass",request.getParameter("password1"));
			memMap.put("userName", request.getParameter("username"));
			memMap.put("userTel", request.getParameter("tel"));
			memMap.put("userSex", request.getParameter("sex"));
			memMap.put("userEmail", request.getParameter("email"));
			memMap.put("userBirth", request.getParameter("birth"));
			memMap.put("userAddr", request.getParameter("addr"));
			memMap.put("userHeight", request.getParameter("height"));
			memMap.put("userChest", request.getParameter("chest"));
			memMap.put("userShoulder", request.getParameter("shoulder"));
			memMap.put("userCoin", "null");
			memMap.put("userEXP", 0);
				
			
			HoMemberService.getInstance().MemberJoin(memMap);
		}catch( Exception ex ){
			throw new CommandException("CommandMemInsert.java < 입력시 > " + ex.toString() ); 
		}
		return next;
	}

}
