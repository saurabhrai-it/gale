<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%
	String baselineLoadTestNumber = request.getParameter("baselineTest");
	if(!baselineLoadTestNumber.equals("noSelection"))
	{
	String currLoadTestNumber     = request.getParameter("name");
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
	Set<String> allProductFile = new TreeSet<>();
	for(File temphs1: hs1)
       allProductFile.add(temphs1.getName());
	for(File temphs2: hs2)
       allProductFile.add(temphs2.getName());
   File mainFolder                       = new File(currDir);
   File[] mainFolders                    = mainFolder.listFiles();
%>
<div class="text-center">
        <div class="col-md-10">
			<table class="table table-bordered table-hover" style="font-size:14px;">
            <thead>
                         <tr class="text-center text-primary">
                           <th>Products</th>
                           <th>Average Response Time(Seconds)</th>
                           <th>Samples</th>
						   <th>Error%</th>
                           <th>Average Response Time(Seconds)</th>
                           <th>Samples</th>
						   <th>Error%</th>
						   <th>Delta(Test <%=currLoadTestNumber%>-<%=baselineLoadTestNumber%>)</th>
                         </tr>
            </thead>
            <tbody>
			<%
						String prodCurrentNameWithExtension = "";String prodCurrentName = "";String pathProductCurrentAggregate = "";
						String prodBaselineNameWithExtension = "";String prodBaselineName = "";String pathProductBaselineAggregate = "";
                        String lineOverallBaseline="";String overallSampleBaseline="-";String overallResponseTimeBaseline="-";String overallErrorBaseline="-";
						String lineOverallCurrent="";String overallSampleCurrent="-";String overallResponseTimeCurrent="-";String overallErrorCurrent="-";
						String delta = "-";
						for(String tempFile : allProductFile)
						{
							prodBaselineNameWithExtension  = tempFile;
                            prodBaselineName               = prodBaselineNameWithExtension.replace(".csv","");
                            pathProductBaselineAggregate   = currDir+"\\"+desiredBaselineFolder+"\\AggregateReport\\"+prodBaselineNameWithExtension;
                            pathProductCurrentAggregate    = currDir+"\\"+desiredCurrentFolder+"\\AggregateReport\\"+prodBaselineNameWithExtension;
                            String[] dataInLineOverallBaseline;
                            String[] dataInLineOverallCurrent;
							
							if(hs2.toString().contains(tempFile)&&hs1.toString().contains(tempFile))
							{
                                 FileReader fileReaderOverallBaseline         = new FileReader(pathProductBaselineAggregate);
                                 BufferedReader bufferedReaderOverallBaseline = new BufferedReader(fileReaderOverallBaseline);
                                 while((lineOverallBaseline = bufferedReaderOverallBaseline.readLine()) != null){
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
								 
								 FileReader fileReaderOverallCurrent         = new FileReader(pathProductCurrentAggregate);
                                 BufferedReader bufferedReaderOverallCurrent = new BufferedReader(fileReaderOverallCurrent);
                                 while((lineOverallCurrent = bufferedReaderOverallCurrent.readLine()) != null){
                                     if(lineOverallCurrent.startsWith("TOTAL"))
                                     {
                                            dataInLineOverallCurrent        = lineOverallCurrent.split(",");
                                            overallSampleCurrent            = dataInLineOverallCurrent[1];
                                            overallResponseTimeCurrent      = String.format("%.03f", Float.parseFloat(dataInLineOverallCurrent[2])/1000);
                                            overallErrorCurrent      = String.format("%.02f", Float.parseFloat(dataInLineOverallCurrent[7])*100)+"%";
                                     }
                                     else
                                       continue;
						        }
								bufferedReaderOverallCurrent.close();
								fileReaderOverallCurrent.close();
								bufferedReaderOverallBaseline.close();
								fileReaderOverallBaseline.close();
							if(!overallResponseTimeBaseline.equals("-")&&!overallResponseTimeCurrent.equals("-"))
							{
								delta = String.format("%.03f", Float.parseFloat(overallResponseTimeCurrent)-Float.parseFloat(overallResponseTimeBaseline));
							}
			%>
					<tr>
						<td><%=prodBaselineName%></td>
						<td class="text-center"><%=overallResponseTimeBaseline%></td>
						<td><%=overallSampleBaseline%></td>
						<td><%=overallErrorBaseline%></td>
						<td class="text-center"><%=overallResponseTimeCurrent%></td>
						<td><%=overallSampleCurrent%></td>
						<td><%=overallErrorCurrent%></td>
						<td><%=delta%></td>
					</tr>
			<%
						   }
						
						else if(!hs2.toString().contains(tempFile)&&hs1.toString().contains(tempFile))
						{
								 overallResponseTimeBaseline=overallSampleBaseline=overallErrorBaseline="-";
							     FileReader fileReaderOverallCurrent         = new FileReader(pathProductCurrentAggregate);
                                 BufferedReader bufferedReaderOverallCurrent = new BufferedReader(fileReaderOverallCurrent);
                                 while((lineOverallCurrent = bufferedReaderOverallCurrent.readLine()) != null){
                                     if(lineOverallCurrent.startsWith("TOTAL"))
                                     {
                                            dataInLineOverallCurrent        = lineOverallCurrent.split(",");
                                            overallSampleCurrent            = dataInLineOverallCurrent[1];
                                            overallResponseTimeCurrent      = String.format("%.03f", Float.parseFloat(dataInLineOverallCurrent[2])/1000);
                                            overallErrorCurrent      = String.format("%.02f", Float.parseFloat(dataInLineOverallCurrent[7])*100)+"%";
                                     }
                                     else
                                       continue;
						        }
								bufferedReaderOverallCurrent.close();
								fileReaderOverallCurrent.close();
								delta="-";
			%>
					<tr>
						<td><%=prodBaselineName%></td>
						<td class="text-center"><%=overallResponseTimeBaseline%></td>
						<td><%=overallSampleBaseline%></td>
						<td><%=overallErrorBaseline%></td>
						<td class="text-center"><%=overallResponseTimeCurrent%></td>
						<td><%=overallSampleCurrent%></td>
						<td><%=overallErrorCurrent%></td>
						<td><%=delta%></td>
					</tr>
			<%
						}
						
						else if(hs2.toString().contains(tempFile)&&!hs1.toString().contains(tempFile))
						{
								 overallResponseTimeCurrent=overallSampleCurrent=overallErrorCurrent="-";
                                 FileReader fileReaderOverallBaseline         = new FileReader(pathProductBaselineAggregate);
                                 BufferedReader bufferedReaderOverallBaseline = new BufferedReader(fileReaderOverallBaseline);
                                 while((lineOverallBaseline = bufferedReaderOverallBaseline.readLine()) != null){
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
								bufferedReaderOverallBaseline.close();
								fileReaderOverallBaseline.close();
								delta="-";
						
			%>
					<tr>
						<td><%=prodBaselineName%></td>
						<td class="text-center"><%=overallResponseTimeBaseline%></td>
						<td><%=overallSampleBaseline%></td>
						<td><%=overallErrorBaseline%></td>
						<td class="text-center"><%=overallResponseTimeCurrent%></td>
						<td><%=overallSampleCurrent%></td>
						<td><%=overallErrorCurrent%></td>
						<td><%=delta%></td>
					</tr>
			<%
						}
					 }
			%>
			</tbody>
		</div>		 
</div>
 <%
	}
 %>