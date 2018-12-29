<%-- 
    Document   : viewUser
    Created on : Dec 5, 2018, 11:36:33 AM
    Author     : Khanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h2>Hello There</h2>
        <form action="UserServlet?action=viewList" method="POST">

            <input type="submit" value="Submit" name="viewList">                 
       </form>
    </body>
</html>
