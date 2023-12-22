<%-- 
    Document   : CheckOut
    Created on : 2023年12月22日, 上午11:07:17
    Author     : student
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ooxx電商</title>
        <style>
            input[type=text], select {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
          }

          input[type=submit] {
            width: 100%;
            background-color: #4CAF50;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            border-radius: 4px;
            cursor: pointer;
          }

          input[type=submit]:hover {
            background-color: #45a049;
          }

          div {
            border-radius: 5px;
            background-color: #f2f2f2;
            padding: 20px;
          }
          
          .container {
  display: block;
  position: relative;
  padding-left: 35px;
  margin-bottom: 12px;
  cursor: pointer;
  font-size: 22px;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

/* Hide the browser's default radio button */
.container input {
  position: absolute;
  opacity: 0;
  cursor: pointer;
}

/* Create a custom radio button */
.checkmark {
  position: absolute;
  top: 0;
  left: 0;
  height: 25px;
  width: 25px;
  background-color: #eee;
  border-radius: 50%;
}

/* On mouse-over, add a grey background color */
.container:hover input ~ .checkmark {
  background-color: #ccc;
}

/* When the radio button is checked, add a blue background */
.container input:checked ~ .checkmark {
  background-color: #2196F3;
}

/* Create the indicator (the dot/circle - hidden when not checked) */
.checkmark:after {
  content: "";
  position: absolute;
  display: none;
}

/* Show the indicator (dot/circle) when checked */
.container input:checked ~ .checkmark:after {
  display: block;
}

/* Style the indicator (dot/circle) */
.container .checkmark:after {
 	top: 9px;
	left: 9px;
	width: 8px;
	height: 8px;
	border-radius: 50%;
	background: white;
}
        </style>
    </head>    
    <%       
        boolean notLogin = false;
        String member = null;         
         if( session.getAttribute("username") == null ) {
            member = "尚未登入 三秒後你會看到 login ";       
            notLogin = true;
            // UI 加上提示  3秒後轉送到登入
            // response.sendRedirect("login.jsp");
        } else {
            member = session.getAttribute("username").toString();
        }
    %>
    <body>
        <h5> 會員:  <%= member %> </h5>
        <div id="loginRemind"></div>
        <div id="loginRemind2"></div>
        <h1>結帳</h1>
        
            <div>
            <form action="/LoginDemo/OrderProcess">
              <label for="recipient">收件人</label>
              <input type="text" id="recipient" name="recipient" placeholder="Your name..">

              <label for="address">地址</label>
              <input type="text" id="address" name="address" placeholder="宅配請輸入您的收貨地址">
              <h5>付款方式</h5>
              <label class="container">ATM轉帳
                  <input type="radio" checked="checked" name="payment" value="a">
                  <span class="checkmark"></span>
                </label>
                <label class="container">貨到付款
                  <input type="radio" name="payment" value="b">
                  <span class="checkmark"></span>
                </label>
                <label class="container">超商繳費
                  <input type="radio" name="payment" value="c">
                  <span class="checkmark"></span>
                </label>
                <label class="container">線上刷卡
                  <input type="radio" name="payment" value="d">
                  <span class="checkmark"></span>
                </label>

              <label for="shipping">出貨方式</label>
              <select id="shipping" name="shipping">
                <option value="post">宅配(貨到付款)</option>
                <option value="family">全家</option>
                <option value="711">7-11</option>
              </select>

              <input type="submit" value="送出訂單">
            </form>
        </div>        
    </body>    
    <% if( notLogin ) { %>
    <script>
        // 進行三秒倒數  時間到 將使用者轉走到 login.jsp
        var countdown=5;
        var countdown2=500;
        var c1 = window.setInterval(notifyMessage, 1000)
        var c2 = window.setInterval(notifyMessage2, 2000)
        function notifyMessage() {            
            document.getElementById('loginRemind').innerHTML = "系統即將轉送到登入頁面,請稍後" + countdown;
            
            if( countdown-- == 0 ) {
                window.clearInterval(c1)
                window.clearInterval(c2)
                location.href = 'login.jsp'
                
            }
            
        }
        function notifyMessage2() {            
            document.getElementById('loginRemind2').innerHTML = "不同計時器 " + countdown2;
            if( countdown2-- == 0 ) {
                
            }
            
        }
        // 每一秒鐘 去更新頁面 告知 user 
        
                /*
                setTimeout(gotoLogin, 3000);  // 三秒後 執行一次
                function gotoLogin() {
                    // 通知資訊 告知使用者 三秒後將轉走
                    location.href='login.jsp';
                }
            */
    </script> 
    <% } %>
</html>
