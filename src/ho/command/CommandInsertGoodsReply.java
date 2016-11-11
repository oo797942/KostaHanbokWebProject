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
import ho.service.HoReplyService;

public class CommandInsertGoodsReply implements Command{
	private String next;
	
	public CommandInsertGoodsReply( String _next ){
		next = _next;
	}
	
	public String execute(HttpServletRequest request) throws CommandException {
		try{
			
			String id = request.getParameter("id");
			System.out.println("reply 안의 sess값  " +id);
			String su = request.getParameter("GoodsName");
			int GoodsName = Integer.parseInt(su);
			System.out.println("reply 안의 상품번호 " +GoodsName);
			String replyInput = request.getParameter("replyInput");
			System.out.println("reply 안의 후기  " +replyInput);
			HashMap<String,Object> rm = new HashMap();
			rm.put("id", id);
			rm.put("GoodsName", GoodsName);
			rm.put("ReplyInput", replyInput);
			
			HoReplyService.getInstance().insertReply(rm);
	
			
		}catch( Exception ex ){
			throw new CommandException("CommandInsertGoodsReply.java < 입력시 > " + ex.toString() ); 
		}
		return next;
	}

}
