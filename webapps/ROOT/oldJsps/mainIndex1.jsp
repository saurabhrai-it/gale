
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
        .navbar-brand{
        text-align : center;
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

        <div class="col-md-4">
            <p><a class="btn btn-default" href="#" role="button"><%=listOfFolders[i].getName()%></a></p>
        </div>
       <%}%>
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
