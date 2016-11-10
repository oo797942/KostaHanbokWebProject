<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" import="java.sql.*"%>
<%@ page import="ho.model.HoGoods"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<%
   String rtn_xml="";
   List<HoGoods> goods=null;
   Object obj =request.getAttribute("OriginalGoodsList");
   if(obj !=null) goods = (List<HoGoods>)obj;
   
   ArrayList list = new ArrayList();
      
   JSONObject json = new JSONObject();
   for(HoGoods good : goods){   
      list.add(good.getGoodsImg());
   }
   
   json.put("list",list);
   out.print(json);
%>