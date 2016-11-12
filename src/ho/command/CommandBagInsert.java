package ho.command;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import ho.command.CommandException;
import ho.model.HoBag;
import ho.model.HoException;
import ho.model.HoMember;
import ho.service.HoBagService;
import ho.service.HoMemberService;

public class CommandBagInsert implements Command {
	private String next;

	public CommandBagInsert(String _next) {
		next = _next;
	}

	public String execute(HttpServletRequest request) throws CommandException {
		try {

			HashMap<String, Object> memMap = new HashMap<String, Object>();
			HttpSession sess = request.getSession();

			String id = (String) sess.getAttribute("yourid");
			String itemname = request.getParameter("itemname");
			String img = request.getParameter("imgs");
			String shopid = request.getParameter("itemno");

			System.out.println("아이디:" + id);
			System.out.println("itemname ::: " + itemname);
			System.out.println("img ::: " + img);
			System.out.println("itemno ::: " + shopid);

			memMap.put("id", id);
			memMap.put("itemname", itemname);
			memMap.put("img", img);
			memMap.put("itemno", shopid);
			HoBagService.getInstance().insertShoppingBag(memMap);
			System.out.println("아이디는 제대로 넘겼지?? >> " + id);


		} catch (Exception ex) {
			throw new CommandException("CommandBagInsert.java < 입력시 > " + ex.toString());
		}
		return next;
	}

}
