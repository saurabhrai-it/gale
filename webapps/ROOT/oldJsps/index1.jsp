<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="../../favicon.ico">

    <title>Gale Reports</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <%
        String serverIP = request.getLocalAddr();
    %>
    <script>
        var testNumber = prompt("Please enter the load test number(eg. 1947)", "1947");
        window.location = "http://<%=serverIP%>:8080/home.jsp?testNumber=" + encodeURIComponent(testNumber);
    </script>
</head>
</html>