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

public class CommandGoodsReplyList implements Command{
	private String next;
	
	public CommandGoodsReplyList( String _next ){
		next = _next;
	}
	
	public String execute(HttpServletRequest request) throws CommandException {
		try{
		
			
			
			
		}catch( Exception ex ){
			throw new CommandException("CommandMemList.java < 입력시 > " + ex.toString()); 
		}
		return next;
	}

}
