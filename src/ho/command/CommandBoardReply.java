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

public class CommandBoardReply implements Command{
	private String next;
	
	public CommandBoardReply( String _next ){
		next = _next;
	}
	
	public String execute(HttpServletRequest request) throws CommandException {
		try{
			request.setCharacterEncoding("utf-8");
			System.out.println("CommandBoardReply에 들어왔음");
			String writer = request.getParameter("writer");
			System.out.println(writer);
			String content = request.getParameter("content");
			System.out.println(content);
			String answer = request.getParameter("answer");
			System.out.println(answer);
			
			HashMap boardmap = new HashMap();
			boardmap.put("writer", writer);
			boardmap.put("content", content);
			boardmap.put("answer", answer);
			HoMemberService.getInstance().BoardReply(boardmap);

		}catch( Exception ex ){
			throw new CommandException("CommandGoodsView.java < 입력시 > " + ex.toString()); 
		}
		return next;
	}


}
