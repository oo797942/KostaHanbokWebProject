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

public class CommandBoardView implements Command{
	private String next;
	
	public CommandBoardView( String _next ){
		next = _next;
	}
	
	public String execute(HttpServletRequest request) throws CommandException {
		try{
			request.setCharacterEncoding("utf-8");
			System.out.println("CommandBoardViewReply에 들어왔음");
			String id = request.getParameter("id");
			System.out.println("boardView 값 : " +id);
			HashMap boardmap = new HashMap();
			boardmap.put("id", id);
			HoBoard board =  (HoBoard) HoMemberService.getInstance().BoardView(boardmap);

			request.setAttribute("BoardView", board);
		}catch( Exception ex ){
			throw new CommandException("CommandGoodsView.java < 입력시 > " + ex.toString()); 
		}
		return next;
	}


}
