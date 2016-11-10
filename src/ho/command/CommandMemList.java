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
import ho.model.HoBoard;
import ho.service.HoMemberService;

public class CommandMemList implements Command{
	private String next;
	
	public CommandMemList( String _next ){
		next = _next;
	}
	
	public String execute(HttpServletRequest request) throws CommandException {
		try{
			
			 int nowpagenum=1;
			 int countPerPage = 7;
			 String page = request.getParameter("pagenum");
			 if(page!=null) nowpagenum = Integer.parseInt(page);
			 int startRecord = nowpagenum*countPerPage-(countPerPage-1);
	         int endRecord = nowpagenum*countPerPage;
	         
	         HashMap<String,Integer> mm = new HashMap<String,Integer>();
	            mm.put("startrecord", startRecord);
	            mm.put("endrecord", endRecord);
	         HashMap<String,String> tm = new HashMap<String,String>();
	         	tm.put("tableName", "member");
			request.setCharacterEncoding("utf-8");
			System.out.println("CommandBoardList에 들어왔음");              
			List<HoMember> list =  (List<HoMember>) HoMemberService.getInstance().AllMemberList(mm);
			int totalRecord = HoMemberService.getInstance().getTotalCount(tm);
			System.out.println(list);
			request.setAttribute("memberList", list);
			request.setAttribute("totalRecord", totalRecord);
		}catch( Exception ex ){
			throw new CommandException("CommandMemList.java < 입력시 > " + ex.toString()); 
		}
		return next;
	}

}
