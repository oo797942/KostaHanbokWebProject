package ho.command;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import ho.command.CommandException;
import ho.model.HoException;
import ho.model.HoMember;
import ho.service.HoBagService;
import ho.service.HoMemberService;
import ho.service.HoOrderService;

public class CommandPay implements Command{
	private String next;
	
	public CommandPay( String _next ){
		next = _next;
	}
	
	public String execute(HttpServletRequest request) throws CommandException {
		try{
			request.setCharacterEncoding("UTF-8");
						
			/*
			System.out.println("cmd 값 : "+request.getParameter("OrderId"));
			System.out.println("상품id : "+request.getParameter("OrderSangpumNo"));
			System.out.println("상품명 : "+request.getParameter("OrderSangpumName"));
			System.out.println("사이즈 : "+request.getParameter("OrderSize"));
			System.out.println("개수 : "+request.getParameter("OrderSoo"));
			System.out.println("금액 : "+request.getParameter("OrderPrice"));
			System.out.println("배송비 : "+request.getParameter("OrderRentPrice"));
			System.out.println("이미지 : "+request.getParameter("OrderImg"));
			System.out.println("총금액 : "+request.getParameter("OrderTotalPrice"));
			System.out.println("이름  : "+request.getParameter("OrderSName"));
			System.out.println("이메일 : "+request.getParameter("OrderSEmail"));
			System.out.println("전화번호 : "+request.getParameter("OrderSTel"));
			System.out.println("주소 : "+request.getParameter("OrderSAddr"));
			System.out.println("상세주소 : "+request.getParameter("addrdetail"));
			System.out.println("수령자명 : "+request.getParameter("OrderRName"));
			System.out.println("전화번호 : "+request.getParameter("OrderRTel"));
			System.out.println("주소 : "+request.getParameter("OrderRAddr"));
			System.out.println("요구사항 : "+request.getParameter("OrderRDemand"));
			System.out.println("결재수단 : "+request.getParameter("OrderSettleCase"));
			*/
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
			      
			      HoOrderService.getInstance().updatePayGoods(order);

			
			
			
			System.out.println("성공");
			
			
			int result=0;
			HashMap<String, Object> memMap= new HashMap<String,Object>();
			
			
			HoMember hm = null;
			HttpSession sess = request.getSession();
			String id = (String)sess.getAttribute("yourid");
			System.out.println("아이디:" + id);

			if(id!=null){
				memMap.put("id", id);
				hm =HoMemberService.getInstance().selectHoMemberByPrimaryKey(memMap);
				System.out.println("아이디는 제대로 넘겼지?? >> " + id);
			}
			


			if(hm==null){
				result=2;
			}else{
				result=1;
				request.setAttribute("homem", hm);
			}
			request.setAttribute("result", result);
			

			
			
		}catch( Exception ex ){
			throw new CommandException("CommandPay.java < 입력시 > " + ex.toString() ); 
		}
		return next;
	}


}
