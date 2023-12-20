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
        <h2> 提示: <%= request.getAttribute("errmsg") %>    </h2>
        <h2> 提示: <%= request.getAttribute("msg2") %>    </h2>
    </body>
</html>
