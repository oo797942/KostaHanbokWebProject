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

public class CommandModify implements Command{
	private String next;
	
	public CommandModify( String _next ){
		next = _next;
	}
	
	public String execute(HttpServletRequest request) throws CommandException {
		try{
			System.out.println("CommandModify들어옴");
			
			String id = request.getParameter("id");
			System.out.println("Modify 처음 id값" +id);

			HashMap<String,Object> idmap = new HashMap();
			idmap.put("countid",id);
			HoGoods HoGoods = HoMemberService.getInstance().GoodsView(idmap);
			
			int GoodsSoo = HoGoods.getGoodsSoo();
			
			System.out.println("기존의 수량" + GoodsSoo);
			System.out.println("저장된 번호"+HoGoods.getGoodsId());
			String count = request.getParameter("val");

			System.out.println("변경된 수량" +count);
		/*		HashMap<String,Object> map = new HashMap();
				map.put("countid", id);
				HoMemberService.getInstance().GoodsModify(map);
			*/
			
		}catch( Exception ex ){
			throw new CommandException("CommandDelete.java < 입력시 > " + ex.toString() ); 
		}
		return next;
	}


}
