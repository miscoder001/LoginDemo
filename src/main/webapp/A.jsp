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
        <body>
            <h1> 執行前請記得將  mariadb-java-client-x.x.x.jar 放到 tomcat/lib 目錄下 </h1>
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
                out.print("連線成功<br>");
            
        // 3. 建立SQL 對應的查詢物件
           stmt = con.createStatement();
        // 4. 執行查詢後取得結果
           rs = stmt.executeQuery(sql);
           /*
           rs.next(); // 下一筆
           rs.previous(); // 上一筆
           rs.first(); // 第一筆           
           rs.last(); //最後一筆
           */
        // 5. 顯示資料集
        out.print("<table>");
        while( rs.next() ) {
            out.print("<tr>");
                out.print("<td>");
                out.print("姓名:");
                out.print("</td>");
                out.print("<td>");
                out.print(rs.getString("name") );
                out.print("</td>");

                out.print("<td>");
                out.print("email"); 
                out.print("</td>");
                out.print("<td>");
                out.print(rs.getString(3));
                out.print("</td>");
            out.print("</tr>");            
        }
        out.print("</table>");
        // 6. 結束
        
        }catch(SQLException e) {
                out.print("連線失敗:" + e.getMessage() + "<br>");
        }

    %> 
        <h1> Page A </h1>
        <a href="B.jsp">Page_B</a>        
       
    </body>
</html>
