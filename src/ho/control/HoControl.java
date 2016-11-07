package ho.control;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ho.command.Command;
import ho.command.CommandException;
import ho.command.CommandGoodsView;
import ho.command.CommandInsert;
import ho.command.CommandList;
import ho.command.CommandLogin;
import ho.command.CommandNull;

/**
 * Servlet implementation class GuestControl
 */
public class HoControl extends HttpServlet {
	
	private HashMap commandMap;
	private String	jspDir = "/ho/";
	private String  error = "error.jsp";
	

    public HoControl() {
        super();       
		initCommand();
	}

	private void initCommand(){
		commandMap = new HashMap();
		commandMap.put("login-page", new CommandLogin("LoginService.jsp"));
		commandMap.put("main-page", new CommandNull("HoMainForm.jsp"));
		commandMap.put("logout-page", new CommandNull("LogoutService.jsp"));
		commandMap.put("adminGoodsimgInsert", new CommandInsert("adminGoodsimgInsert.jsp"));
		commandMap.put("adminGoodsList", new CommandInsert("adminInsertSuccess.jsp"));
		commandMap.put("list-page", new CommandList("adminGoodsList.jsp"));
		commandMap.put("adminGoodsView", new CommandGoodsView("adminGoodsView.jsp"));
		commandMap.put("adminGoodsInsert", new CommandNull("adminGoodsinsert.jsp"));
	
		// admin 페이지
		commandMap.put("admin-page", new CommandNull("adminPage.jsp"));
		commandMap.put("adminmenu1", new CommandNull("adminPagelist.jsp"));
		commandMap.put("adminmenu2", new CommandNull("adminGoods.jsp"));
		commandMap.put("adminmenu3", new CommandNull("adminMemlist.jsp"));
		commandMap.put("adminmenu4", new CommandNull("adminBoardList.jsp"));
/*		commandMap.put("adminMemView", new CommandNull("adminMemView.jsp"));
		commandMap.put("admiMemlist", new CommandNull("admiMemlist.jsp"));
		commandMap.put("adminGoodsUpdate", new CommandNull("adminGoodsUpdate.jsp"));
		commandMap.put("adminGoodsimgUpdate", new CommandNull("adminGoodsimgUpdate.jsp"));
		commandMap.put("adminPageDelete", new CommandNull("adminGoodsDelete.jsp"));
		commandMap.put("adminBoardView", new CommandNull("adminBoardView.jsp"));
		commandMap.put("adminBoardList", new CommandNull("adminBoardList.jsp"));
		commandMap.put("adminPagelist", new CommandNull("adminPagelist.jsp"));
*/
		
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}
	

	private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		String nextPage = "";
		String cmdKey	= request.getParameter("cmd");
		System.out.println(cmdKey);
		if( cmdKey == null ){
			System.out.println("cmdNull이니?");
			cmdKey = "main-page";
		}

		
		Command cmd = null;

		try{
			
			if( commandMap.containsKey( cmdKey.toLowerCase() ) ){//소문자로 바꿈
				cmd = (Command)commandMap.get( cmdKey.toLowerCase());
			}else{
				throw new CommandException("지정할 명령어가 존재하지 않음");
			}

			nextPage = cmd.execute( request );


		}catch( CommandException e ){
			request.setAttribute("javax.servlet.jsp.jspException", e );
			nextPage = error;
			System.out.println("오류 : " + e.getMessage() );
		}

		System.out.println("경민아!!!!"+nextPage);
		RequestDispatcher reqDp = getServletContext().getRequestDispatcher( jspDir + nextPage );
		reqDp.forward( request, response );
		
	}

}
