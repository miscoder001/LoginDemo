<%-- 
    Document   : ToShoppingCart
    Created on : 2023年12月21日, 上午9:37:34
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
        <h1>購物項目</h1>
        您剛點選的產品是: <%= request.getParameter("pid") %>  <br/>
        品名: <%= request.getParameter("pname") %>
                
        
    </body>
</html>
