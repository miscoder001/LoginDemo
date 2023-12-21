<%-- 
    Document   : ProductList
    Created on : 2023年12月20日, 下午3:30:38
    Author     : student
--%>

<%@page import="com.mycompany.logindemo.DBConGenerator"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            table, th, td {
              border: 1px solid black;
              padding: 5px;
            }
            table {
              border-spacing: 15px;
            }
            #customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #04AA6D;
  color: white;
}
        </style>
    </head>
    <%--  
            1. 連結資料庫
            2. 取得連線
            3. 根據條件 建立 sql -->  select * from products where productLine  符合 classic cars , motorcycle, vintage cars .....
            4. 送出查詢 取得結果
            5. 安排迴圈顯示在 table 內
       --%>
       <%!
           java.sql.Connection con = null;
           java.sql.ResultSet rs = null;
           Statement stmt = null;
           String productLine = null;
           String shoppingUrl = "#";
       %>
       <%
           String v = request.getParameter("pl") ;
          int plType = 0;
          if( v == null ) {
            plType = 1;
           } else {
            plType = Integer.parseInt(v);
           }
          // 請注意 跨資料庫查詢時要加上  Database.Table 格式
          String sql = "Select * from classicmodels.products where productLine = '";          
          
          // 準備資料查詢工作
          DBConGenerator dbg = new DBConGenerator();
          con = dbg.getConnction();
          stmt = con.createStatement();
          //
          
          switch( plType ) {
              case 1:
                  // 這是 選項一  : Class Cars
                  productLine = "Classic Cars";
                  sql = sql + productLine +"';";
                  break;
              case 2:
                  // 這是 選項一  : Class Cars
                  productLine = "Motorcycles";
                  sql = sql + productLine +"';";
                  break;
          }
          try {
            rs = stmt.executeQuery(sql);
           }catch( Exception e) { }
       %>
    <body>
        <h1>商品列表</h1>
        <h3> 查詢類型: <%= productLine %> </h3>
        <h3>語法: <%= sql %> </h3>
        <table style="width:100%" id="customers">     
            <tr>
              <th>產品代號</th>
              <th>產品名稱</th> 
              <th>模型比例</th>
              <th>庫存數量</th>
              <th>售價</th>
              <th>購物</th>
            </tr>
       <%--   rs.next 迴圈開始 --%> 
       <% try {
            while(rs.next() ) {
                shoppingUrl = "ToShoppingCart.jsp?pid="+rs.getString("productCode") + "&pname=" + rs.getString("productName");
                
       %>
            <tr>
              <td><%= rs.getString("productCode") %></td>
              <td><%= rs.getString("productName") %></td>
              <td><%= rs.getString("productScale") %></td>
              <td><%= rs.getInt("quantityInStock") %></td>
              <td><%= rs.getBigDecimal("MSRP").toString() %></td>
              <td><a href="<%= shoppingUrl %>">加入購物</a> </td>
            </tr>
        <% }
            // 釋放所有資源
            rs.close();
            stmt.close();
            con.close();
            }catch(Exception e) {
            
            }
        %>
    </table>
    </body>
</html>
