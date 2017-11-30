<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%
	String baselineLoadTestNumber = "";
	String currLoadTestNumber     = request.getParameter("currLoadTestNumber");
	String currLoadTestDuration   = request.getParameter("currLoadTestDuration");
	if(request.getParameter("isBaselineFilePresent").equals("false"))
	{
		baselineLoadTestNumber = request.getParameter("baselineLoadTestNumber");
		String currDir = "..\\webapps\\ROOT\\Reports";
		String desiredFolder = currLoadTestNumber+"_"+currLoadTestDuration;
		FileWriter baselineFileWriter = new FileWriter(currDir +"\\"+desiredFolder+"\\BaselineTestNum.txt",true);
		baselineFileWriter.write(baselineLoadTestNumber);
		baselineFileWriter.close();
	}
%>
<div >
	<h1>
		Baseline Test Number : <%=baselineLoadTestNumber%><br/>
		Current Test Number :<%=currLoadTestNumber%>
	</h1>
</div>