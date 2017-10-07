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
          <div id="navbar" >
            <ul class="nav navbar-nav navbar-right">
              <li class="active"><a href="#AggregateReports" data-toggle="tab">Aggregate Reports</a></li>
              <li><a href="#ResponseTime" data-toggle="tab">Response Time Graphs</a></li>
            </ul>
          </div>
        </div>
      </nav>


    <div class="tab-content" style="margin-top:60px;">
      <div class="tab-pane active" id="AggregateReports" style="margin-right:85%;color:#333;">
        <h4 class="text-center" style="color:#777;">PRODUCT NAME</h4>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%
     //String binDir = System.getProperty("user.dir").toString();
     String currDir = "..\\webapps\\ROOT";
     String name    = request.getParameter("testNumber");
     String fullFolderLocationAggregate = "";
     String fullFolderLocationResponseTime = "";
     String desiredFolder = "";
     File mainFolder = new File(currDir);
     File[] mainFolders = mainFolder.listFiles();
     String testTime = "";String testValue = "";
     String errorMsg = "";String fileName = "";
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
                  desiredFolder = name + "_" + testValue;
                  fullFolderLocationAggregate = currDir +"\\"+desiredFolder+"\\AggregateReport";
                  fullFolderLocationResponseTime = currDir +"\\"+desiredFolder+"\\ResponseTime";
                  //fullFolderLocationResponseCode = currDir +"\\"+desiredFolder+"\\ResponseCode";
                  File folderAggregate    = new File(fullFolderLocationAggregate);
                  File folderResponseTime    = new File(fullFolderLocationResponseTime);
                  //File folderResponseCode    = new File(fullFolderLocationResponseCode);
                  File[] listOfFoldersAggregate = folderAggregate.listFiles();
                  File[] listOfFoldersResponseTime = folderResponseTime.listFiles();
                  //File[] listOfFoldersResponseCode = folderResponseCode.listFiles();
                for(int i=0; i < listOfFoldersAggregate.length;i++)
                    {
                     String prodNameWithExtension    = listOfFoldersAggregate[i].getName();
                     String prodName = prodNameWithExtension.replace(".csv","");
                     String pathProductAggregate = desiredFolder+"\\AggregateReport"+prodNameWithExtension;
             %>

         <ul style="list-style:none;">
           <li style="text-decoration:none;">
             <a class="btn cont" href="#<%=prodName%>" style="color:#777;cursor:pointer;text-decoration:none;">
                <%=prodName%>
             </a>
           </li>
         </ul>
         <%
         FileReader fileReader = new FileReader(tempFileFullPath);
         BufferedReader bufferedReader = new BufferedReader(fileReader);
         }}%>
      </div>








      <div class="tab-pane" id="ResponseTime">
         Step 2
         <a class="btn cont" href="#">sdsgsd</a>
      </div>
   </div>

</body>
</html>