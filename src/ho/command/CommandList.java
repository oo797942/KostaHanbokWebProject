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
import ho.service.HoMemberService;

public class CommandList implements Command{
	private String next;
	
	public CommandList( String _next ){
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
	         
	         HashMap<String,Integer> gm = new HashMap<String,Integer>();
	            gm.put("startrecord", startRecord);
	            gm.put("endrecord", endRecord);
	            HashMap<String,String> tm = new HashMap<String,String>();
		         tm.put("tableName", "item");


			System.out.println("CommandList에 들어왔음");
			List<HoGoods> list =  (List<HoGoods>) HoMemberService.getInstance().AllGoodsList(gm);
			int totalRecord = HoMemberService.getInstance().getTotalCount(tm);
			System.out.println(list);
			System.out.println("총페이지개수는 몇이되야될까: "+ totalRecord);
			request.setAttribute("GoodsList", list);
			request.setAttribute("totalRecord", totalRecord);
		}catch( Exception ex ){
			throw new CommandException("CommandList.java < 입력시 > " + ex.toString() ); 
		}
		return next;
	}

}
