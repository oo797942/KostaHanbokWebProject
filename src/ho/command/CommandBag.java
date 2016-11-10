package ho.command;

import java.util.HashMap;
import java.util.List;

import javax.print.attribute.standard.RequestingUserName;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import ho.command.CommandException;
import ho.model.HoBag;
import ho.model.HoException;
import ho.model.HoMember;
import ho.service.HoBagService;
import ho.service.HoMemberService;

public class CommandBag implements Command{
	private String next;
	public CommandBag( String _next ){
		next = _next;
	}
	public String execute(HttpServletRequest request) throws CommandException {
		try{
			int result=0;
			HashMap<String, Object> memMap= new HashMap<String,Object>();
			
			HttpSession sess = request.getSession();
			String id = (String)sess.getAttribute("yourid");
			
			memMap.put("id", id);		

			HoMember hm =HoMemberService.getInstance().selectHoMemberByPrimaryKey(memMap);
				
			if(hm==null){
				result=2;
			}else{
				result=1;
				request.setAttribute("homem", hm);	
			}
			request.setAttribute("result", result);
			
			memMap.put("123","123");
			
			List BagList = HoBagService.getInstance().selectShoppingBag(memMap);

			
		}catch( Exception ex ){
			throw new CommandException("CommandBag.java < 입력시 > " + ex.toString() ); 
		}
		return next;
	}
	
}
