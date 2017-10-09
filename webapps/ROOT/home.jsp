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
    <style>
    .btn{
      font-size:14px;
      padding:4px 8px;
    }
    li.addHoverManager:hover{
        background-color: #e3e3e3;
    }

    .boldMaker{
     font-weight:600;
    }
    </style>
</head>
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
%>
<body>
      <nav class="navbar navbar-default">
        <div class="container" style="padding-left:0px;">
          <div class="navbar-header">
            <a href="#" id="goTop"><img src="../../qaLogo.jpg" height="50px" style="float:left;margin-left:-80px;"/></a>
            <a class="navbar-brand" href="#">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;GALE REPORTS</a>
            <a class="navbar-brand" href="#">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;LOAD TEST NUMBER : <%=name%></a>
            <a class="navbar-brand" href="#">DURATION : <%=testTime%></a>
          </div>
          <div id="navbar">
            <ul class="nav navbar-nav navbar-right">
              <li class="active"><a href="#AggregateReports" data-toggle="tab">Aggregate Reports</a></li>
              <li><a href="#ResponseTime" data-toggle="tab">Response Time Graphs</a></li>
            </ul>
          </div>
        </div>
      </nav>

   <div class="footer" style="position:fixed;z-index:999999;bottom:0;left:0;">
   <a href="#goTop" style="text-decoration:none;">
   <button type="button" class="btn btn-secondary" data-toggle="tooltip" data-placement="right" title="GO TOP">
     <span class="glyphicon glyphicon glyphicon-triangle-top" aria-hidden="true"></span>
     <strong>TOP</strong>
   </button></a>
    </div>
    <div class="tab-content">
      <div class="tab-pane active" id="AggregateReports">
      <div class="row" style="margin-right:0;">
      <div class="col-md-2" style="position:absolute;background-color:#f8f8f8;">
        <h4 class="text-center" style="color:#111;">PRODUCT NAME</h4>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%
          if(errorMsg=="")
               {
                  desiredFolder                      = name + "_" + testValue;
                  fullFolderLocationAggregate        = currDir +"\\"+desiredFolder+"\\AggregateReport";
                  fullFolderLocationResponseTime     = currDir +"\\"+desiredFolder+"\\ResponseTime";
                  File folderAggregate               = new File(fullFolderLocationAggregate);
                  File folderResponseTime            = new File(fullFolderLocationResponseTime);
                  File[] listOfFoldersAggregate      = folderAggregate.listFiles();
                  File[] listOfFoldersResponseTime   = folderResponseTime.listFiles();
                  String prodNameWithExtension="";String prodName="";String pathProductAggregate="";
                  String prodResTimeWithExtension="";String prodResTime="";String pathProductResTime="";
           %>
           <ul style="list-style:none;">
           <%
                  for(int i=0; i < listOfFoldersAggregate.length;i++)
                    {
                     prodNameWithExtension  = listOfFoldersAggregate[i].getName();
                     prodName               = prodNameWithExtension.replace(".csv","");
                     pathProductAggregate   = fullFolderLocationAggregate+"\\"+prodNameWithExtension;
             %>
           <li class="addHoverManager">
             <a class="btn cont" id="transit" href="#<%=prodName%>" style="color:#777;cursor:pointer;text-decoration:none;padding-left:40px;">
                <%=prodName%>
             </a>
           </li>
                    <%}%>
         </ul>
         </div>
         <%
            for(int i=0; i < listOfFoldersAggregate.length;i++)
            {
                    prodNameWithExtension = listOfFoldersAggregate[i].getName();
                    prodName              = prodNameWithExtension.replace(".csv","");
                    pathProductAggregate  = fullFolderLocationAggregate+"\\"+prodNameWithExtension;
         %>
         <div class="col-md-10" style="margin-left:16%;">
         <h3 class="text-center" id="<%=prodName%>"><%=prodName%></h3>
         <table class="table table-striped table-bordered" style="font-size:16px;">
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

                    String bold = "";
                    if(line.startsWith("TOTAL"))
                        bold = "class='boldMaker'";

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
                   String errorString=error.replace("%","");
                   float errorFloat=Float.parseFloat(errorString);
                   if(errorFloat>=2.0)
                      errorString = "<td style='color:red;font-weight:600;'>"+error+"</td>";
                   else
                      errorString = "<td>"+error+"</td>";
                   String avgString;
                   if(avg>=3.0)
                    avgString = "<td style='color:red;font-weight:600;'>"+avg+"</td>";
                   else
                    avgString = "<td>"+avg+"</td>";
          %>
             <tr <%=bold%>>
                <td><%=label%></td>
                <td><%=sample%></td>
                <%=avgString%>
                <td><%=median%></td>
                <td><%=ninetyline%></td>
                <td><%=min%></td>
                <td><%=max%></td>
                <%=errorString%>
                <td><%=throughput%></td>
                <td><%=kbpersec%></td>
              </tr>
          <%
          }
          bufferedReader.close();
          fileReader.close();
          %>
         </tbody>
         </table>
              <hr/>
      </div>
         <%}%>
      </div>
      </div>







      <div class="tab-pane" id="ResponseTime">
        <div class="row" style="margin-right:0;">
         <div class="col-md-2" style="position:absolute;background-color:#f8f8f8;">
          <h4 class="text-center" style="color:#111;">PRODUCT NAME</h4>
          <ul style="list-style:none;">
                    <%
                           for(int i=0; i < listOfFoldersResponseTime.length;i++)
                             {
                              prodResTimeWithExtension  = listOfFoldersResponseTime[i].getName();
                              prodResTime               = prodResTimeWithExtension.replace(".png","");
                              pathProductResTime   = fullFolderLocationResponseTime+"\\"+prodResTimeWithExtension;
                      %>
                    <li class="addHoverManager">
                      <a class="btn cont" id="transit" href="#<%=prodResTime%>ResTime" style="color:#777;cursor:pointer;text-decoration:none;padding-left:40px;">
                         <%=prodResTime%>
                      </a>
                    </li>
                             <%}%>
          </ul>
         </div>

                <div class="col-md-10" style="margin-left:16%;">
                    <%
                          for(int i=0; i < listOfFoldersResponseTime.length;i++)
                             {
                               prodResTimeWithExtension  = listOfFoldersResponseTime[i].getName();
                               prodResTime               = prodResTimeWithExtension.replace(".png","");
                               pathProductResTime        = "\\"+desiredFolder+"\\ResponseTime\\"+prodResTimeWithExtension;

                    %>
                    <h3 class="text-center" id="<%=prodResTime%>ResTime"><%=prodResTime%></h3>
                    <div class="text-center">
                     <img src="<%=pathProductResTime%>" class="img-fluid img-thumbnail" alt="<%=prodResTime%> : Response Time Graph"/>

                    </div>
                    <%}%>
                </div>
        </div>
      </div>

      <%}%>
   </div>
<%=errorMsg%>
</body>
</html>