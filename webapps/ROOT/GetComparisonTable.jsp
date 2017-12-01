<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%
	String baselineLoadTestNumber = request.getParameter("baselineTest");
	if(!baselineLoadTestNumber.equals("noSelection"))
	{
	String currLoadTestNumber     = (String)session.getAttribute("name");
	String currLoadTestDuration   = (String)session.getAttribute("testValue");
	String currDir = (String)session.getAttribute("currDir");
	String desiredCurrentFolder = currLoadTestNumber+"_"+currLoadTestDuration;
	String desiredBaselineFolder = baselineLoadTestNumber+"_"+currLoadTestDuration;
	File[] listOfCurrentFoldersAggregate      = new File(currDir+"\\"+desiredCurrentFolder+"\\AggregateReport").listFiles();
    Arrays.sort(listOfCurrentFoldersAggregate);
	File[] listOfBaselineFoldersAggregate      = new File(currDir+"\\"+desiredBaselineFolder+"\\AggregateReport").listFiles();
    Arrays.sort(listOfBaselineFoldersAggregate);
	Set<File> hs1 = new TreeSet<>(Arrays.asList(listOfCurrentFoldersAggregate));
	Set<File> hs2 = new TreeSet<>(Arrays.asList(listOfBaselineFoldersAggregate));
	Set<File> allProductFile = new TreeSet<>();
    allProductFile.addAll(hs1);
    allProductFile.addAll(hs2);
%>
<div class="text-center">
        <h4 class="text-center" style="background-color:#C2B280;color:white;padding-top:10px;padding-bottom:10px;border-radius:10px;">Comparison Table</h4>
        <div class="col-md-10">
		  <div class="col-md-5 col-md-offset-1" style="padding-right:0px;">
		     <h3 class="text-center text-danger" style="background-color:#46C7C7;">Load Test : <%=baselineLoadTestNumber%></h3>
		  </div>
		  <div class="col-md-5"  style="padding-right:0px;">
		     <h3 class="text-center text-danger" style="background-color:#46C7C7">Load Test : <%=currLoadTestNumber%></h3>
		  </div>
			<table class="table table-bordered table-hover" style="font-size:14px;">
            <thead>
                         <tr class="text-center text-primary">
							<tr></tr>
                           <th>Products</th>
                           <th>Average Response Time(Seconds)</th>
                           <th>Samples</th>
						   <th>Error%</th>
                           <th>Average Response Time(Seconds)</th>
                           <th>Samples</th>
						   <th>Error%</th>
						   <th>Delta</th>
                         </tr>
            </thead>
            <tbody>
			<%
						String prodCurrentNameWithExtension = "";String prodCurrentName = "";String pathProductCurrentAggregate = "";
						String prodBaselineNameWithExtension = "";String prodBaselineName = "";String pathProductBaselineAggregate = "";
						for(File tempFile : allProductFile)
						{
								 
							     prodBaselineNameWithExtension  = tempFile.getName();
                                 prodBaselineName               = prodBaselineNameWithExtension.replace(".csv","");
                                 pathProductBaselineAggregate   = currDir+"\\"+desiredBaselineFolder+"\\AggregateReport\\"+prodBaselineNameWithExtension;
                                 String lineOverallBaseline="";String overallSampleBaseline="";String overallResponseTimeBaseline="";String overallErrorBaseline="";
                                 String[] dataInLineOverallBaseline;
                                 FileReader fileReaderOverallBaseline         = new FileReader(pathProductBaselineAggregate);
                                 BufferedReader bufferedReaderOverallBaseline = new BufferedReader(fileReaderOverallBaseline);
                                 while ((lineOverallBaseline = bufferedReaderOverallBaseline.readLine()) != null) {
                                     if(lineOverallBaseline.startsWith("TOTAL"))
                                     {
                                            dataInLineOverallBaseline        = lineOverallBaseline.split(",");
                                            overallSampleBaseline            = dataInLineOverallBaseline[1];
                                            overallResponseTimeBaseline      = String.format("%.03f", Float.parseFloat(dataInLineOverallBaseline[2])/1000);
                                            overallErrorBaseline      = String.format("%.02f", Float.parseFloat(dataInLineOverallBaseline[7])*100)+"%";
                                     }
                                     else
                                       continue;
						        }
			%>
					<tr>
						<td><%=prodBaselineName%></td>
						<td class="text-center"><%=overallResponseTimeBaseline%></td>
						<td><%=overallSampleBaseline%></td>
						<td><%=overallErrorBaseline%></td>
						<td class="text-center"><%=overallResponseTimeBaseline%></td>
						<td><%=overallSampleBaseline%></td>
						<td><%=overallErrorBaseline%></td>
					</tr>
			<%
						}
			%>
			</tbody>
		</div>		 
</div>
 <%
	}
 %>