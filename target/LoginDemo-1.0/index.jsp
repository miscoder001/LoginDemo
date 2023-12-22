<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%!
        // 每一個連線 預設都會分配一個 seesion
        HttpSession session ;
    %>    
    <%
       session = request.getSession();       
       
    %>
    
    <body>
        <h5>使用者資訊</h5>
        
        <h1>會員登入系統 : session id: <%= session.getId() %>  </h1>
        <a href="/LoginDemo/login.jsp">會員登入</a>
        
        <a href="ProductQuery.jsp">模型商品</a>
        <a href="ShoppingCartList.jsp">檢視購物車</a>
        
    </body>
</html>
