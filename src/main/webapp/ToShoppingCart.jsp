<%-- 
    Document   : ToShoppingCart
    Created on : 2023年12月21日, 上午9:37:34
    Author     : student
--%>

<%@page import="com.mycompany.logindemo.ProductModel"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
       HttpSession session = request.getSession();
       // 購物車的容器用 (Map 存放)   Key( 產品代號 , --> 模型資訊( 品名 , 數量  --> java class 來存放)
       Map<String,ProductModel> shoppingCart = new HashMap<>();
       // 一開始就會有 購物車??????
       if( session.getAttribute("cart") == null ) {
            //跟 sesssion 要求購物車物件  如果沒有 ...
        } else {
            // 使用
        }
    %>
    <body>
        <h1>購物項目</h1>
        您剛點選的產品是: <%= request.getParameter("pid") %>  <br/>
        品名: <%= request.getParameter("pname") %>
        // 取出 session 
        // 將收到的 產品資訊(產品代號,品名, 數量) 
        // 放入購物車(容器, 可存放多筆產品資料)
        // 購物車的結構要怎樣放上述的資料  一筆資料要?  
        // 收到重複的 pid 怎處理?
        
    </body>
</html>
