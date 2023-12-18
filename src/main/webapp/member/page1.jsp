<%-- 
    Document   : page1
    Created on : 2023年12月15日, 上午9:10:48
    Author     : student
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%! 
        HttpSession session; 
        String memberName;
    %>
    <%
       // 檢查特徵 如果欠缺該有的 設定 請使用者重新登入 
        session = request.getSession();
        if( session.getAttribute("username")== null ) {
            //response.sendRedirect("/LoginDemo/login.jsp");            
            response.sendRedirect("nologin.html");            
        } else {
            memberName = session.getAttribute("username").toString();
        }       
    %>
    <body>
        <h3> 會員: <%= memberName %>  </h3>
        <h1>歡迎使用 xxx 會員系統</h1>
    </body>
</html>
