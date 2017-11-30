<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%
	String baselineLoadTestNumber = (String)session.getAttribute("baselineLoadTestNumber");
	String currLoadTestNumber     = (String)session.getAttribute("name");
	String currLoadTestDuration   = (String)session.getAttribute("testValue");
	String currDir = (String)session.getAttribute("currDir");
	String desiredCurrentFolder = currLoadTestNumber+"_"+currLoadTestDuration;
	String desiredBaselineFolder = baselineLoadTestNumber+"_"+currLoadTestDuration;
	File[] listOfCurrentFoldersAggregate      = new File(currDir+"\\"+desiredCurrentFolder+"\\AggregateReport").listFiles();
    Arrays.sort(listOfCurrentFoldersAggregate);
	File[] listOfBaselineFoldersAggregate      = new File(currDir+"\\"+desiredBaselineFolder+"\\AggregateReport").listFiles();
    Arrays.sort(listOfBaselineFoldersAggregate);
	
%>
<div class="jumbotron text-center">
<div class="col-md-4 col-md-offset-2">
            <h4 class="text-center" style="background-color:#C2B280;color:white;padding-top:10px;padding-bottom:10px;border-radius:10px;">Comparison Table</h4>
            <table class="table table-bordered table-hover" style="font-size:14px;">
            <thead>
                         <tr colspan=4 class="text-center text-danger">Load Test : <%=currLoadTestNumber%>
                           <th>Products</th>
                           <th>Average Response Time(Seconds)</th>
                           <th>Samples</th>
						   <th>Error%</th>
                         </tr>
            </thead>
            <tbody>
            <%				  String prodCurrentNameWithExtension = "";String prodCurrentName = "";String pathProductCurrentAggregate = "";
                              for(int j=0; j < listOfCurrentFoldersAggregate.length;j++)
                                {
                                 prodCurrentNameWithExtension  = listOfCurrentFoldersAggregate[j].getName();
                                 prodCurrentName               = prodCurrentNameWithExtension.replace(".csv","");
                                 pathProductCurrentAggregate   = currDir+"\\"+desiredCurrentFolder+"\\AggregateReport\\"+prodCurrentNameWithExtension;
                                 String lineOverallCurrent;String overallSampleCurrent;String overallResponseTimeCurrent;String overallErrorCurrent;
                                 String[] dataInLineOverallCurrent;
                                 FileReader fileReaderOverallCurrent         = new FileReader(pathProductCurrentAggregate);
                                 BufferedReader bufferedReaderOverallCurrent = new BufferedReader(fileReaderOverallCurrent);
                                 while ((lineOverallCurrent = bufferedReaderOverallCurrent.readLine()) != null) {
                                     if(lineOverallCurrent.startsWith("TOTAL"))
                                     {
                                            dataInLineOverallCurrent        = lineOverallCurrent.split(",");
                                            overallSampleCurrent            = dataInLineOverallCurrent[1];
                                            overallResponseTimeCurrent      = String.format("%.03f", Float.parseFloat(dataInLineOverallCurrent[2])/1000);
                                            overallErrorCurrent      = String.format("%.02f", Float.parseFloat(dataInLineOverallCurrent[7])*100)+"%";
                                     }
                                     else
                                       continue;
            %>
            <tr>
                <td><%=prodCurrentName%></td>
                <td class="text-center"><%=overallResponseTimeCurrent%></td>
                <td><%=overallSampleCurrent%></td>
                <td><%=overallErrorCurrent%></td>
            </tr>
            <%
                                }}
            %>
          </tbody>
         </table>
         </div>