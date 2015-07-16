<%@ page import="admin.*"%>
<%
	String b_id,b_name,b_aid,b_cname,b_pbname,b_summary,b_img,b_qty;
	b_id=request.getParameter("bid");
	b_name=request.getParameter("bname");
	b_aid=request.getParameter("aid");
	b_cname=request.getParameter("cname");
	b_pbname=request.getParameter("pbname");
	b_summary=request.getParameter("summary");
	b_img=request.getParameter("img");
	b_qty=request.getParameter("qty");
	bookentry b=new bookentry();
	b.insert(b_id,b_name,b_aid,b_cname,b_pbname,b_summary,b_img,b_qty);
	b.disconnect();
	
%>
