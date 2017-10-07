<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="../../QAminiLogo.ico">

    <title>Gale Reports</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

    <script>
    $('ul.nav.navbar-nav.navbar-right li a').click(function() {
        $(this).parent().addClass('active').siblings().removeClass('active');
    });
    </script>
</head>

<body>
      <!-- Fixed navbar -->
      <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container">
          <div class="navbar-header">
            <a class="navbar-brand" href="#">GALE REPORTS</a>
          </div>
          <div id="navbar">
            <ul class="nav navbar-nav navbar-right">
              <li class="active"><a href="#AggregateReports" data-toggle="tab">Aggregate Reports</a></li>
              <li><a href="#ResponseTime" data-toggle="tab">Response Time Graphs</a></li>
            </ul>
          </div>
        </div>
      </nav>


    <div class="tab-content" style="margin-top:60px;">
      <div class="tab-pane active" id="AggregateReports" style="color:#333;">
      <div class="row">
      <div class="col-md-2" style="position:fixed;background-color:#fff">
        <h4 class="text-center" style="color:#777;">PRODUCT NAME</h4>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%
     //String binDir                       = System.getProperty("user.dir").toString();
     String currDir                        = "..\\webapps\\ROOT";
     String name                           = request.getParameter("testNumber");
     String fullFolderLocationAggregate    = "";
     String fullFolderLocationResponseTime = "";
     String desiredFolder                  = "";
     File mainFolder                       = new File(currDir);
     File[] mainFolders                    = mainFolder.listFiles();
     String testTime = "";String testValue = "";
     String errorMsg = "";String fileName  = "";
     for(int j=0; j < mainFolders.length;j++)
          {
             fileName = mainFolders[j].getName().toString();
             if(fileName.startsWith(name.toString()))
             {
                if(fileName.endsWith("28800"))
                    {testTime = "8 Hours";testValue = "28800";}
                else if(fileName.endsWith("7200"))
                    {testTime = "2 Hours";testValue = "7200";}
                else
                    errorMsg = "<strong color='red'>Unable to fetch data! Please check the folder with load test number exists!</strong>";
                break;
             }
          }
          if(errorMsg=="")
               {
                  desiredFolder                      = name + "_" + testValue;
                  fullFolderLocationAggregate        = currDir +"\\"+desiredFolder+"\\AggregateReport";
                  fullFolderLocationResponseTime     = currDir +"\\"+desiredFolder+"\\ResponseTime";
                  //fullFolderLocationResponseCode   = currDir +"\\"+desiredFolder+"\\ResponseCode";
                  File folderAggregate               = new File(fullFolderLocationAggregate);
                  File folderResponseTime            = new File(fullFolderLocationResponseTime);
                  //File folderResponseCode          = new File(fullFolderLocationResponseCode);
                  File[] listOfFoldersAggregate      = folderAggregate.listFiles();
                  File[] listOfFoldersResponseTime   = folderResponseTime.listFiles();
                  //File[] listOfFoldersResponseCode = folderResponseCode.listFiles();
                  String prodNameWithExtension="";String prodName="";String pathProductAggregate="";


           %>
           <ul style="list-style:none;">
           <%
                  for(int i=0; i < listOfFoldersAggregate.length;i++)
                    {
                     prodNameWithExtension  = listOfFoldersAggregate[i].getName();
                     prodName               = prodNameWithExtension.replace(".csv","");
                     pathProductAggregate   = fullFolderLocationAggregate+"\\"+prodNameWithExtension;
             %>
           <li><a class="btn cont" href="#<%=prodName%>" style="color:#777;cursor:pointer;text-decoration:none;"><%=prodName%></a></li><%}%>
         </ul>
         </div>
         <%
            for(int i=0; i < listOfFoldersAggregate.length;i++)
            {
                    prodNameWithExtension = listOfFoldersAggregate[i].getName();
                    prodName              = prodNameWithExtension.replace(".csv","");
                    pathProductAggregate  = fullFolderLocationAggregate+"\\"+prodNameWithExtension;
         %>
         <div class="col-md-10" style="margin-left:15%;">
         <h3 class="text-center" id="<%=prodName%>"><%=prodName%></h3>
         <table class="table table-striped" style="font-size:16px;">
           <thead>
             <tr>
               <th>Label</th>
               <th>Sample</th>
               <th>Average(Sec.)</th>
               <th>Median(Sec.)</th>
               <th>90% Line</th>
               <th>Min(Sec.)</th>
               <th>Max(Sec.)</th>
               <th>Error%</th>
               <th>Throughput</th>
               <th>KB/Sec</th>
             </tr>
           </thead>
           <tbody>
         <%
         String line;
         String[] dataInLine;
         FileReader fileReader         = new FileReader(pathProductAggregate);
         BufferedReader bufferedReader = new BufferedReader(fileReader);
         while ((line = bufferedReader.readLine()) != null) {
                if(line.startsWith("sampler_label"))
                   continue;
                   dataInLine        = line.split(",");
                   String label      = dataInLine[0];
                   int sample        = Integer.parseInt(dataInLine[1]);
                   float avg         = Float.parseFloat(dataInLine[2])/1000;
                   float median      = Float.parseFloat(dataInLine[3])/1000;
                   float ninetyline  = Float.parseFloat(dataInLine[4])/1000;
                   float min         = Float.parseFloat(dataInLine[5])/1000;
                   float max         = Float.parseFloat(dataInLine[6])/1000;
                   String error      = dataInLine[7];
                   String throughput = dataInLine[8];
                   String kbpersec   = dataInLine[9];
          %>
             <tr>
                <td><%=label%></td>
                <td><%=sample%></td>
                <td><%=avg%></td>
                <td><%=median%></td>
                <td><%=ninetyline%></td>
                <td><%=min%></td>
                <td><%=max%></td>
                <td><%=error%></td>
                <td><%=throughput%></td>
                <td><%=kbpersec%></td>
              </tr>
          <%}%>
         </tbody>
         </table>
      </div>
         <%}}%>
      </div>
      </div>







      <div class="tab-pane" id="ResponseTime">
         Step 2
         <a class="btn cont" href="#">sdsgsd</a>
      </div>
   </div>
<%=errorMsg%>
</body>
</html>