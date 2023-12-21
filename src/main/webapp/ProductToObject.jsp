<%-- 
    Document   : ProductList
    Created on : 2023年12月20日, 下午3:30:38
    Author     : student
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.mycompany.logindemo.ProductModel"%>
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
           ArrayList<ProductModel> rows = new ArrayList();            
       %>
       <%
          String sql = "Select * from classicmodels.products where productLine = '";          
          DBConGenerator dbg = new DBConGenerator();
          con = dbg.getConnction();
          stmt = con.createStatement();
          //
          try {
            rs = stmt.executeQuery("select productCode,productName,productScale,quantityInStock from classicmodels.products");           
            
            // 將每一筆在資料表內的資料轉換成 Java Object,  這行為通稱 ORM 
            while(rs.next() ) {
                ProductModel pm1 = new ProductModel();
                pm1.ProductCode = rs.getString("productCode");
                pm1.ProductName = rs.getString("productName");
                pm1.ProductScale=rs.getString("productScale");
                pm1.qty = rs.getInt("quantityInStock");
                // out.print("新增: " +rs.getString("productName")+"<BR>" );
                rows.add(pm1);
            }
            // 釋放所有資源
            rs.close();
            stmt.close();
            con.close();            
            }catch(Exception e) {            
            }
       %>
    <body>
        <h1>商品列表</h1>
        <h3> 查詢類型: <%= productLine %> </h3>        
        <table style="width:80%" id="customers">     
            <tr>
              <th>產品代號</th>
              <th>產品名稱</th> 
              <th>模型比例</th>
              <th>庫存數量</th>              
              <th>購物</th>
            </tr>
                  
            <%  for(ProductModel pm : rows ) {%>   
            <tr>                
              <td><%= pm.ProductCode %></td>
              <td><%= pm.ProductName %></td>
              <td><%= pm.ProductScale %></td>
              <td><%= pm.qty %></td>
              
              <td><a href="<%= pm.ProductCode %>">加入購物</a> </td>
            </tr>
            <% } %>
    </table>
    目前共有 <%= rows.size() %> 筆模型資料
    </body>
</html>
