<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="../../favicon.ico">

    <title>Gale Reports</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <![endif]-->
    <style>
        .modal-dialog {
          width: 100%;
          height: 100%;
          margin: 0;
          padding: 0;
        }

        .modal-content {
          height: auto;
          min-height: 100%;
          border-radius: 0;
        }

        body {
            margin: 0;
        }
    </style>
</head>

<body>

  <nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">GALE REPORTS (संग्रहालय)</a>
        </div>
  </nav>

  <!-- Main jumbotron for a primary marketing message or call to action -->
  <div class="jumbotron">
    <div class="container">
        <h1 class="text-center">JMETER HTML REPORTS</h1>
    </div>
  </div>


<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%

     File folder = new File("C:\\Users\\saurabhrai\\Downloads\\apache-tomcat-8.5.15\\apache-tomcat-8.5.15\\webapps\\ROOT\\reportDATA");
     File[] listOfFolders = folder.listFiles();

%>
  <div class="container">
     <div class="row">

<%for(int i=0; i < listOfFolders.length;i++){%>
<%
   String prodName = listOfFolders[i].getName();
   String addrReport ="reportDATA/" + prodName + "/index.html";
   String modalHeader = prodName + " REPORT";
 %>

 <%--MODAL --%>

        <a role="button" class="btn btn-info btn-lg col-md-4" data-toggle="modal" data-target="#<%=prodName%>"><%=prodName%></button>
        <div class="modal fade" id="<%=prodName%>" role="dialog">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title"><%=modalHeader%></h4>
                    </div>
                    <div class="modal-body">
                       <iframe src="<%=addrReport%>" width="1200" height="700" scrolling="none" frameborder="0" ></iframe>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

<%}%>
    </div>
  </div>

    <hr>

    <footer>
        <p>&copy; 2017 QA Infotech PVT LTD</p>
    </footer>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>