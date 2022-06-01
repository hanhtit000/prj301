<%-- 
    Document   : login
    Created on : May 27, 2022, 7:51:55 AM
    Author     : Ngo Tung Son
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="login" method="POST">
            USername: <input type="text" name="user"/><br/>
            Password: <input type="password" name="pass"/> <br/>
            <input type="submit" value="Login"/>
        </form>
    </body>
</html>
