package ho.command;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import ho.command.CommandException;
import ho.model.HoException;
import ho.model.HoMember;
import ho.service.HoMemberService;

public class CommandLogin implements Command{
	private String next;
	public CommandLogin( String _next ){
		next = _next;
	}
	public String execute(HttpServletRequest request) throws CommandException {
		try{
			HoMember hm = new HoMember();
			HashMap<String, Object> memMap= new HashMap<String,Object>();
			
			String user = request.getParameter("adid");
			String pass = request.getParameter("adpw");
			
			memMap.put("id", user);
			memMap.put("pass", pass);
			hm=HoMemberService.getInstance().selectHoMemberByPrimaryKey(memMap);
			
			request.setAttribute("homem", hm);
			System.out.println("영재야!!!!"+hm.getMemId());
			
		}catch( Exception ex ){
			throw new CommandException("CommandLogin.java < 입력시 > " + ex.toString() ); 
		}
		return next;
	}
	
}
