package ho.control;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ho.command.Command;
import ho.command.CommandBag;
import ho.command.CommandBoardList;
import ho.command.CommandBoardReply;
import ho.command.CommandBoardView;
import ho.command.CommandCheckId;
import ho.command.CommandCoinPay;
import ho.command.CommandDelete;
import ho.command.CommandException;
import ho.command.CommandGetInfoById;
import ho.command.CommandGoodsCategory;
import ho.command.CommandGoodsInputSearch;
import ho.command.CommandGoodsView;
import ho.command.CommandInputQna;
import ho.command.CommandInsert;
import ho.command.CommandInsertGoodsReply;
import ho.command.CommandInventoryUpdate;
import ho.command.CommandList;
import ho.command.CommandLogin;
import ho.command.CommandLoginSess;
import ho.command.CommandMemDelete;
import ho.command.CommandMemInsert;
import ho.command.CommandMemList;
import ho.command.CommandMemUpdate;
import ho.command.CommandMemView;
import ho.command.CommandModify;
import ho.command.CommandMyList;
import ho.command.CommandMyOrderList;
import ho.command.CommandNull;
import ho.command.CommandPay;
import ho.command.CommandReplyCheck;
import ho.command.CommandSaleList;
import ho.command.CommandUpdate;

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
		
		//회원가입 페이지
		commandMap.put("join-form", new CommandNull("ho_join.jsp"));
		commandMap.put("check-id", new CommandCheckId("CheckId.jsp"));
		commandMap.put("input-save", new CommandMemInsert("JoinOk.jsp"));
		
		
		
		commandMap.put("shoplogin-page", new CommandLoginSess("LoginPopUp.jsp"));
		commandMap.put("shop-login", new CommandLogin("LoginService.jsp"));
		commandMap.put("shop-main", new CommandBag("ShoppingMain.jsp"));
		commandMap.put("go-store", new CommandBag("ShoppingMain.jsp"));
		
		commandMap.put("Reply-check", new CommandReplyCheck("Reply-check.jsp"));

//		commandMap.put(key, value);		
		
		// 쇼핑몰 페이지
		commandMap.put("page-view", new CommandGetInfoById("purchaseView.jsp"));
		commandMap.put("pay-view", new CommandPay("ShoppingPay.jsp"));
		commandMap.put("coin-charge", new CommandBag("ShoppingCoin.jsp"));
		commandMap.put("coin-pay", new CommandCoinPay("ShoppingCoinPay.jsp"));
		commandMap.put("pay-view", new CommandPay("PurchaseOK.jsp"));

		commandMap.put("go-mypage", new CommandLogin("ShoppingMyPage.jsp"));
		commandMap.put("submit-mypage", new CommandUpdate("ShoppingMyPageUpdate.jsp"));
		commandMap.put("search-category", new CommandGoodsCategory("ShoppingSearch.jsp"));
		commandMap.put("search-input", new CommandGoodsInputSearch("ShoppingSearch.jsp"));
		commandMap.put("goods-view", new CommandGoodsView("ShoppingView.jsp"));
		commandMap.put("goodsview", new CommandGoodsView("ShoppingView.jsp"));
		commandMap.put("GoodsReply", new CommandInsertGoodsReply("ShoppingReplySuccess.jsp"));
		
		commandMap.put("mypage-list", new CommandMyList("ShoppingMyPageQnaList.jsp"));
		commandMap.put("Mylist-view", new CommandBoardView("ShoppingMyPageQnaView.jsp"));
		commandMap.put("mypage-orderlist", new CommandMyOrderList("ShoppingOrderList.jsp"));
		
		// admin 페이지
		commandMap.put("adminGoodsInsert", new CommandNull("adminGoodsinsert.jsp"));
		commandMap.put("adminGoodsimgInsert", new CommandInsert("adminGoodsimgInsert.jsp"));
		commandMap.put("adminGoodsInList", new CommandInsert("adminInsertSuccess.jsp"));
		commandMap.put("list-page", new CommandList("adminGoodsList.jsp"));
		commandMap.put("adminGoodsView", new CommandGoodsView("adminGoodsView.jsp"));
		commandMap.put("adminGoodsUpdate", new CommandGoodsView("adminGoodsUpdate.jsp"));
		commandMap.put("adminPageDelete", new CommandNull("adminGoodsDelete.jsp"));
		commandMap.put("delete", new CommandDelete("adminDeleteSuccess.jsp"));
		commandMap.put("modifylist", new CommandModify("adminGoodsList.jsp"));
		commandMap.put("adminGoodsimgUpdate", new CommandUpdate("adminGoodsimgUpdate.jsp"));
		commandMap.put("adminGoodsUpList", new CommandUpdate("adminUpdateSuccess.jsp"));
		commandMap.put("product-page", new CommandList("ProductData.jsp"));
		commandMap.put("admin-page", new CommandNull("adminPage.jsp"));
		commandMap.put("adminmenu1", new CommandSaleList("adminPagelist.jsp"));
		commandMap.put("adminmenu2", new CommandNull("adminGoods.jsp")); 
		commandMap.put("adminmenu3", new CommandMemList("adminMemlist.jsp"));
		commandMap.put("adminPagelist", new CommandNull("adminPagelist.jsp"));
		commandMap.put("adminBoardView", new CommandNull("adminBoardView.jsp"));
		commandMap.put("adminmenu4", new CommandBoardList("adminBoardList.jsp"));
		commandMap.put("adminBoardView", new CommandBoardView("adminBoardViewReply.jsp"));
		commandMap.put("adminGoodsInventory", new CommandNull("adminGoodsInventory.jsp"));
		commandMap.put("inventoryUpdate", new CommandInventoryUpdate("adminUpdateSuccess.jsp"));
		
		
		
		commandMap.put("write-form", new CommandNull("HoWriteForm.jsp"));
		commandMap.put("login-check", new CommandNull("HoLoginCheck.jsp"));
		commandMap.put("qna-input", new CommandInputQna("ShoppingMyPage.jsp"));

		
		commandMap.put("adminMemlist", new CommandMemList("adminMemlist.jsp"));
		commandMap.put("adminMemView", new CommandMemView("adminMemView.jsp"));
		commandMap.put("adminMemDelete", new CommandMemDelete("adminMemDelete.jsp"));
		commandMap.put("adminMemUpdateForm", new CommandMemView("adminMemUpdateForm.jsp"));
		commandMap.put("adminMemUpdateSave", new CommandMemUpdate("adminMemUpdateSave.jsp"));
		
 

		commandMap.put("boardlist", new CommandBoardReply("adminBoardSuccess.jsp"));

		
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
		System.out.println("cmd="+cmdKey+">");
		if( cmdKey == null ){
			System.out.println("cmdNull이니?");
			cmdKey = "main-page";
		}

		
		Command cmd = null;

		try{
			
			if( commandMap.containsKey( cmdKey ) ){//소문자로 바꿈
				cmd = (Command)commandMap.get( cmdKey );
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
