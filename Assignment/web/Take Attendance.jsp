<%-- 
    Document   : newjsp
    Created on : May 31, 2022, 11:56:51 PM
    Author     : ASUS
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Calendar" %>
<%@page import="java.util.Date" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="action" method="post" name="takeattend">
            <h1>Take Attendance</h1>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Student Code</th>
                        <th>Sur Name</th>
                        <th>Mid Name</th>
                        <th>Given Name</th>
                        <th>Message</th>
                        <th>Attendance</th>
                    </tr>
                </thead>
                <tbody>
                <c:if test="${requestScope.liststudent ne null}"><p>ngu</p></c:if>
                    <c:forEach items="${requestScope.liststudent}" var="stu">
                        <tr>
                            <td>${stu.studentId}</td>
                            <td>${stu.studentCode}</td>
                            <td>${stu.surName}</td>
                            <td>${stu.midName}</td>
                            <td>${stu.givenName}</td>
                            <td><input type="text" name="mess"/></td>
                            <td><input type="checkbox" name="cbox"/></td>
                        </tr>
                    </c:forEach>
            </tbody>
            </table>
            <input type="submit" name="Send"/>
        </form>
    </body>
</html>
