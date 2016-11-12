package ho.command;

import java.io.IOException;

import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

import ho.command.CommandException;
import ho.model.HoException;
import ho.model.HoGoods;
import ho.model.HoMember;
import ho.model.HoOrder;
import ho.model.HoReply;
import ho.model.HoBoard;
import ho.service.HoMemberService;
import ho.service.HoOrderService;
import ho.service.HoReplyService;

public class CommandReplyCheck implements Command{
	private String next;
	
	public CommandReplyCheck( String _next ){
		next = _next;
	}
	
	public String execute(HttpServletRequest request) throws CommandException {
		try{

			String id = request.getParameter("id");
			String no = request.getParameter("no");
			
			System.out.println("1 - " +id);
			System.out.println("2 - " + no);
			
			HashMap<String,Object> rm = new HashMap();
			rm.put("rid", id);
			rm.put("no", no);
			List<HoOrder> list = HoReplyService.getInstance().ReplyCheck(rm);
			int result=0;
			System.out.println("list = " +list);
			if(!(list.isEmpty())){
				result=1;
			}else{
				result=2;
			}
			System.out.println("id 들어옴? : " + id);
			System.out.println("result 들어옴? : " +result);
			request.setAttribute("result", result);	
		}catch( Exception ex ){
			throw new CommandException("CommandMemList.java < 입력시 > " + ex.toString()); 
		}
		return next;
	}

}
