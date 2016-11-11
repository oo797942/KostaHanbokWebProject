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
import ho.model.HoReply;
import ho.service.HoMemberService;
import ho.service.HoReplyService;

public class CommandGoodsView implements Command{
	private String next;
	
	public CommandGoodsView( String _next ){
		next = _next;
	}
	
	public String execute(HttpServletRequest request) throws CommandException {
		try{
			request.setCharacterEncoding("utf-8");
			String name="";
			String id =request.getParameter("id");
			String cmd = request.getParameter("cmd");
			System.out.println("id 값 : "+ id);	//GoodsId
			HoGoods Goods = null;
			HoGoodsImg GoodsImg = null;
			HashMap hm = new HashMap();
			System.out.println("View로 가는 id : " + id);
			if(cmd.equals("goods-view")||cmd.equals("goodsview")){
				name = request.getParameter("name");	//GoodsName
				System.out.println("name값  : " +name);	
				hm.put("name", name);
				GoodsImg = HoMemberService.getInstance().GoodsItemImgView(hm);
				HashMap<String,Object> rl = new HashMap();
				rl.put("id", request.getParameter("name1"));	//GoodsId
				List<HoReply> replylist = HoReplyService.getInstance().ReplyList(rl);
				if(replylist!=null) {
					request.setAttribute("replyList", replylist);
				}
				if(cmd.equals("goodsview")){
					//name=SE_F007, id=67
					name=request.getParameter("id");
					id=request.getParameter("name1");
				}
			}
	
			hm.put("id", id);
			hm.put("name", name);
			Goods = HoMemberService.getInstance().GoodsView(hm);
			
			request.setAttribute("GoodsView", Goods);
			request.setAttribute("GoodsImgView", GoodsImg);
		}catch( Exception ex ){
			throw new CommandException("CommandGoodsView.java < 입력시 > " + ex.toString()); 
		}
		return next;
	}



}
