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
import ho.service.HoOrderService;

public class CommandPay implements Command{
	private String next;
	
	public CommandPay( String _next ){
		next = _next;
	}
	
	public String execute(HttpServletRequest request) throws CommandException {
		try{
						
//			System.out.println("cmd 값 : "+request.getParameter("cmd"));
//			System.out.println("상품id : "+request.getParameter("GoodsNo"));
//		//	System.out.println("상품명 : "+request.getParameter("GoodsName"));
//		//	System.out.println("사이즈 : "+request.getParameter("GoodsSize"));
//		//	System.out.println("개수 : "+request.getParameter("count"));
//		//	System.out.println("금액 : "+request.getParameter("GoodsPrice"));
//		//	System.out.println("배송비 : "+request.getParameter("GoodsRentPrice"));
//		//	System.out.println("이미지 : "+request.getParameter("Goodsimg"));
//		//	System.out.println("총금액 : "+request.getParameter("totalprice"));
//			System.out.println("이름  : "+request.getParameter("name"));
//			System.out.println("이메일 : "+request.getParameter("email"));
//			System.out.println("전화번호 : "+request.getParameter("tel"));
//			System.out.println("주소 : "+request.getParameter("addr"));
//			System.out.println("상세주소 : "+request.getParameter("addrdetail"));
//			System.out.println("배송지명 : "+request.getParameter("limdelivery"));
//			System.out.println("수령자명 : "+request.getParameter("limreceiver"));
//			System.out.println("전화번호 : "+request.getParameter("limtel"));
//			System.out.println("주소 : "+request.getParameter("limaddr"));
//			System.out.println("요구사항 : "+request.getParameter("limdemand"));
//			System.out.println("결재수단 : "+request.getParameter("od_settle_case"));
			
			   HashMap<String,Object> order = new HashMap();
			      
			  // String a =request.getParameter("OrderNo");
//			   System.out.println("commandpay내부의 a: "+ a);
//			   int OrderNo = Integer.parseInt(a);
//			      order.put("OrderNo",Integer.parseInt(request.getParameter("OrderNo")));
			      order.put("OrderId",request.getParameter("OrderId"));
			      System.out.println("OrderId 값 : "+request.getParameter("OrderId"));
			      order.put("OrderSangpumNo",request.getParameter("OrderSangpumNo"));
			      order.put("OrderSangpumName",request.getParameter("OrderSangpumName"));
			      
			      System.out.println("OrderSoo 앞 ");
			      order.put("OrderSoo",Integer.parseInt(request.getParameter("OrderSoo")));
			      System.out.println("OrderSoo 뒤");

			      //order.put("OrderRentState",request.getParameter("OrderRentState"));
			      //order.put("OrderRentDate",request.getParameter("OrderRentDate"));
			      order.put("OrderPrice",request.getParameter("OrderPrice"));
			      //order.put("OrderState",request.getParameter("OrderState"));
			      order.put("OrderSize",request.getParameter("OrderSize"));
			      order.put("OrderRentPrice",request.getParameter("OrderRentPrice"));
			      order.put("OrderImg",request.getParameter("OrderImg"));
			      order.put("OrderTotalPrice",request.getParameter("OrderTotalPrice"));
			      order.put("OrderRName",request.getParameter("OrderRName"));
			      order.put("OrderRTel",request.getParameter("OrderRTel"));
			      order.put("OrderRAddr",request.getParameter("OrderRAddr"));
			      order.put("OrderRDemand",request.getParameter("OrderRDemand"));
			      order.put("OrderSettleCase",request.getParameter("OrderSettleCase"));
			      order.put("OrderSEmail",request.getParameter("OrderSEmail"));
			      order.put("OrderSTel",request.getParameter("OrderSTel"));
			      order.put("OrderSAddr",request.getParameter("OrderSAddr"));
			      order.put("OrderSName",request.getParameter("OrderSName"));
			      
			      HoOrderService.getInstance().insertOrder(order);

			
			
			
			System.out.println("성공");
			
			
			
		}catch( Exception ex ){
			throw new CommandException("CommandPay.java < 입력시 > " + ex.toString() ); 
		}
		return next;
	}


}
