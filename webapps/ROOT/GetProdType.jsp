<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%
	String baselineLoadTestNumber = request.getParameter("baselineTest");
	if(!baselineLoadTestNumber.equals("noSelection"))
	{
	String currLoadTestNumber     = request.getParameter("name");
	String currLoadTestDuration   = (String)session.getAttribute("testValue");
	String currDir = (String)session.getAttribute("currDir");
	session.setAttribute("baseLoadTestNew", baselineLoadTestNumber);
	session.setAttribute("currLoadTestNew", currLoadTestNumber);
	
	String productType = request.getParameter("prodType");
	
	String desiredCurrentFolder = currLoadTestNumber+"_"+currLoadTestDuration;
	String desiredBaselineFolder = baselineLoadTestNumber+"_"+currLoadTestDuration;
	   
	File[] listOfCurrentFoldersAggregate      = new File(currDir+"\\"+desiredCurrentFolder+"\\AggregateReport").listFiles();
    Arrays.sort(listOfCurrentFoldersAggregate);
	File[] listOfBaselineFoldersAggregate      = new File(currDir+"\\"+desiredBaselineFolder+"\\AggregateReport").listFiles();
    Arrays.sort(listOfBaselineFoldersAggregate);
	
	Set<File> hs1 = new TreeSet<>(Arrays.asList(listOfCurrentFoldersAggregate));
	Set<File> hs2 = new TreeSet<>(Arrays.asList(listOfBaselineFoldersAggregate));
	
   if(productType.equals("Overall"))
   {
%>
<div class="col-sm-offset-1 col-sm-10" id="comparisonTable"></div>
				<script>
			function getCompTable(baseTest,currTest,prodType) {
				xhttp = new XMLHttpRequest();
				xhttp.onreadystatechange = function() {
					if (this.readyState == 4 && this.status == 200) {
						document.getElementById("comparisonTable").innerHTML = this.responseText;
					}
				};
			xhttp.open("POST","GetComparisonTable3.jsp?baselineTest="+baseTest+"&name="+currTest+"&prodType="+prodType,true);
			xhttp.send();
			}
			</script>
 <%		}
 else{
	 %>
	 
	 <div class="text-center">
        <div class="col-sm-12">
			<table class="table table-bordered table-hover" style="font-size:14px;">
            <thead>
                         <tr class="text-center text-primary">
                           <th>Label</th>
                           <th>Average Response Time (Seconds)</th>
                           <th>Samples</th>
						   <th>Error%</th>
                           <th>Average Response Time (Seconds)</th>
                           <th>Samples</th>
						   <th>Error%</th>
						   <th>Delta(Test <%=currLoadTestNumber%>-<%=baselineLoadTestNumber%>)</th>
                         </tr>
            </thead>
            <tbody>
	 
	 <%
			FileReader fileReaderOverallBaseline         = new FileReader(currDir+"\\"+desiredCurrentFolder+"\\AggregateReport\\"+productType+".csv");
            BufferedReader bufferedReaderOverallBaseline = new BufferedReader(fileReaderOverallBaseline);
			FileReader fileReaderOverallCurrent         = new FileReader(currDir+"\\"+desiredBaselineFolder+"\\AggregateReport\\"+productType+".csv");
            BufferedReader bufferedReaderOverallCurrent  = new BufferedReader(fileReaderOverallCurrent);
			Set<String> allTransactionName = new TreeSet<>();
			HashMap<String,String> baseTransactionName = new HashMap<String,String>();
			HashMap<String,String> currTransactionName = new HashMap<String,String>();
			String[] dataInLine;String label;String resTime;String sample;String err;
			String lineOverallBaseline="";String lineOverallCurrent="";
            while((lineOverallBaseline = bufferedReaderOverallBaseline.readLine()) != null){
                if(!lineOverallBaseline.startsWith("TOTAL")&&!lineOverallBaseline.startsWith("sampler_label"))
                {
					dataInLine       = lineOverallBaseline.split(",");
                    label            = dataInLine[0];
                    resTime            = String.format("%.03f", Float.parseFloat(dataInLine[2])/1000);
                    sample            = dataInLine[1];
                    err            = String.format("%.02f", Float.parseFloat(dataInLine[7])*100)+"%";
					baseTransactionName.put(label,sample+"*"+resTime+"*"+err);
					allTransactionName.add(label);
				}
			}
            while((lineOverallCurrent = bufferedReaderOverallCurrent.readLine()) != null){
                if(!lineOverallCurrent.startsWith("TOTAL")&&!lineOverallCurrent.startsWith("sampler_label"))
                {
					dataInLine        = lineOverallCurrent.split(",");
                    label            = dataInLine[0];
                    resTime            = String.format("%.03f", Float.parseFloat(dataInLine[2])/1000);
                    sample            = dataInLine[1];
                    err            = String.format("%.02f", Float.parseFloat(dataInLine[7])*100)+"%";
					currTransactionName.put(label,sample+"*"+resTime+"*"+err);
					allTransactionName.add(label);
				}
			}
			bufferedReaderOverallBaseline.close();
			fileReaderOverallBaseline.close();
			bufferedReaderOverallCurrent.close();
			fileReaderOverallCurrent.close();
			String overallSampleBaseline="-";String overallResponseTimeBaseline="-";String overallErrorBaseline="-";
			String overallSampleCurrent="-";String overallResponseTimeCurrent="-";String overallErrorCurrent="-";
			
			for(String tempFile : allTransactionName)
			{
				String responseTimeBaseline="-";String sampleBaseline="-";String errorBaseline="-";
				String responseTimeCurrent="-";String sampleCurrent="-";String errorCurrent="-";
				String deltaResponse="-";String[] currTransactionDataArray;String[] baseTransactionDataArray;
				if(baseTransactionName.keySet().toString().contains(tempFile)&&currTransactionName.keySet().toString().contains(tempFile))
				{
					String currTransactionData = currTransactionName.get(tempFile);
					String baseTransactionData = baseTransactionName.get(tempFile);
					currTransactionDataArray = currTransactionData.split("\\*");
					baseTransactionDataArray = baseTransactionData.split("\\*");
					responseTimeBaseline = baseTransactionDataArray[1];
					sampleBaseline = baseTransactionDataArray[0];
					errorBaseline = baseTransactionDataArray[2];
					responseTimeCurrent = currTransactionDataArray[1];
					sampleCurrent = currTransactionDataArray[0];
					errorCurrent = currTransactionDataArray[2];
					if(!responseTimeBaseline.equals("-")&&!responseTimeCurrent.equals("-"))
							{
								deltaResponse = String.format("%.03f", Float.parseFloat(responseTimeCurrent)-Float.parseFloat(responseTimeBaseline));
							}
					%>
					<tr>
						<td class="text-left"><%=tempFile%></td>
						<td class="text-center"><%=responseTimeBaseline%></td>
						<td><%=sampleBaseline%></td>
						<td><%=errorBaseline%></td>
						<td class="text-center"><%=responseTimeCurrent%></td>
						<td><%=sampleCurrent%></td>
						<td><%=errorCurrent%></td>
						<td><%=deltaResponse%></td>
					</tr>
			       <%
				}
				if(baseTransactionName.keySet().toString().contains(tempFile)&&!currTransactionName.keySet().toString().contains(tempFile))
				{
					String baseTransactionData = baseTransactionName.get(tempFile);
					baseTransactionDataArray = baseTransactionData.split("\\*");
					responseTimeBaseline = baseTransactionDataArray[1];
					sampleBaseline = baseTransactionDataArray[0];
					errorBaseline = baseTransactionDataArray[2];
					responseTimeCurrent = "-";
					sampleCurrent = "-";
					errorCurrent = "-";
					if(!responseTimeBaseline.equals("-")&&!responseTimeCurrent.equals("-"))
							{
								deltaResponse = String.format("%.03f", Float.parseFloat(responseTimeCurrent)-Float.parseFloat(responseTimeBaseline));
							}
					%>
					<tr>
						<td class="text-left"><%=tempFile%></td>
						<td class="text-center"><%=responseTimeBaseline%></td>
						<td><%=sampleBaseline%></td>
						<td><%=errorBaseline%></td>
						<td class="text-center"><%=responseTimeCurrent%></td>
						<td><%=sampleCurrent%></td>
						<td><%=errorCurrent%></td>
						<td><%=deltaResponse%></td>
					</tr>
			       <%
				}
				if(!baseTransactionName.keySet().toString().contains(tempFile)&&currTransactionName.keySet().toString().contains(tempFile))
				{
					String currTransactionData = currTransactionName.get(tempFile);
					currTransactionDataArray = currTransactionData.split("\\*");
					responseTimeBaseline = "-";
					sampleBaseline = "-";
					errorBaseline = "-";
					responseTimeCurrent = currTransactionDataArray[1];
					sampleCurrent = currTransactionDataArray[0];
					errorCurrent = currTransactionDataArray[2];
					deltaResponse="-";
					%>
					<tr>
						<td class="text-left"><%=tempFile%></td>
						<td class="text-center"><%=responseTimeBaseline%></td>
						<td><%=sampleBaseline%></td>
						<td><%=errorBaseline%></td>
						<td class="text-center"><%=responseTimeCurrent%></td>
						<td><%=sampleCurrent%></td>
						<td><%=errorCurrent%></td>
						<td><%=deltaResponse%></td>
					</tr>
			       <%
				}
			}
			%>
			</tbody>
			</table>
		</div>
	</div>
			<%
    }
}
 %>