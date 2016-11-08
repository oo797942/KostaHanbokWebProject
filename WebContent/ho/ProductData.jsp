<%@ page language="java" import="java.sql.*"%>
<%@ page import="ho.model.HoGoods"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<%
	String rtn_xml="";
	List<HoGoods> goods=null;
	Object obj =request.getAttribute("GoodsList");
	if(obj !=null) goods = (List<HoGoods>)obj;
	
	
	rtn_xml += "<totalimg>";
	for(HoGoods good : goods){
		if(!good.getGoodsImg().equals("null"))
		rtn_xml += "<img>";
		rtn_xml += "<name>" + good.getGoodsImg() + " </name>";
		rtn_xml += "</pimg>";
	}
	rtn_xml += "</totalimg>";
	out.print(rtn_xml);
%>
