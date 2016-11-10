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
import ho.model.HoGoodsImg;
import ho.model.HoMember;
import ho.service.HoMemberService;

public class CommandGoodsView implements Command{
	private String next;
	
	public CommandGoodsView( String _next ){
		next = _next;
	}
	
	public String execute(HttpServletRequest request) throws CommandException {
		try{
			request.setCharacterEncoding("utf-8");

			String id =request.getParameter("id");
			String cmd = request.getParameter("cmd");
			System.out.println("id 값 : "+ cmd);
			System.out.println("cmd 값 : "+ cmd);
			HoGoods Goods = null;
			HoGoodsImg GoodsImg = null;
			HashMap hm = new HashMap();
			System.out.println("View로 가는 id : " + id);
			hm.put("id", id);
			if(cmd.equals("goods-view")){
				String name = request.getParameter("name");
				System.out.println("name값  : " +name);
				hm.put("name", name);
				GoodsImg = HoMemberService.getInstance().GoodsItemImgView(hm);
			}
			Goods = HoMemberService.getInstance().GoodsView(hm);
			request.setAttribute("GoodsView", Goods);
			request.setAttribute("GoodsImgView", GoodsImg);
		}catch( Exception ex ){
			throw new CommandException("CommandGoodsView.java < 입력시 > " + ex.toString()); 
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
