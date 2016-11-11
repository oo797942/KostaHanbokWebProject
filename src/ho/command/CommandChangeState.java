package ho.command;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import ho.model.HoGoods;
import ho.model.HoOrder;
import ho.service.HoMemberService;
import ho.service.HoOrderService;

public class CommandChangeState implements Command{
private String next;
	
	public CommandChangeState( String _next ){
		next = _next;
	}
	
	public String execute(HttpServletRequest request) throws CommandException {
		try{
			request.setCharacterEncoding("utf-8");
			
			String ono=request.getParameter("ono");
			HashMap<String, Object> om = new HashMap<>();
			om.put("ono", ono);
			
			HoOrderService.getInstance().ChangeState(om);
			
		}catch( Exception ex ){
			throw new CommandException("CommandList.java < 입력시 > " + ex.toString() ); 
		}
		return next;
	}
}
