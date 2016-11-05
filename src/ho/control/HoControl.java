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
import ho.command.CommandLogin;
import ho.command.CommandNull;

/**
 * Servlet implementation class GuestControl
 */
public class HoControl extends HttpServlet {
	
	private HashMap commandMap;
	private String	jspDir = "/Mainpage/";
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
	
		// 나머지도 추가하기		
		
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
