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

        $(document).ready(function(){
          // Add smooth scrolling to all links
          $("a").on('click', function(event) {

            // Make sure this.hash has a value before overriding default behavior
            if (this.hash !== "") {
              // Prevent default anchor click behavior
              event.preventDefault();

              // Store hash
              var hash = this.hash;

              // Using jQuery's animate() method to add smooth page scroll
              // The optional number (200) specifies the number of milliseconds it takes to scroll to the specified area
              $('html, body').animate({
                scrollTop: $(hash).offset().top
              }, 200, function(){

                // Add hash (#) to URL when done scrolling (default click behavior)
                window.location.hash = hash;
              });
            } // End if
          });
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

    th{
     background-color:#ADD8E6;
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
<body style="-webkit-print-color-adjust: exact;">
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

   <div class="footer" style="position:fixed;z-index:999999;bottom:0;right:0;">
   <a href="#goTop" style="text-decoration:none;">
   <button type="button" class="btn btn-secondary" data-toggle="tooltip" data-placement="right" title="GO TOP" style="background-color: Transparent;border: none;outline:none;">
     <span class="glyphicon glyphicon glyphicon-triangle-top" aria-hidden="true"></span>
     <strong>TOP</strong>
   </button></a>
    </div>
    <div class="tab-content">
      <div class="tab-pane active" id="AggregateReports">
      <div class="row" style="margin-right:0;">
      <div class="col-md-2" style="position:fixed;background-color:#f8f8f8;">
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
                  String overallResponseTime;String overallSample = "";
                  String averageResponseTimeSLA = "";String errorSLA = "";
           %>

           <ul style="list-style:none;padding:0px">
           <div class="col-md-4">
           <%
                  for(int i=0; i < listOfFoldersAggregate.length;i++)
                    {
                     prodNameWithExtension  = listOfFoldersAggregate[i].getName();
                     prodName               = prodNameWithExtension.replace(".csv","");
                     pathProductAggregate   = fullFolderLocationAggregate+"\\"+prodNameWithExtension;
                     if(i<18){
             %>
           <li class="addHoverManager">
             <a class="btn cont" id="transit" href="#<%=prodName%>" style="color:#777;cursor:pointer;text-decoration:none;">
                <%=prodName%>
             </a>
           </li>
                    <%}}%>
         </div>
         </ul>

         <ul style="list-style:none;padding:0px">
                    <div class="col-md-4 col-md-offset-2">
                    <%
                           for(int i=0; i < listOfFoldersAggregate.length;i++)
                             {
                              prodNameWithExtension  = listOfFoldersAggregate[i].getName();
                              prodName               = prodNameWithExtension.replace(".csv","");
                              pathProductAggregate   = fullFolderLocationAggregate+"\\"+prodNameWithExtension;
                              if(i>17){
                      %>
                    <li class="addHoverManager">
                      <a class="btn cont" id="transit" href="#<%=prodName%>" style="color:#777;cursor:pointer;text-decoration:none;">
                         <%=prodName%>
                      </a>
                    </li>
                             <%}}%>
         </div>
         </ul>

         </div>
         <div class="col-md-4 col-md-offset-2">
            <h4 class="text-center" style="background-color:#C2B280;color:white;padding-top:10px;padding-bottom:10px;border-radius:10px;">Overall Average Response Time And Sample Counts For Individual Products</h4>
            <table class="table table-bordered table-hover" style="font-size:14px;">
            <thead>
                         <tr>
                           <th>Products</th>
                           <th>Average Response Time(Seconds)</th>
                           <th>Samples</th>
                         </tr>
            </thead>
            <tbody>
            <%
                              for(int j=0; j < listOfFoldersAggregate.length;j++)
                                {
                                 prodNameWithExtension  = listOfFoldersAggregate[j].getName();
                                 prodName               = prodNameWithExtension.replace(".csv","");
                                 pathProductAggregate   = fullFolderLocationAggregate+"\\"+prodNameWithExtension;
                                 String lineOverall;
                                 String[] dataInLineOverall;
                                 FileReader fileReaderOverall         = new FileReader(pathProductAggregate);
                                 BufferedReader bufferedReaderOverall = new BufferedReader(fileReaderOverall);
                                 while ((lineOverall = bufferedReaderOverall.readLine()) != null) {
                                     if(lineOverall.startsWith("TOTAL"))
                                     {
                                            dataInLineOverall        = lineOverall.split(",");
                                            overallSample            = dataInLineOverall[1];
                                            overallResponseTime      = String.format("%.03f", Float.parseFloat(dataInLineOverall[2])/1000);
                                     }
                                     else
                                       continue;
            %>
            <tr>
                <td><%=prodName%></td>
                <td class="text-center"><%=overallResponseTime%></td>
                <td><%=overallSample%></td>
            </tr>
            <%
                                }}
            %>
          </tbody>
         </table>
         </div>


         <div class="col-md-3 col-md-offset-0">
                     <h4 class="text-center" style="background-color:#C2B280;color:white;padding-top:10px;padding-bottom:10px;border-radius:10px;">Average Response Time Above SLA(>3 Sec)</h4>
                     <table class="table table-bordered table-hover" style="font-size:14px;">
                     <%
                                       for(int k=0; k < listOfFoldersAggregate.length;k++)
                                         {
                                          prodNameWithExtension  = listOfFoldersAggregate[k].getName();
                                          prodName               = prodNameWithExtension.replace(".csv","");
                                          pathProductAggregate   = fullFolderLocationAggregate+"\\"+prodNameWithExtension;
                                          String lock = "TRUE";
                                          String lineOverallSLA;
                                          String[] dataInLineOverallSLA;
                                          FileReader fileReaderOverallSLA         = new FileReader(pathProductAggregate);
                                          BufferedReader bufferedReaderOverallSLA = new BufferedReader(fileReaderOverallSLA);
                                          while ((lineOverallSLA = bufferedReaderOverallSLA.readLine()) != null) {
                                              if((!lineOverallSLA.startsWith("TOTAL"))&&(!lineOverallSLA.startsWith("sampler_label")))
                                              {
                                                     dataInLineOverallSLA     = lineOverallSLA.split(",");
                                                     averageResponseTimeSLA   = dataInLineOverallSLA[2];
                                                     Float tempAvgResSLA      = Float.parseFloat(averageResponseTimeSLA)/1000;
                                                     if(tempAvgResSLA>3.0)
                                                     {

                     %>
                                                                                 <thead>
                                                                                    <tr>
                                                                                    <%if(lock.equals("TRUE"))
                                                                                      {%>
                                                                                         <th colspan=2 class="text-center"><%=prodName%></th>
                                                                                      <%}%>
                                                                                    </tr>
                                                                                 </thead>
                                                                                 <tbody>
                                                                                       <tr>
                                                                                            <td><%=dataInLineOverallSLA[0]%></td>
                                                                                            <td><%=String.format("%.03f", tempAvgResSLA)%></td>
                                                                                      </tr>
                                                                                 </tbody>

                    <%                                lock = "FALSE";

                                                     }
                                              }
                                              else
                                                continue;

                                         }}
                     %>
                  </table>
         </div>








         <div class="col-md-3 col-md-offset-0" id="HideIfNoError">
                    <h4 class="text-center" style="background-color:#C2B280;color:white;padding-top:10px;padding-bottom:10px;border-radius:10px;">Error Above SLA(>2%)</h4>
                                         <table class="table table-bordered table-hover" style="font-size:14px;">
                                         <%
                                                           String isError = "FALSE";
                                                           for(int k=0; k < listOfFoldersAggregate.length;k++)
                                                             {
                                                              prodNameWithExtension  = listOfFoldersAggregate[k].getName();
                                                              prodName               = prodNameWithExtension.replace(".csv","");
                                                              pathProductAggregate   = fullFolderLocationAggregate+"\\"+prodNameWithExtension;
                                                              String lock = "TRUE";
                                                              String lineOverallSLA;
                                                              String[] dataInLineOverallSLA;
                                                              FileReader fileReaderOverallSLA         = new FileReader(pathProductAggregate);
                                                              BufferedReader bufferedReaderOverallSLA = new BufferedReader(fileReaderOverallSLA);
                                                              while ((lineOverallSLA = bufferedReaderOverallSLA.readLine()) != null) {
                                                                  if((!lineOverallSLA.startsWith("TOTAL"))&&(!lineOverallSLA.startsWith("sampler_label")))
                                                                  {
                                                                         dataInLineOverallSLA   = lineOverallSLA.split(",");
                                                                         errorSLA               = dataInLineOverallSLA[7].replace("%","");
                                                                         Float tempErrorSLA     = Float.parseFloat(errorSLA)*100;
                                                                         if(tempErrorSLA>2.0)
                                                                         {

                                         %>
                                                                                                     <thead>
                                                                                                        <tr>
                                                                                                           <%if(lock.equals("TRUE"))
                                                                                                           {%>
                                                                                                             <th colspan=2 class="text-center"><%=prodName%></th>
                                                                                                           <%}%>
                                                                                                        </tr>
                                                                                                        </thead>
                                                                                                        <tbody>
                                                                                                           <tr>
                                                                                                                <td><%=dataInLineOverallSLA[0]%></td>
                                                                                                                <td><%=String.format("%.02f", tempErrorSLA)+"%"%></td>
                                                                                                          </tr>
                                                                                                        </tbody>


                                        <%                                lock = "FALSE";
                                                                          isError = "TRUE";
                                                                         }
                                                                  }
                                                                  else
                                                                    continue;
                                                             }}
                                                             if(isError.equals("FALSE")){
                                         %>
                                                                <style>
                                                                    #HideIfNoError{
                                                                    display: none;
                                                                    }
                                                                </style>
                                         <%}%>
                                      </table>
         </div>




         <%
            for(int i=0; i < listOfFoldersAggregate.length;i++)
            {
                    prodNameWithExtension = listOfFoldersAggregate[i].getName();
                    prodName              = prodNameWithExtension.replace(".csv","");
                    pathProductAggregate  = fullFolderLocationAggregate+"\\"+prodNameWithExtension;
         %>
         <div class="col-md-10 col-md-offset-2">
         <div class="text-center" style="background-color:#46C7C7;margin-bottom:10px;margin-top:25px;border-radius:10px;">
            <button type="button" class="btn btn-outline-info btn-xs" style="background-color: Transparent;border: none;outline:none;" >
             <h3 class="text-center" id="<%=prodName%>" style="color:white;"><%=prodName%></h3>
            </button>
         </div>

         <table class="table table-bordered table-hover table-condensed" style="font-size:14px;">
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

                   dataInLine        = line.split(",");
                   String label      = dataInLine[0];

                    if(label.equals("TOTAL"))
                        bold = "class='boldMaker'";

                    if(label.contains("/"))
                       label=label.replaceAll("/"," / ");

                   int sample        = Integer.parseInt(dataInLine[1]);
                   float avg         = Float.parseFloat(dataInLine[2])/1000;
                   float median      = Float.parseFloat(dataInLine[3])/1000;
                   float ninetyline  = Float.parseFloat(dataInLine[4])/1000;
                   float min         = Float.parseFloat(dataInLine[5])/1000;
                   float max         = Float.parseFloat(dataInLine[6])/1000;
                   String error      = dataInLine[7];
                   String throughput = String.format("%.02f", Float.parseFloat(dataInLine[8]));
                   String kbpersec   = String.format("%.02f", Float.parseFloat(dataInLine[9]));
                   String errorString=error.replace("%","");
                   float errorFloat=Float.parseFloat(errorString)*100;
                   if(errorFloat>2.0)
                      errorString = "<td style='color:red;font-weight:600;'>"+String.format("%.02f", errorFloat)+"</td>";
                   else
                      errorString = "<td>"+String.format("%.02f", errorFloat)+"</td>";
                   String avgString;
                   if(avg>=3.0)
                    avgString = "<td style='color:red;font-weight:600;'>"+String.format("%.03f", avg)+"</td>";
                   else
                    avgString = "<td>"+String.format("%.03f", avg)+"</td>";
          %>
             <tr <%=bold%>>
                <td><%=label%></td>
                <td><%=sample%></td>
                <%=avgString%>
                <td><%=String.format("%.03f", median)%></td>
                <td><%=String.format("%.03f", ninetyline)%></td>
                <td><%=String.format("%.03f", min)%></td>
                <td><%=String.format("%.03f", max)%></td>
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
      </div>
         <%}%>
      </div>
      </div>


      <div class="tab-pane" id="ResponseTime">
        <div class="row" style="margin-right:0;">
         <div class="col-md-2" style="position:fixed;background-color:#f8f8f8;">
          <h4 class="text-center" style="color:#111;">PRODUCT NAME</h4>
          <ul style="list-style:none;padding:0px">
              <div class="col-md-4">
                    <%
                           for(int i=0; i < listOfFoldersResponseTime.length;i++)
                             {
                              prodResTimeWithExtension  = listOfFoldersResponseTime[i].getName();
                              prodResTime               = prodResTimeWithExtension.replace(".png","");
                              pathProductResTime   = fullFolderLocationResponseTime+"\\"+prodResTimeWithExtension;
                              if(i<18){
                      %>
                    <li class="addHoverManager">
                      <a class="btn cont" id="transit" href="#<%=prodResTime%>ResTime" style="color:#777;cursor:pointer;text-decoration:none;">
                         <%=prodResTime%>
                      </a>
                    </li>
                             <%}}%>
              <div>
              </ul>

              <ul style="list-style:none;padding:0px">
              <div class="col-md-4 col-md-offset-2">
                                  <%
                                         for(int i=0; i < listOfFoldersResponseTime.length;i++)
                                           {
                                            prodResTimeWithExtension  = listOfFoldersResponseTime[i].getName();
                                            prodResTime               = prodResTimeWithExtension.replace(".png","");
                                            pathProductResTime   = fullFolderLocationResponseTime+"\\"+prodResTimeWithExtension;
                                            if(i>17){
                                    %>
                                  <li class="addHoverManager">
                                    <a class="btn cont" id="transit" href="#<%=prodResTime%>ResTime" style="color:#777;cursor:pointer;text-decoration:none;">
                                       <%=prodResTime%>
                                    </a>
                                  </li>
                                           <%}}%>
              <div>
              </ul>
         </div>

                <div class="col-md-10 col-md-offset-2">
                    <%
                          for(int i=0; i < listOfFoldersResponseTime.length;i++)
                             {
                               prodResTimeWithExtension  = listOfFoldersResponseTime[i].getName();
                               prodResTime               = prodResTimeWithExtension.replace(".png","").replace(".PNG","");
                               pathProductResTime        = "\\"+desiredFolder+"\\ResponseTime\\"+prodResTimeWithExtension;

                    %>
                    <h3 class="text-center" id="<%=prodResTime%>ResTime"><%=prodResTime%></h3>
                    <div class="text-center">
                     <img src="<%=pathProductResTime%>"  class="img-fluid img-thumbnail" alt="<%=prodResTime%> : Response Time Graph" width=700 height=400/>

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