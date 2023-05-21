<%@ page language="java"
import="java.net.*"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
      <meta charset="UTF-8" />
      <meta http-equiv="X-UA-Compatible" content="IE=edge" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <link rel="stylesheet" href="./assets/font/stylesheet.css" />
      <link rel="stylesheet" href="./assets/css/reset.css" />
      <link rel="stylesheet" href="./assets/css/style-login-register.css" />
      <title>Đăng Nhập</title>
  </head>
  <body>
    <body>
      <div class="content">
        <div class="sub_content">
          <div class="logo_img">
              <a href="index.jsp"><img src="./assets/img/logo.png" alt="Thợ Code Bán Giày" /></a>
          </div>
          <%String cart = request.getParameter("cart");
          String product = request.getParameter("product");
          String productJson = request.getParameter("productJson");
          String quantity = request.getParameter("quantity");
          String size = request.getParameter("size");%>
          <h1>Đăng nhập</h1>
          <form class="info" method="post" action="Login">
            <div>
              <%if(cart != null) {%> 
                <input type="hidden" name = "cart" value = "true">
              <%}%>
              <%if(product != null) {%> 
                <input type="hidden" name = "product" value = "true">
                <input type="hidden" name = "productJson" value = "<%=URLEncoder.encode(productJson, "UTF-8")%>">
                <input type="hidden" name = "quantity" value = "<%=quantity%>">
                <input type="hidden" name = "size" value = "<%=size%>">
              <%}%>
              <p class="frame">
                <input type="text" id="query" name="userId" placeholder="Tên Đăng Nhập" />
              </p>
              <p class="frame">
                <input type="password" id="password" name="password" placeholder="Mật Khẩu" required />
              </p>
              <p class="frame_display_password">
                <input id="display_password" type="checkbox" onclick="display_password_func()" />
                <script>
                  function display_password_func() {
                    var x = document.getElementById("password");
                    if (x.type === "password") {
                        x.type = "text";
                    } else {
                        x.type = "password";
                    }
                  }
                </script>
                <label for="display_password">Hiện Mật Khẩu</label>
              </p>
              <p class="frame login">
                  <input class="login" type="submit" value="Đăng nhập" />
              </p>
            </div>
          </form>
          <p class="no_account">
            Bạn chưa có tài khoản? <a class="register" href="register.jsp"><i>Đăng ký tại đây</i></a><br>
          </p>
          ${message}
        </div>
      </div>
    </body>
  </body>
</html>