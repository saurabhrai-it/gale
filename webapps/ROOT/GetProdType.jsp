<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%
	String baselineLoadTestNumber = request.getParameter("baselineTest");
	String currLoadTestNumber     = request.getParameter("name");
	session.setAttribute("baseLoadTestNew", baselineLoadTestNumber);
	session.setAttribute("currLoadTestNew", currLoadTestNumber);
%>
