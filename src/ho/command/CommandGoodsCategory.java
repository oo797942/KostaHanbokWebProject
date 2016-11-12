package ho.command;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import ho.command.CommandException;
import ho.model.HoException;
import ho.model.HoGoods;
import ho.model.HoMember;
import ho.service.HoBagService;
import ho.service.HoMemberService;

public class CommandGoodsCategory implements Command {
	private String next;

	public CommandGoodsCategory(String _next) {
		next = _next;
	}

	public String execute(HttpServletRequest request) throws CommandException {
		try {
			request.setCharacterEncoding("utf-8");
			HashMap<Object, String> hm = new HashMap<Object, String>();
			String category = request.getParameter("category");
			System.out.println("카테고리: " + category);
			hm.put("category", category);
			System.out.println("CommandGoodsCategory에 들어왔음");
			List<HoGoods> list = (List<HoGoods>) HoMemberService.getInstance().GoodsCategory(hm);
			System.out.println(list);
			request.setAttribute("GoodsCategory", list);
			
			
			int result=0;
			HashMap<String, Object> memMap= new HashMap<String,Object>();
			
			
			HoMember hms = null;
			List BagList = null;
			HttpSession sess = request.getSession();
			String id = (String)sess.getAttribute("yourid");
			System.out.println("아이디:" + id);

			if(id!=null){
				memMap.put("id", id);
				hms =HoMemberService.getInstance().selectHoMemberByPrimaryKey(memMap);
				BagList = HoBagService.getInstance().selectShoppingBag(memMap);
				System.out.println("아이디는 제대로 넘겼지?? >> " + id);
				System.out.println("몇 개 넘어갔어?? >> " + BagList.size());
			}
			


			if(hms==null){
				result=2;
			}else{
				result=1;
				request.setAttribute("homem", hms);
				request.setAttribute("baglist", BagList);
			}
			request.setAttribute("result", result);
			
			
			
		} catch (Exception ex) {
			throw new CommandException("CommandGoodsCategory.java < 입력시 > " + ex.toString());
		}
		return next;
	}

	private String getFileName(Part part) throws UnsupportedEncodingException {
		System.out.println("getFileName");
		for (String cd : part.getHeader("Content-Disposition").split(";")) {
			if (cd.trim().startsWith("filename")) {
				return cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
			}
		}
		return null;
	}

}
