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

public class CommandBoardList implements Command{
	private String next;
	
	public CommandBoardList( String _next ){
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
	         
	         HashMap<String,Integer> bm = new HashMap<String,Integer>();
	            bm.put("startrecord", startRecord);
	            bm.put("endrecord", endRecord);
	         HashMap<String,String> tm = new HashMap<String,String>();
	         tm.put("tableName", "board");
			
			request.setCharacterEncoding("utf-8");
			System.out.println("CommandBoardList에 들어왔음");
			List<HoBoard> list =  (List<HoBoard>) HoMemberService.getInstance().AllBoardList(bm);
			int totalRecord = HoMemberService.getInstance().getTotalCount(tm);
			System.out.println(list);
			request.setAttribute("BoardList", list);
			request.setAttribute("totalRecord", totalRecord);
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
