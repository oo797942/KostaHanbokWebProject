package ho.command;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import ho.command.CommandException;
import ho.model.HoException;
import ho.model.HoMember;
import ho.service.HoMemberService;

public class CommandCoinPay implements Command{
	private String next;
	public CommandCoinPay( String _next ){
		next = _next;
	}
	public String execute(HttpServletRequest request) throws CommandException {
		try{
			HashMap<String, Object> memMap= new HashMap<String,Object>();
			
			String coin = request.getParameter("coin");
			String id = request.getParameter("id");

			memMap.put("coin", coin);
			memMap.put("id", id);

			HoMemberService.getInstance().updateHoMemeberCoin(memMap);
			
		}catch( Exception ex ){
			throw new CommandException("CommandCoinPay.java < 입력시 > " + ex.toString() ); 
		}
		return next;
	}
	
}
