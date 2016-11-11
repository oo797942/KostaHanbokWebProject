package ho.command;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import ho.model.HoBoard;
import ho.model.HoGoods;
import ho.model.HoOrder;
import ho.service.HoMemberService;
import ho.service.HoOrderService;

public class CommandSaleList implements Command {
private String next;
	
	public CommandSaleList( String _next ){
		next = _next;
	}
	public String execute(HttpServletRequest request) throws CommandException {
		try{
			request.setCharacterEncoding("utf-8");
			
			int nowpagenum=1;
			 int countPerPage = 7;
			 String page = request.getParameter("pagenum");
			 if(page!=null) nowpagenum = Integer.parseInt(page);
			 int startRecord = nowpagenum*countPerPage-(countPerPage-1);
	         int endRecord = nowpagenum*countPerPage;
	         
	         HashMap<String,Integer> om = new HashMap<String,Integer>();
	            om.put("startrecord", startRecord);
	            om.put("endrecord", endRecord);
	         HashMap<String,String> tm = new HashMap<String,String>();
	         tm.put("tableName", "order_t");
			
			
			System.out.println("CommandSaleList에 들어왔음");
			List<HoOrder> list =  (List<HoOrder>) HoOrderService.getInstance().AllOrderList(om);  
			int totalRecord = HoMemberService.getInstance().getTotalCount(tm);
			System.out.println(list);
			request.setAttribute("OrderList", list);
			request.setAttribute("totalRecord", totalRecord);
		}catch( Exception ex ){
			throw new CommandException("CommandSaleList.java < 입력시 > " + ex.toString()); 
		}
		return next;
	}
}
