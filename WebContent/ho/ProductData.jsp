<%@ page language="java" import="java.sql.*"%>
<%@ page import="ho.model.HoGoods"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<%
	String rtn_xml="";
	List<HoGoods> goods=null;
	Object obj =request.getAttribute("GoodsList");
	if(obj !=null) goods = (List<HoGoods>)obj;
	
	ArrayList list = new ArrayList();
	
	rtn_xml += "<customer>";
	for(HoGoods good : goods){
		rtn_xml += "<person>";
		rtn_xml += "<name>" + good.getGoodsImg() + " </name>";
		rtn_xml += "</person>";
	}
	rtn_xml += "</customer>";
	out.print(rtn_xml);
%>
