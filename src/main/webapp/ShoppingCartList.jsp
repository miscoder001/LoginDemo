<%-- 
    Document   : ShoppingCartList
    Created on : 2023年12月22日, 上午9:36:11
    Author     : student
--%>

<%@page import="com.mycompany.logindemo.CartItem"%>
<%@page import="com.mycompany.logindemo.ProductModel"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            table {
              border-collapse: collapse;
              width: 85%;
              margin-left: auto;
              margin-right: auto;
            }

            th, td {
              padding: 8px;
              text-align: left;
              border-bottom: 1px solid #ddd;
            }

            tr:hover {background-color:#f5ff5f;}
        </style>
    </head>
    <%
        ArrayList<CartItem> cart = null;
        cart = (ArrayList) session.getAttribute("cart");
        // 購物車上未建立 或是 空的
    %>
    <body>
        <h1>購物明細如下</h1>
        
        <% if(cart != null && cart.size() > 0 ) { %>        // 請注意此行用 || && 的邏輯問題
            <table>
            <tr>
              <th>產品編號</th>
              <th>產品名稱</th>
              <th>訂購數量</th>
            </tr>
            <%--  如有商品 在此處進行迴圈 顯示購物車內商品--%>
            <% for(CartItem cpm : cart) { %>
                <tr>
                  <td><%= cpm.getProductCode() %></td>
                  <td><%= cpm.getProductName() %></td>
                  <td><%= cpm.getQty() %></td>
                </tr>
            <% } %>
           </table>
        <% } else { %>
            <h2> 您尚未有任何商品放入購物車 </h2>
        <% } %>
    </body>
</html>
