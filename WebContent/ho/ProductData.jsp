<%@ page language="java" import="java.sql.*"%>
<%@ page import="ho.model.HoGoods"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<%
	String rtn_xml="";
	List<HoGoods> goods=null;
	Object obj =request.getAttribute("GoodsList");
	if(obj !=null) goods = (List<HoGoods>)obj;
	
	
	/* rtn_xml += "<custom>";
	for(HoGoods good : goods){
		if(!good.getGoodsImg().equals("null"))
		rtn_xml += "<person>";
		rtn_xml += "<name>" + good.getGoodsImg() + " </name>";
		rtn_xml += "</person>";
	}
	rtn_xml += "</custom>";
	out.print(rtn_xml);
	 */

	ArrayList list = new ArrayList();
	for(HoGoods good : goods){
		if(!good.getGoodsImg().equals("null"))
		list.add(good.getGoodsImg());
	}
	
	out.print(list);
	
%>
