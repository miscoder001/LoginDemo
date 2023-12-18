<%-- 
    Document   : D
    Created on : 2023年12月15日, 下午4:33:15
    Author     : student
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>我想知道 你到底從哪邊過來的? ( Page B or Page C ??)</h1>
        答案：<%= request.getHeader("Referer") %>
                
    </body>
</html>
