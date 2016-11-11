package ho.command;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import ho.command.CommandException;
import ho.model.HoException;
import ho.model.HoGoods;
import ho.model.HoMember;
import ho.service.HoMemberService;

public class CommandGetInfoById implements Command{
	private String next;
	public CommandGetInfoById( String _next ){
		next = _next;
	}
	public String execute(HttpServletRequest request) throws CommandException {
		try{
			int result=0;
			HashMap<String, Object> memMap= new HashMap<String,Object>();
			
			String user = request.getParameter("adid");
			System.out.println("GetInfoById 1:" +user);
			
			HoGoods hg = new HoGoods();
			hg.setGoodsName(request.getParameter("name"));
			String price = request.getParameter("price").replaceAll(",","");
			hg.setGoodsPrice(Integer.parseInt(price));
			System.out.println("GetInfoById 안에  hg :" + hg.getGoodsPrice());
			hg.setGoodsImg(request.getParameter("img"));
			String tackbae = request.getParameter("tackbae").replaceAll(",","");
			hg.setGoodsRentPrice(Integer.parseInt(tackbae));
			hg.setGoodsId(request.getParameter("goodsid"));

			System.out.println("마무리로 hg안에있는 id값 : " + hg.getGoodsId());

			System.out.println("hg의 이름"+hg.getGoodsName());
			memMap.put("id", user);
			

			HoMember hm =HoMemberService.getInstance().selectHoMemberByPrimaryKey(memMap);
			
			System.out.println("GetInfoById 2:" +hm.getMemId());
			if(hm==null){
				result=2;
			}else{
				result=1;
				System.out.println("들어왔니??:"+result);
				request.setAttribute("homem", hm);
				request.setAttribute("Goods", hg);
			}
			request.setAttribute("result", result);
			
		}catch( Exception ex ){
			throw new CommandException("CommandGETinfo.java < 입력시 > " + ex.toString() ); 
		}
		return next;
	}
	
}
