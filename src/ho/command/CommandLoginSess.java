package ho.command;
import javax.servlet.http.HttpServletRequest;

public class CommandLoginSess implements Command{
	private String next;

	public CommandLoginSess( String _next ){
		next = _next;
	}

	public String execute( HttpServletRequest request ) throws CommandException{
	
		System.out.println("commandesess내의: "+request.getParameter("loginid"));
		request.setAttribute("loginid", request.getParameter("loginid"));
		return next;
	}
}
