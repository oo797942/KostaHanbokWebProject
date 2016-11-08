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

public class CommandDelete implements Command{
	private String next;
	
	public CommandDelete( String _next ){
		next = _next;
	}
	
	public String execute(HttpServletRequest request) throws CommandException {
		try{
			System.out.println("CommandDelete들어옴");
			
			String id = request.getParameter("id");

			String admin = request.getParameter("Goodsdelete");

			if(admin.equals("admin")){
				HashMap<String,Object> map = new HashMap();
				map.put("id", id);
				HoMemberService.getInstance().GoodsDelete(map);
				HoMemberService.getInstance().GoodsImgDelete(map);
			}			
			
			
		}catch( Exception ex ){
			throw new CommandException("CommandDelete.java < 입력시 > " + ex.toString() ); 
		}
		return next;
	}


}
