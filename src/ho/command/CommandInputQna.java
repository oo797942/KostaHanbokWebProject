package ho.command;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import ho.model.HoMember;
import ho.service.HoMemberService;

public class CommandInputQna  implements Command{
	private String next;
	
	public CommandInputQna( String _next ){
		next = _next;
	}
	
	public String execute(HttpServletRequest request) throws CommandException {
		try{
			int result=0;
			request.setCharacterEncoding("utf-8");
			HashMap<String, Object> qnaMap= new HashMap<String,Object>();
			HashMap<String, Object> memMap= new HashMap<String,Object>();

			
			System.out.println("CommandInsert에 들어왔음");
			String cmd = request.getParameter("cmd");
			
			
			
			System.out.println("CommandInsert에서 imgInsert부분에 들어왔음");
			String id = request.getParameter("id");
			String name= request.getParameter("name");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			qnaMap.put("id", id);
			qnaMap.put("name", name);
			qnaMap.put("title", title);
			qnaMap.put("content", content);
			
			HoMemberService.getInstance().InsertQna(qnaMap);
			System.out.println("insert성공");
			
			
			
			memMap.put("id", id);
			
			HoMember hm =HoMemberService.getInstance().selectHoMemberByPrimaryKey(memMap);
		
			if(hm==null){
				result=2;
				//System.out.println("영재야!!!!"+hm.getMemId());
			}else{
				result=1;
				request.setAttribute("homem", hm);
				
			}
			request.setAttribute("result", result);
			
		}catch( Exception ex ){
			throw new CommandException("CommandInsert.java < 입력시 > " + ex.toString() ); 
		}
		return next;
	}

}
