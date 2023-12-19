
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>修改 JSP Title 標題</title>
        <style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}
</style>
    </head>
        <body>
            <h1> 會員列表</h1>
    <%        
        // 示範 資料庫連線 六大步驟
        // 所有跟資料庫有關的 定義都在  java.sql*
        Connection con;
        Statement stmt;
        ResultSet rs;        
        // 1. 載入資料庫驅動
        try{
            Class.forName("org.mariadb.jdbc.Driver");
            out.println("系統成功載入 jdbc 驅動程式<br>");
        }catch(Exception e ) {
            out.println("系統找不到 jdbc 驅動程式<br>");
        }
        // 2. 建立連線
        String sql = "select * from user;";
        try {        
           con = DriverManager.getConnection("jdbc:mariadb://127.0.0.1/webdb", "root", "12345");                
           stmt = con.createStatement();
           rs = stmt.executeQuery(sql);
        %>
        <table>
            <tr>
              <th>員工編號</th>
              <th>姓名</th>
              <th>電子郵件</th>
            </tr>
        <%
            while(rs.next()) {
        %>
        <tr>
            <td style="ba"><%= rs.getInt(1) %></td>
            <td><%= rs.getString(2) %></td>
          <td><%= rs.getString(3) %></td>
        </tr>
        <% } %>  
      </table>
        // 6. 結束
     <%   
        }catch(SQLException e) {
                out.print("連線失敗:" + e.getMessage() + "<br>");
        }

    %> 
        
       
    </body>
</html>
