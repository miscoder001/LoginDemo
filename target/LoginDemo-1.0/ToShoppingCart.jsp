<%-- 
    Document   : ToShoppingCart
    Created on : 2023年12月21日, 上午9:37:34
    Author     : student
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.mycompany.logindemo.CartItem"%>
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
    <%! 
       // 購物車
       ArrayList<CartItem> shoppingCart = null;
       String pid = null, pname = null;
    %>
    <%
       // 檢查使用者現在的狀態
       String user = (String) session.getAttribute("username");
       
       // HttpSession usession = request.getSession();
       // 購物車的容器用 (Map 存放)   Key( 產品代號 , --> 模型資訊( 品名 , 數量  --> java class 來存放)
       shoppingCart = (ArrayList) session.getAttribute("cart");
               
       // 一開始就會有 購物車??????
       if( shoppingCart == null ) {
            //跟 sesssion 要求購物車物件  如果沒有 ...
            shoppingCart = new ArrayList();
            session.setAttribute("cart", shoppingCart); // 讓 shoppingCart 可以隨著瀏覽器 活著 就活著
        } 
        // 製作 CartItem 後放入購物車  35~43
        pid = request.getParameter("pid");
        pname = request.getParameter("pname") ;
        // 檢查 是否已經放在購物車內 
        if( shoppingCart.size() == 0 ) {
            CartItem citem = new CartItem(pid,pname,1);            
            shoppingCart.add(citem);
        } else {
            for(CartItem cti : shoppingCart) {
                if( cti.getProductCode().equals(pid)) {
                    cti.setQty( cti.getQty()+1 );
                } else {
                    CartItem citem = new CartItem(pid,pname,1);      
                    shoppingCart.add(citem);
                }
            }
        }
        //
    %>
    
    <body>
        <h1>購物項目</h1>
        <h2> 您目前有  <%= shoppingCart.size() %>  項產品在購物車內</h2>
        <% if( user == null ) {  %>
            <h3 style="color: #red"> 提醒您 你目前尚未登入 </h3>
        <% } %>
        <hr/>
        您剛點選的產品是: <%=  pid %>  <br/>
        品名: <%= pname %>
        // 取出 session 
        // 將收到的 產品資訊(產品代號,品名, 數量) 
        // 放入購物車(容器, 可存放多筆產品資料)
        // 購物車的結構要怎樣放上述的資料  一筆資料要?  
        // 收到重複的 pid 怎處理?
        
    </body>
</html>
