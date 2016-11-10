package ho.command;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
			
			
			HoMember hm = null;
			List BagList = null;
			HttpSession sess = request.getSession();
			String id = (String)sess.getAttribute("yourid");
			System.out.println("아이디:" + id);

			if(id!=null){
				memMap.put("id", id);
				hm =HoMemberService.getInstance().selectHoMemberByPrimaryKey(memMap);
				BagList = HoBagService.getInstance().selectShoppingBag(memMap);
				System.out.println("아이디는 제대로 넘겼지?? >> " + id);
				System.out.println("몇 개 넘어갔어?? >> " + BagList.size());
			}
			


			if(hm==null){
				result=2;
			}else{
				result=1;
				request.setAttribute("homem", hm);
				request.setAttribute("baglist", BagList);
			}
			request.setAttribute("result", result);
			

			
		}catch( Exception ex ){
			throw new CommandException("CommandBag.java < 입력시 > " + ex.toString() ); 
		}
		return next;
	}
	
}
