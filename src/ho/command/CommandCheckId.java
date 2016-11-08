package ho.command;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import ho.command.CommandException;
import ho.model.HoException;
import ho.model.HoMember;
import ho.service.HoMemberService;

public class CommandCheckId implements Command{
	private String next;

	public CommandCheckId( String _next ){
		next = _next;
	}

	public String execute( HttpServletRequest request ) throws CommandException{	
		try{
			
			int result=0;
			HashMap<String, Object> memMap= new HashMap<String,Object>();
			
			String user = request.getParameter("userId");
			System.out.println(user);
			memMap.put("checkid", user);
			
			HoMember hm =HoMemberService.getInstance().selectHoMemberByPrimaryKey(memMap);
		
			if(hm==null){
				result=2;
			}else{
				result=1;
				request.setAttribute("homem", hm);
			}
			request.setAttribute("result", result);

			System.out.println("커맨드내 result값"+result);

			
		}catch( Exception ex ){
			ex.printStackTrace();
			throw new CommandException("CommandLogin.java < 입력시 > " + ex.toString() ); 
		}
		return next;
		
	
	}
}
