<%-- 
    Document   : A
    Created on : 2023年12月15日, 下午4:28:34
    Author     : student
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>修改 JSP Title 標題</title>
    </head>
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
        try {
            try {
            con = DriverManager.getConnection("jdbc:mariadb://127.0.0.1/webdb", "root", "12345");
                out.print("連線成功<br>");
            }catch(SQLException e) {
                out.print("連線失敗:" + e.getMessage() + "<br>");
            }
        // 3. 建立SQL 對應的查詢物件
           // stmt = con.createStatement();
        // 4. 執行查詢後取得結果
           // rs = stmt.executeQuery("select * from user;");
        // 5. 顯示資料集
        
        // 6. 結束
        } catch( Exception e ) {
            out.println("資料存取異常");
        }

    %> 
    <body>
        <h1> Page A </h1>
        <a href="B.jsp">Page_B</a>
        
        
    </body>
</html>
