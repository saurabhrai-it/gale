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

    <![endif]-->
    <script>
    </script>
</head>

<body>

  <nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">GALE REPORTS</a>
        </div>
  </nav>



<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%
     //String binDir = System.getProperty("user.dir").toString();
     String currDir = "../webapps/ROOT/";
     String name    = request.getParameter("testNumber");
     String tempFolderLoc = "LoadTestResults_"+name;
     String fullFolderLocation = "";
     String desiredFolder = "";
     File mainFolder = new File(currDir);
     File[] mainFolders = mainFolder.listFiles();
     String testTime = "";String testValue = "";
     String errorMsg = "";String fileName = "";
     for(int j=0; j < mainFolders.length;j++)
     {
        fileName = mainFolders[j].getName().toString();
        if(fileName.startsWith(tempFolderLoc.toString()))
          {
            %>File after conditions are :  <%=fileName%><%
            if(fileName.endsWith("28800"))
              {
                testTime = "8 Hours";testValue = "28800";
              }
            else if(fileName.endsWith("7200"))
              {
                testTime = "2 Hours";testValue = "7200";
              }
            else
              {
                errorMsg = "<strong color='red'>Unable to fetch data!</strong>";
              }
              break;
          }
     }
     if(errorMsg=="")
     {
        desiredFolder = tempFolderLoc + "_" + testValue;
        fullFolderLocation = currDir +"\\"+desiredFolder;
        File folder    = new File(fullFolderLocation);
        File[] listOfFolders = folder.listFiles();

%>
  <div class="jumbotron">
    <div class="container">
        <h2 class="text-center">RESULTS-LOAD TEST <%=name%>(<%=testTime%> Duration)</h1>
    </div>
  </div>

  <div class="container">
     <div class="row">

<%   for(int i=0; i < listOfFolders.length;i++)
    {
     String prodName    = listOfFolders[i].getName();
     String addrReport  = desiredFolder +"/"+ prodName + "/index.html";
 %>
    <a role="button" class="btn btn-info btn-lg col-xs-3 col-xs-offset-1" href="<%=addrReport%>" target="_blank" style="margin-bottom:1em"><%=prodName%></a>
<%}}%>
     </div>
  </div>

    <footer>
        <p class="text-center" style="">&copy; 2017 QA Infotech PVT LTD</p>
    </footer>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>