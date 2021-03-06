package ho.command;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

import ho.command.CommandException;
import ho.model.HoException;
import ho.model.HoGoods;
import ho.model.HoMember;
import ho.service.HoMemberService;

public class CommandInventoryUpdate implements Command{
	private String next;
	
	public CommandInventoryUpdate( String _next ){
		next = _next;
	}
	
	public String execute(HttpServletRequest request) throws CommandException {
		try{
			System.out.println("CommandInventoryUpdate들어옴");
			
			String id = request.getParameter("id");
			int count = Integer.parseInt(request.getParameter("Count"));
			int SSize = Integer.parseInt(request.getParameter("SSize"));
			int MSize = Integer.parseInt(request.getParameter("MSize"));
			int LSize = Integer.parseInt(request.getParameter("LSize"));
			
			System.out.println("InventoryUpdate id값" +id);
			System.out.println("InventoryUpdate count값" +count);
			System.out.println("InventoryUpdate SSize값" +SSize);
			System.out.println("InventoryUpdate MSize값" +MSize);
			System.out.println("InventoryUpdate LSize값" +LSize);
			
			HashMap<String,Object> idmap = new HashMap();
			
			idmap.put("GoodsName",id);
			idmap.put("GoodsSoo",count);
			idmap.put("GoodsSSize",SSize);
			idmap.put("GoodsMSize",MSize);
			idmap.put("GoodsLSize",LSize);
			
			
			HoMemberService.getInstance().GoodsInventory(idmap);
			
		}catch( Exception ex ){
			throw new CommandException("CommandInventoryUpdate.java < 입력시 > " + ex.toString() ); 
		}
		return next;
	}


}
