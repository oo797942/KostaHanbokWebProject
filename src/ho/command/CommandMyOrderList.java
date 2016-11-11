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
import ho.model.HoBoard;
import ho.service.HoOrderService;

public class CommandMyOrderList implements Command{
	private String next;
	
	public CommandMyOrderList( String _next ){
		next = _next;
	}
	
	public String execute(HttpServletRequest request) throws CommandException {
		try{
			request.setCharacterEncoding("utf-8");
			String id = request.getParameter("id");
			
			System.out.println("MyOrderList 내의 id : " + id);
			HashMap<String,Object> mymap = new HashMap();
			
			mymap.put("id",id);
			
			List<HoOrder> list =  (List<HoOrder>) HoOrderService.getInstance().selectOrderList(mymap);

			request.setAttribute("MyOrderList", list);
		}catch( Exception ex ){
			throw new CommandException("CommandGoodsView.java < 입력시 > " + ex.toString()); 
		}
		return next;
	}


}
