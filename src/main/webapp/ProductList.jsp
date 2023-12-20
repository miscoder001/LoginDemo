<%-- 
    Document   : ProductList
    Created on : 2023年12月20日, 下午3:30:38
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
        <h1>商品列表</h1>
        <h3> 查詢類型: <%= request.getParameter("pl") %> </h3>
    </body>
</html>
